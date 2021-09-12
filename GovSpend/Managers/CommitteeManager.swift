//
//  CommitteeManager.swift
//  GovSpend
//
//  Created by Isaac M on 7/31/21.
//

import Foundation

class CommitteeManager: ObservableObject {
    
    @Published var committeeList = [CommitteeInfo]()
    @Published var committeeMetaData: CommitteeData?
    @Published var barChartData:[(name: String, value: Double)] = []
    
    var theRequest: URLRequest?
    let committeeURL = URL(string: K.apiURLs.committees)!
    
    func getCommittees(with committeeUrlString: String) {
        
        let fullURL = URL(string: "\(committeeURL)2020\(committeeUrlString)")!
        
        var request = URLRequest(url: fullURL)
        request.allHTTPHeaderFields = Keys.campaignFinance
        theRequest = request
        
        print(fullURL)
        
        performRequest(with: request)
    }
    
    
    /// - Description:
    ///     1. Initiate URL Session and get Data
    ///     2. Decode data using Model
    ///     3. Assign data to variables
    /// - Parameter urlRequest: URLRequest
    func performRequest(with urlRequest: URLRequest) {
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: theRequest!) { data, response, error in
            
            // ErrorCheck
            if let responseHandling = response as? HTTPURLResponse {
            let responseCode = responseHandling.statusCode
            print(Configs.getHTTPStatusCodeDescription(for: responseCode))
            }
            
            if error == nil {
                let decoder = JSONDecoder()
                if let safeData = data {
                    do {
                        let theCommitteeData = try decoder.decode(CommitteeData.self, from: safeData)
                        
                        //Create Custom Array for Chart
                        var someArray: [(name: String, value: Double)] = []
                        
                        if let committeeFunds = theCommitteeData.results?.first {
                            
                            let pac = committeeFunds.total_from_pacs
                            let individuals = committeeFunds.total_from_individuals
                            let totalContributions = committeeFunds.total_contributions
                            let transfers = committeeFunds.transfers_in
                            let debt = committeeFunds.debts_owed
                            let totalRecepits = committeeFunds.total_receipts
                            
                            someArray.append((name: "PACs", value: ((pac ?? 0.0) as Double)))
                            someArray.append((name: "Individuals", value: ((individuals ?? 0.0) as Double)))
                            someArray.append((name: "Total\nContribs", value: ((totalContributions ?? 0.0) as Double)))
                            someArray.append((name: "Transfers", value: ((transfers ?? 0.0) as Double)))
                            someArray.append((name: "Debts", value: ((debt ?? 0.0) as Double)))
                            someArray.append((name: "Total\nRecepits", value: ((totalRecepits ?? 0.0) as Double)))

                            
                        }
                        
                        
        
                        if let committeeStuff = theCommitteeData.results {
                            DispatchQueue.main.async {
                                
                                self.committeeList = committeeStuff
                                self.committeeMetaData = theCommitteeData
                                self.barChartData = someArray
                                
                                
                            }
                            
                        }
                        
                    } catch {
                        print("DATA Error: \(error.localizedDescription)")
                    }
                }
            }
        }
        task.resume()
        
    }
    
}

//
//  CandidateDetailsManager.swift
//  GovSpend
//
//  Created by Isaac M on 7/8/21.
//

import Foundation

class CandidateDetailsManager: ObservableObject {
    
    @Published var candidateDetails = [Results]()
    @Published var candidateDetailsMetaData: CandidateDetailsData?
    @Published var barChartData:[(name: String, value: Double)] = []
    
    var theRequest: URLRequest?
    let detailsURL = URL(string: K.apiURLs.getCandidateMoneyUrl)!
    
    func getCandidateDetails(with urlEndPiece: String) {
        
        let urlWithName = URL(string: "\(detailsURL)2020\(urlEndPiece)")!
        var request = URLRequest(url: urlWithName)
        request.allHTTPHeaderFields = Keys.campaignFinance
        theRequest = request
        
        print("DetailsView URL \(urlWithName)")
        
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
            print(AppSettings.getHTTPStatusCodeDescription(for: responseCode))
            }
            
            if error == nil {
                let decoder = JSONDecoder()
                if let safeData = data {
                    do {
                        let detailsResult = try decoder.decode(CandidateDetailsData.self, from: safeData)
                        
                        //Create Custom Array for Chart
                        var someArray: [(name: String, value: Double)] = []
                        
                        if let candContribs = detailsResult.results.first {
                            let pac = candContribs.total_from_pacs
                            let individuals = candContribs.total_from_individuals
                            let total = candContribs.total_contributions
                            let receipts = candContribs.total_receipts
                            let loans = candContribs.candidate_loans
                            let pacRefunds = candContribs.pac_refunds
                            let debts = candContribs.debts_owed
                            
                            someArray.append((name: "PACs", value: pac))
                            someArray.append((name: "Individuals", value: individuals))
                            someArray.append((name: "Total Contrib", value: total))
                            someArray.append((name: "Receipts", value: receipts))
                            someArray.append((name: "Loans", value: loans))
                            someArray.append((name: "PAC Refunds", value: pacRefunds))
                            someArray.append((name: "Debts Owed", value: debts))
                        }
                        
                        
                        DispatchQueue.main.async {
                            self.candidateDetails = detailsResult.results
                            self.candidateDetailsMetaData = detailsResult
                            self.barChartData = someArray
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

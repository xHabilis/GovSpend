//
//  FundRaisingManager.swift
//  GovSpend
//
//  Created by Isaac M on 7/16/21.
//

import Foundation

class FundRaisingManager: ObservableObject {

    @Published var fundRaisingSummary: Summary?
    @Published var barChartData:[(name: String, value: Double)] = []

    let searchURL = K.apiURLs.fundRaising

    func getFundRaisingSummary(for CRPCandidateID: String, in cycle: String) {
        let key = Keys.openSecretKey
        
        let fullURL = "\(searchURL)\(CRPCandidateID)&cycle=\(cycle)&output=json&apikey=\(key)"

        performRequest(with: fullURL)
        print(fullURL)
    }
    
    
    /// - Description:
    ///     1. Initiate URL Session and get Data
    ///     2. Decode data using Model
    ///     3. Assign data to variables
    /// - Parameter urlRequest: URLRequest
    func performRequest(with fullURL: String) {
        if let  url = URL(string: fullURL) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) {(data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let fundsSummary = try decoder.decode(FundRaisingData.self, from: safeData)
                            
                            //Create Custom Array for Chart
                            var someArray: [(name: String, value: Double)] = []
                        
                            if let fundNumbers = fundsSummary.response?.summary?.attributes {
                                
                                let theTotal = (fundNumbers.total as NSString).doubleValue
                                let spent = (fundNumbers.spent as NSString).doubleValue
                                let onHand = (fundNumbers.cash_on_hand as NSString).doubleValue
                                let debt = (fundNumbers.debt as NSString).doubleValue
                                
                                someArray.append((name: "Total", value: theTotal))
                                someArray.append((name: "Spent", value: spent))
                                someArray.append((name: "Cash on Hand", value: onHand))
                                someArray.append((name: "Debt", value: debt))
                            }
                            
                            
                            

                            let summary = fundsSummary.response?.summary
                            
                                DispatchQueue.main.async {
                                    self.fundRaisingSummary = summary
                                    
                                    self.barChartData = someArray

                                }

                        } catch {
                            print("DATA \(error.localizedDescription)")
                        }
                    }
                }
        }
            task.resume()
    }
}
}

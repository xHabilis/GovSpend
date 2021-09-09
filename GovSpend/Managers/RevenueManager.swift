//
//  RevenueManager.swift
//  GovSpend
//
//  Created by Isaac M on 8/8/21.
//

import Foundation

class RevenueManager: ObservableObject {
    
    @Published var revenue = [TheRevenue]()

    @Published var barChartData:[(name: String, value: Double)] = []

    
    func getMonthlyRevenue() {
        
        let fullURL = K.apiURLs.revenue
        
        performRequest(with: fullURL)
        //print(fullURL)
    }
    
    func performRequest(with fullURL: String) {
        
        if let  url = URL(string: fullURL) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) {(data, response, error) in
                
                // ErrorCheck
                let responseHandling = response as! HTTPURLResponse
                let responseCode = responseHandling.statusCode
                print(Configs.getHTTPStatusCodeDescription(for: responseCode))
                
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let moneyAll = try decoder.decode(RevenueData.self, from: safeData)
                            
                            //Chart Array Creation
                            var someArray: [(name: String, value: Double)] = []
                            if let taxNonTaxMoney = moneyAll.data {
                                for day in taxNonTaxMoney {
                                    someArray.append((name: "\(day.tag)", value: day.revenueAsDouble))
                  
                                }
                            }

                            if let money = moneyAll.data {
                                DispatchQueue.main.async {
                                    self.revenue =  money
                                    self.barChartData = someArray
                                }
       
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

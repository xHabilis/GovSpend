//
//  RevenueManager.swift
//  GovSpend
//
//  Created by Isaac M on 8/8/21.
//

import Foundation

class TaxRevenueManager: ObservableObject {
    
    @Published var revenue = [TheRevenue]()

    @Published var barChartData:[(name: String, value: Double)] = []

    
    func getTaxRevenue() {
        
        let fullURL = K.apiURLs.taxRevenue
        
        performRequest(with: fullURL)
        //print(fullURL)
    }
    
    func performRequest(with fullURL: String) {
        
        if let  url = URL(string: fullURL) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) {(data, response, error) in
                
                // ErrorCheck
                if let responseHandling = response as? HTTPURLResponse {
                let responseCode = responseHandling.statusCode
                print(Configs.getHTTPStatusCodeDescription(for: responseCode))
                }
                
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let moneyAll = try decoder.decode(TaxRevenueData.self, from: safeData)
                            
                            //Chart Array Creation
                            var someArray: [(name: String, value: Double)] = []
                            if let taxMoney = moneyAll.data {
                                for chart in taxMoney {
                                    someArray.append((name: "\(chart.record_date)", value: chart.revenueAsDouble))

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

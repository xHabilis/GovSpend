//
//  TaxRevenueManager.swift
//  GovSpend
//
//  Created by Isaac M on 9/12/21.
//

import Foundation

class NonTaxRevenueManager: ObservableObject {
    
    @Published var nonTaxRevenue = [NonTax]()

    @Published var barChartData:[(name: String, value: Double)] = []

    
    func getNonTaxRevenue() {
        
        let fullURL = K.apiURLs.nonTaxRevenue
        
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
                print(AppSettings.getHTTPStatusCodeDescription(for: responseCode))
                }
                
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let moneyAll = try decoder.decode(NonTaxRevenueData.self, from: safeData)
                            
                            //Chart Array Creation
                            var someArray: [(name: String, value: Double)] = []
                            if let nonTaxMoney = moneyAll.data {
                                for chart in nonTaxMoney {
                                    someArray.append((name: "\(chart.record_date)", value: chart.revenueAsDouble))

                                }
                            }

                            if let money = moneyAll.data {
                                DispatchQueue.main.async {
                                    self.nonTaxRevenue =  money
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

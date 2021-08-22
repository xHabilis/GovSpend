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
        
        let fullURL = "https://api.fiscaldata.treasury.gov/services/api/fiscal_service/v2/revenue/rcm?fields=record_date,tax_category_desc,net_collections_amt,record_fiscal_year&page[number]=1&page[size]=28&sort=-record_date"
        
        performRequest(with: fullURL)
        print(fullURL)
    }
    
    func performRequest(with fullURL: String) {
        
        if let  url = URL(string: fullURL) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) {(data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let moneyAll = try decoder.decode(RevenueData.self, from: safeData)
                            
                            var someArray: [(name: String, value: Double)] = []

                            if let taxNonTaxMoney = moneyAll.data {
                                for day in taxNonTaxMoney {
                                    someArray.append((name: "\(day.tag)", value: day.revenueAsDouble))
                  
                                }
                            }

                        
                                DispatchQueue.main.async {
                                 
                                    if let money = moneyAll.data {
                                        self.revenue =  money
                                    }
                                    
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

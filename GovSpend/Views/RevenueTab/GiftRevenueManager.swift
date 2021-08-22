//
//  GiftRevenueManager.swift
//  GovSpend
//
//  Created by Isaac M on 8/8/21.
//

import Foundation

class GiftRevenueManager: ObservableObject {
    
    @Published var revenue = [GiftRevenue]()

    @Published var barChartData:[(name: String, value: Double)] = []

    
    func getGiftRevenue() {
        
        let fullURL = "https://api.fiscaldata.treasury.gov/services/api/fiscal_service/v2/accounting/od/gift_contributions?fields=record_date,contribution_amt,record_calendar_month&page[number]=1&page[size]=13&sort=-record_date"
        
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
                            let giftMoneyAll = try decoder.decode(GiftRevenueData.self, from: safeData)
                            
                            var someArray: [(name: String, value: Double)] = []
                            
                            if let giftMoney = giftMoneyAll.data {
                                for day in giftMoney {

                                    someArray.append((name: "\(day.record_date)", value: day.giftAsDouble))
                                }
                            }

                        
                                DispatchQueue.main.async {
                                 
                                    if let money = giftMoneyAll.data {
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

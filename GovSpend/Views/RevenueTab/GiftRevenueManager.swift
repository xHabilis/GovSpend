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
        
        let fullURL = K.apiURLs.giftRevenue
        
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
                            let giftMoneyAll = try decoder.decode(GiftRevenueData.self, from: safeData)
                            
                            //Chart Array Creation
                            var someArray: [(name: String, value: Double)] = []
                            if let giftMoney = giftMoneyAll.data {
                                for day in giftMoney {

                                    someArray.append((name: "\(day.record_date)", value: day.giftAsDouble))
                                }
                            }
                            
                            if let money = giftMoneyAll.data {
                                DispatchQueue.main.async {
                                    
                                    self.barChartData = someArray
                                    self.revenue =  money
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

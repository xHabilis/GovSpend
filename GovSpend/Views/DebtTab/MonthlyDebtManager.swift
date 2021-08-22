//
//  MonthlyDebtManager.swift
//  GovSpend
//
//  Created by Isaac M on 8/8/21.
//

import Foundation

class MonthlyDebtManager: ObservableObject {
    
    @Published var monthlyDebt = [TheDebt]()

    @Published var barChartData:[(name: String, value: Double)] = []
    
    @Published var lineChartData: [Double] = []

    
    func getMonthlyDebt() {
        let fullURL = "https://api.fiscaldata.treasury.gov/services/api/fiscal_service/v2/accounting/od/debt_to_penny?fields=record_date,debt_held_public_amt,%20intragov_hold_amt%20,tot_pub_debt_out_amt&page[number]=1&page[size]=30&sort=-record_date"
        
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
                            let allMonthly = try decoder.decode(MonthlyDebtData.self, from: safeData)
                            
                            var someArray: [(name: String, value: Double)] = []
                            var arrayOfDoubles: [Double] = []
                            
                            if let daysandDebt = allMonthly.data {
                                for day in daysandDebt {
                                    
                                    someArray.append((name: "\(day.record_date)", value: day.debtAsDouble))
                                    
                                    arrayOfDoubles.append(day.debtAsDouble)
                                }
                            }

                        
                                DispatchQueue.main.async {
                                 
                                    if let theDebt = allMonthly.data {
                                        self.monthlyDebt =  theDebt
                                    }
                                    
                                    self.barChartData = someArray
                                    self.lineChartData = arrayOfDoubles
                                    
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

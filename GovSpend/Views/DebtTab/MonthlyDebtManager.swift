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
        let fullURL = K.apiURLs.monthlyDebt
        
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

                            if let theDebt = allMonthly.data {
                                DispatchQueue.main.async {
                                    
                                    self.monthlyDebt =  theDebt
                                    self.barChartData = someArray
                                    self.lineChartData = arrayOfDoubles
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

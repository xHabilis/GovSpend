//
//  AnnualDebtManager.swift
//  GovSpend
//
//  Created by Isaac M on 8/8/21.
//

import Foundation

class AnnualDebtManager: ObservableObject {
    
    @Published var annualDebt = [DebtData]()

    @Published var barChartData:[(name: String, value: Double)] = []

    
    func getAnnualDebt() {
        let fullURL = K.apiURLs.annualDebt
        
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
                            let allAnnualDebt = try decoder.decode(AnnualDebtData.self, from: safeData)
                            
                            //Chart Array Creation
                            var someArray: [(name: String, value: Double)] = []
                            if let yearAndDebt = allAnnualDebt.data {
                                for year in yearAndDebt {
                                    someArray.append((name: "\(year.record_fiscal_year!)", value: year.debtAsDouble))
                                }
                            }
                            
                            if let theDebt = allAnnualDebt.data {
                                DispatchQueue.main.async {
                                    
                                    self.annualDebt =  theDebt
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

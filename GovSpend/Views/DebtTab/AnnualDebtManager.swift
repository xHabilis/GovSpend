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
        let fullURL = "https://api.fiscaldata.treasury.gov/services/api/fiscal_service/v2/accounting/od/debt_outstanding?fields=record_date,debt_outstanding_amt,src_line_nbr,record_fiscal_year&filter=record_fiscal_year:gt:1899?page[number]=1&page[size]=1000"
        
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
                            let allAnnualDebt = try decoder.decode(AnnualDebtData.self, from: safeData)
                            
                            var someArray: [(name: String, value: Double)] = []
                            
                            if let yearAndDebt = allAnnualDebt.data {
                                for year in yearAndDebt {
                                    
                                    someArray.append((name: "\(year.record_fiscal_year!)", value: year.debtAsDouble))
                                }
                            }

                        
                                DispatchQueue.main.async {
                                 
                                    if let theDebt = allAnnualDebt.data {
                                        self.annualDebt =  theDebt
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

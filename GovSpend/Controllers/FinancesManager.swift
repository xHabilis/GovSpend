//
//  PersonalFinanceManager.swift
//  GovSpend
//
//  Created by Isaac M on 7/15/21.
//

import Foundation

class FinancesManager: ObservableObject {
    
    @Published var pfAssets: Assets?
    @Published var pfPositions: Positions?
    @Published var pfProfile: MemberProfile?

    let searchURL = K.apiURLs.personalFinance
    
    func getPersonalFinances(for CRPCandidateID: String) {
        let key = Keys.openSecretKey
        let fullURL = "\(searchURL)\(CRPCandidateID)&output=json&apikey=\(key)"
        
        performRequest(with: fullURL)
        print(fullURL)
    }
    
    
    /// - Description:
    ///     1. Initiate URL Session and get Data
    ///     2. Decode data using Model
    ///     3. Assign data to variables
    /// - Parameter urlRequest: URLRequest
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
                            let allPersonalFinances = try decoder.decode(FinancesData.self, from: safeData)

                            if let asset = allPersonalFinances.response?.member_profile.assets{
                                DispatchQueue.main.async {
                                    self.pfAssets = asset
                                }
                            }
                            if let profile = allPersonalFinances.response {
                                DispatchQueue.main.async {
                                    self.pfProfile = profile.member_profile
                                }
                            }

                            if let position = allPersonalFinances.response?.member_profile.positions {
                                DispatchQueue.main.async {
                                    self.pfPositions = position
                                }
                            }
                            

                        } catch {
                            print("DATA Error: \(error.localizedDescription)")
                        }
                    }
                }
        }
            task.resume()
    }
}
}

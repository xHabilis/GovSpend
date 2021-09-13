//
//  TopContribManager.swift
//  GovSpend
//
//  Created by Isaac M on 7/16/21.
//


import Foundation

class TopContribManager: ObservableObject {
    
    @Published var topContributors = [Contributor]()
    @Published var topContribPerson: Contributors?
    
    let searchURL = K.apiURLs.topContrib
    
    func getTopContributors(for CRPCandidateID: String, in cycle: String) {
        let key = Keys.openSecretKey
        
        let fullURL = "\(searchURL)\(CRPCandidateID)&cycle=\(cycle)&output=json&apikey=\(key)"

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
                            let allTopContribs = try decoder.decode(TopContribData.self, from: safeData)
                            
                            if let person = allTopContribs.response?.contributors {
                                DispatchQueue.main.async {
                                    self.topContribPerson = person
                                }
                            }
                            
                            if let topcontributorList = allTopContribs.response?.contributors?.contributor {
                                
                                DispatchQueue.main.async {
                                    self.topContributors = topcontributorList
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

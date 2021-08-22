//
//  CurrentCongressManager.swift
//  GovSpend
//
//  Created by Isaac M on 7/14/21.
//

import Foundation

class CurrentCongressManager: ObservableObject {
    @Published var currentCongressResults = [Legislator]()
    

    let searchURL = K.apiURLs.currentCongress
    
    func getCurrentCongressMembers(for stateName: String) {
        let key = Keys.openSecretKey
        let urlWithStateName = "\(searchURL)\(stateName)&output=json&apikey=\(key)"
        
        performRequest(with: urlWithStateName)
        
        print(urlWithStateName)
    }
    
    func performRequest(with urlWithStateName: String) {
        if let  url = URL(string: urlWithStateName) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) {(data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let the117Results = try decoder.decode(CurrentCongressData.self, from: safeData)
                            
                            let result = the117Results.response.legislator
                            
                            DispatchQueue.main.async {
                                self.currentCongressResults = result
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

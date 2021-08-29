//
//  CandidateSearchManager.swift
//  GovSpend
//
//  Created by Isaac M on 7/8/21.
//

import Foundation

class FECCandidateSearchManager: ObservableObject {
    
    @Published var searchResults = [SearchResults]()
 
    
    var theRequest: URLRequest?
    let searchURL = URL(string: K.apiURLs.candidateSearch)!
    
    func getCandidateSearchResults(for name: String, in year: String) {
        
        let urlWithName = URL(string: "\(searchURL)\(year)/candidates/search.json?query=\(name)")!
        
        var request = URLRequest(url: urlWithName)
        request.allHTTPHeaderFields = Keys.campaignFinance
        theRequest = request
        
        print(urlWithName)
        
        performRequest(with: request)
    }
    
    
    /// - Description:
    ///     1. Initiate URL Session and get Data
    ///     2. Decode data using Model
    ///     3. Assign data to variables
    /// - Parameter urlRequest: URLRequest
    func performRequest(with urlRequest: URLRequest) {
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: theRequest!) { data, response, error in
            
            // ErrorCheck
            let responseHandling = response as! HTTPURLResponse
            let responseCode = responseHandling.statusCode
            print(Configs.getHTTPStatusCodeDescription(for: responseCode))
            
            if error == nil {
                let decoder = JSONDecoder()
                if let safeData = data {
                    do {
                        let searchResults = try decoder.decode(FECCandidateSearchData.self, from: safeData)
                        
                        
                        
                        DispatchQueue.main.async {
                            self.searchResults = searchResults.results
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

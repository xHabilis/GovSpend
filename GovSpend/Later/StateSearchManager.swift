//
//  StateSearchManager.swift
//  GovSpend
//
//  Created by Isaac M on 7/12/21.
//

import Foundation

//class StateSearchManager: ObservableObject {
//    
//    @Published var stateSearchResults = [StateResults]()
//    
//    var theRequest: URLRequest?
//    let searchURL = URL(string: K.apiURLs.stateSearch)!
//    
//    func getStateSearchResults(for stateName: String) {
//        
//        let urlWithStateName = URL(string: "\(searchURL)\(stateName).json")!
//        var request = URLRequest(url: urlWithStateName)
//        request.allHTTPHeaderFields = Keys.campaignFinance
//        theRequest = request
//        
//        print(urlWithStateName)
//        performRequest(with: request)
//    }
//    
//    func performRequest(with urlRequest: URLRequest) {
//        let session = URLSession(configuration: .default)
//        
//        let task = session.dataTask(with: theRequest!) { data, response, error in
//            
//            if error == nil {
//                let decoder = JSONDecoder()
//                if let safeData = data {
//                    do {
//                        let theResults = try decoder.decode(SearchStateData.self, from: safeData)
//                        
//                        DispatchQueue.main.async {
//                            self.stateSearchResults = theResults.results
//                        }
//                    } catch {
//                        print("DATA \(error.localizedDescription)")
//                    }
//                }
//            }
//        }
//        task.resume()
//        
//    }
//}

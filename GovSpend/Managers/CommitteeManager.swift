//
//  CommitteeManager.swift
//  GovSpend
//
//  Created by Isaac M on 7/31/21.
//

import Foundation

class CommitteeManager: ObservableObject {
    
    @Published var committeeList = [CommitteeInfo]()
    @Published var committeeMetaData: CommitteeData?
    
    var theRequest: URLRequest?
    let committeeURL = URL(string: K.apiURLs.committees)!
    
    func getCommittees(with committeeUrlString: String) {
        
        let fullURL = URL(string: "\(committeeURL)2020\(committeeUrlString)")!
        
        var request = URLRequest(url: fullURL)
        request.allHTTPHeaderFields = Keys.campaignFinance
        theRequest = request
        
        print(fullURL)
        
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
            
            if error == nil {
                let decoder = JSONDecoder()
                if let safeData = data {
                    do {
                        let theCommitteeData = try decoder.decode(CommitteeData.self, from: safeData)
                        
                        
                        
                        
                        DispatchQueue.main.async {
                            if let committeeStuff = theCommitteeData.results {
                                self.committeeList = committeeStuff
                            }
                            self.committeeMetaData = theCommitteeData
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

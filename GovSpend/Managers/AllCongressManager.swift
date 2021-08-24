//
//  AllCongressManager.swift
//  GovSpend
//
//  Created by Isaac M on 7/17/21.
//

import Foundation
import SwiftUI

class AllCongressManager: ObservableObject {

    @Published var congressResults = [Member]()
    @Published var congressMetaData: AllCongressData?

    var theRequest: URLRequest?
    let searchURL = URL(string: K.apiURLs.allCongress)!
    

    /// - Description:
    ///      1. Uses Parameters to create URL
    ///      2. Calls performRequest()
    ///      3. API and Key
    /// - Parameters:
    ///   - congressNumber: String from Picker by User
    ///   - chamber: String from Picker by User
    func getCongress(congressNumber: String, chamber: String) {

        let fullURL = URL(string: "\(searchURL)\(congressNumber)/\(chamber)/members.json")!

        var request = URLRequest(url: fullURL)
        request.allHTTPHeaderFields = Keys.congressAPIKey
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
                        let fullCongressInfo = try decoder.decode(AllCongressData.self, from: safeData)
                        
                        if let info = fullCongressInfo.results?.first?.members {
                        

                        DispatchQueue.main.async {
                            self.congressResults = info
                            self.congressMetaData = fullCongressInfo
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


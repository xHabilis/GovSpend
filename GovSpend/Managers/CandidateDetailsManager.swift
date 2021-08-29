//
//  CandidateDetailsManager.swift
//  GovSpend
//
//  Created by Isaac M on 7/8/21.
//

import Foundation

class CandidateDetailsManager: ObservableObject {
    
    @Published var candidateDetails = [Results]()
    @Published var candidateDetailsMetaData: CandidateDetailsData?
    
    var theRequest: URLRequest?
    let detailsURL = URL(string: K.apiURLs.getCandidateMoneyUrl)!
    
    func getCandidateDetails(with urlEndPiece: String) {
        
        let urlWithName = URL(string: "\(detailsURL)\(urlEndPiece)")!
        var request = URLRequest(url: urlWithName)
        request.allHTTPHeaderFields = Keys.campaignFinance
        theRequest = request
        
        print("DetailsView URL \(urlWithName)")
        
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
                        let detailsResult = try decoder.decode(CandidateDetailsData.self, from: safeData)
                        
                        
                        DispatchQueue.main.async {
                            self.candidateDetails = detailsResult.results
                            self.candidateDetailsMetaData = detailsResult
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

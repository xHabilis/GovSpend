//
//  SectorTotalsManager.swift
//  GovSpend
//
//  Created by Isaac M on 7/16/21.
//
//http://www.opensecrets.org/api/?method=candSector&cid=N00007360&cycle=2020&output=json&apikey=4d2efe0e8ba6a6943ef73ab1d09a4119

import Foundation

class SectorTotalsManager: ObservableObject {
    @Published var sectorCandidate: Sectors?
    @Published var sectorTotal = [Sector]()
    
    let searchURL = K.apiURLs.sectorTotals
    
    func getSectorTotals(for CRPCandidateID: String, in cycle: String) {
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
                print(Configs.getHTTPStatusCodeDescription(for: responseCode))
                }
                
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let allSectorData = try decoder.decode(SectorTotalsData.self, from: safeData)

                            if let tableData = allSectorData.response?.sectors?.sector {
                                DispatchQueue.main.async {
                                    self.sectorTotal = tableData
                                }
                            }

                            if let candidateData = allSectorData.response?.sectors {
                                DispatchQueue.main.async {
                                    self.sectorCandidate = candidateData
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

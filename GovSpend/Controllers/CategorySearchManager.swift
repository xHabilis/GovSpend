//
//  CategorySearchManager.swift
//  GovSpend
//
//  Created by Isaac M on 7/18/21.
//

import Foundation

class CategorySearchManager: ObservableObject {
    
    @Published var theCategoryResults = [Top20Results]()
    @Published var categoryMetaData: CategorySearchData?
    
    var theRequest: URLRequest?
    let categoryURL = URL(string: K.apiURLs.categorySearch)!
    
    func getCategoryData(with categoryName: String) {
        
        let fullURL = URL(string: "\(categoryURL)\(categoryName).json")!
        
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
            
            // ErrorCheck
            if let responseHandling = response as? HTTPURLResponse {
            let responseCode = responseHandling.statusCode
            print(AppSettings.getHTTPStatusCodeDescription(for: responseCode))
            }
            
            if error == nil {
                let decoder = JSONDecoder()
                if let safeData = data {
                    do {
                        let theData = try decoder.decode(CategorySearchData.self, from: safeData)
  
                        if let dataStuff = theData.results {
                            
                            DispatchQueue.main.async {
                                self.theCategoryResults = dataStuff
                                self.categoryMetaData = theData
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

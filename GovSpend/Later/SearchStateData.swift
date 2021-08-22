//
//  SearchStateData.swift
//  GovSpend
//
//  Created by Isaac M on 7/12/21.
//

import Foundation

struct SearchStateData: Codable {
    let copyright: String?
    let cycle: Int
    let base_uri: String
    let num_results: Int
    let results: [StateResults]
}

struct StateResults: Codable, Identifiable {
    
    var id = UUID()
    let candidate: StateAttributes?
    let committee: String?
    let state: String?
    let district: String?
    
    private enum CodingKeys: String, CodingKey {
        case candidate = "candidate"
        case committee = "committee"
        case state = "state"
        case district = "district"
        
    }
    
    struct StateAttributes: Codable {
        let id: String
        let relative_uri: String
        let name: String
        let party: String
    }
    
    
}
//https://www.opensecrets.org/api/?method=getLegislators&id=N00007360&output=json&apikey=4d2efe0e8ba6a6943ef73ab1d09a4119

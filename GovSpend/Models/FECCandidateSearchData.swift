//
//  FECCandidateSearchData.swift
//  GovSpend
//
//  Created by Isaac M on 7/8/21.
//

import Foundation

struct FECCandidateSearchData: Codable {
    let copyright: String?
    let cycle: Int
    let base_uri: String
    let num_results: Int
    let results: [SearchResults]
}

struct SearchResults: Codable, Identifiable {
    
    var id = UUID()
    let candidate: CandidateAttributes?
    let committee: String?
    let state: String?
    let district: String?
    
    
        private enum CodingKeys: String, CodingKey {
            case candidate = "candidate"
            case committee = "committee"
            case state = "state"
            case district = "district"
            
        }
    
    struct CandidateAttributes: Codable {
            let id: String
            let relative_uri: String
            let name: String
            let party: String

    }
    

}

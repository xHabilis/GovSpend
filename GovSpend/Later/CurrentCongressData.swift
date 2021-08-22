//
//  CurrentCongressData.swift
//  GovSpend
//
//  Created by Isaac M on 7/14/21.
//

import Foundation

struct CurrentCongressData: Codable {

    let response: Response
}

struct Response: Codable {
   
    let legislator: [Legislator]
}

struct Legislator: Codable, Identifiable {
    var id = UUID()
    let attributes: LegislatorAttributes?
    
    private enum CodingKeys: String, CodingKey {
        case attributes = "@attributes"
    }
    
    struct LegislatorAttributes: Codable {

        let cid: String
        let firstlast: String
        let lastname: String
        let party: String
        let office: String
        let first_elected: String
        let comments: String
        let phone: String
        let website: String
        let webform: String
        let congress_office: String
        let bioguide_id: String
        let votesmart_id: String
        let feccandid: String
        let twitter_id: String
        let youtube_url : String
        let facebook_id: String
        let birthdate: String
    }
}

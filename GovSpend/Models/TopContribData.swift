//
//  TopContribData.swift
//  GovSpend
//
//  Created by Isaac M on 7/16/21.
//

import Foundation
struct TopContribData: Codable {
    let response: Response?
    
    struct Response: Codable {
        let contributors: Contributors?
    }
}

struct Contributors: Codable {
    let attributes: ContributorsAttributes?
    let contributor: [Contributor]
    
    private enum CodingKeys: String, CodingKey {
        case attributes = "@attributes"
        case contributor
    }
    
    struct ContributorsAttributes: Codable {
        let cand_name: String
        let cid: String
        let cycle: String
        let origin: String
        let source: String
        let notice: String
    }
}

struct Contributor: Codable, Identifiable {
    var id = UUID()
    let attributes: ContributorAttributes?
    
    private enum CodingKeys: String, CodingKey {
        case attributes = "@attributes"
}
    struct ContributorAttributes: Codable {
        let org_name: String
        let total: String
        let pacs: String
        let indivs: String
    }
}

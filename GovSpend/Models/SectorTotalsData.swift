//
//  SectorTotalsData.swift
//  GovSpend
//
//  Created by Isaac M on 7/16/21.
//

import Foundation

struct SectorTotalsData: Codable {
    let response: Response?
    
    struct Response: Codable {
        let sectors: Sectors?
    }
}

struct Sectors: Codable {
    let attributes: SectorsAttributes?
    let sector: [Sector]
    
    private enum CodingKeys: String, CodingKey {
        case attributes = "@attributes"
        case sector
    }
    
    struct SectorsAttributes: Codable {
        let cand_name: String
        let cid: String
        let cycle: String
        let origin: String
        let source: String
        let last_updated: String
    }
}

struct Sector: Codable, Identifiable {
    var id = UUID()
    let attributes: SectorAttributes?
    
    private enum CodingKeys: String, CodingKey {
        case attributes = "@attributes"
    }
    
    struct SectorAttributes: Codable {
        let sector_name: String
        let indivs: String
        let pacs: String
        let total: String
    }
}

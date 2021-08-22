//
//  FundRaisingData.swift
//  GovSpend
//
//  Created by Isaac M on 7/16/21.
//

import Foundation

struct FundRaisingData: Codable {
    let response: Response?

    struct Response: Codable {
        let summary: Summary?
    }
}

struct Summary: Codable {
    let attributes: SummaryAttributes?

    private enum CodingKeys: String, CodingKey {
        case attributes = "@attributes"
    }

    struct SummaryAttributes: Codable {

        let cand_name: String
        let cid: String
        let cycle: String
        let state: String
        let party: String
        let chamber: String
        let first_elected: String
        let next_election: String
        let total: String
        let spent: String
        let cash_on_hand: String
        let debt: String
        let origin: String
        let source: String
        let last_updated: String


    }
}

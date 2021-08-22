//
//  PersonalFinanceData.swift
//  GovSpend
//
//  Created by Isaac M on 7/15/21.
//

import Foundation

struct PersonalFinanceData: Codable {
    let response: Response?

    struct Response: Codable {
        let member_profile: MemberProfile
    }
}

struct MemberProfile: Codable {

    let attributes: MemberProfileAttributes
    let assets: Assets?
    let transactions: Transactions?
    let positions: Positions?
    


    private enum CodingKeys: String, CodingKey {
        case attributes = "@attributes"
        case assets
        case transactions
        case positions

        
    }

    struct MemberProfileAttributes: Codable {
        let name: String
        let data_year: String
        let member_id: String
        let net_low: String
        let net_high: String
        let positions_held_count: String
        let asset_count: String
        let asset_low: String
        let asset_high: String
        let source: String
        let origin: String
        let update_timestamp: String
    }

}

struct Assets: Codable {
    let asset: [Asset]
}

struct Asset: Codable, Identifiable {
    var id = UUID()
    let attributes: AssetAttributes?

    private enum CodingKeys: String, CodingKey {
        case attributes = "@attributes"
    }

    struct AssetAttributes: Codable {
        let name: String
        let holdings_low: String
        let holdings_high: String
        let industry: String
        let sector: String
    }

}
struct Transactions: Codable {
    let transaction: [Transaction]
}

struct Transaction: Codable, Identifiable {
    var id = UUID()
    let attributes: TransactionAttributes?

    private enum CodingKeys: String, CodingKey {
        case attributes = "@attributes"
    }

    struct TransactionAttributes: Codable {
        let asset_name: String
        let tx_date: String
        let tx_action: String
        let value_low: String
        let value_high: String
    }
}





struct Positions: Codable {
    let position: [Position]
}

struct Position: Codable, Identifiable {
    var id = UUID()
    let attributes: PositionAttributes?

    private enum CodingKeys: String, CodingKey {
        case attributes = "@attributes"
    }

    struct PositionAttributes: Codable {
        let title: String
        let organization: String
    }
}

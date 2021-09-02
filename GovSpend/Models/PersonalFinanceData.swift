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
    let positions: Positions?
    


    private enum CodingKeys: String, CodingKey {
        case attributes = "@attributes"
        case assets
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

//Account for positions as Array or Single item (non Array)
struct Positions: Codable, Identifiable {
    var id = UUID()
    var position: [Position]

        
        init(from decoder: Decoder) throws {
            let items = try decoder.container(keyedBy: CodingKeys.self)
            position = []
            
            if let singlePosition = try? items.decode(Position.self, forKey: CodingKeys.position) {
            position.append(singlePosition)
                
            } else if let positionArray = try? items.decode([Position].self, forKey: CodingKeys.position) {
                position = positionArray
            }

            enum CodingKeys: String, CodingKey { case position }
        }
        
        struct Position: Codable, Identifiable{
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
    }
    



struct Assets: Codable, Identifiable {
    var id = UUID()
    var asset: [Asset]

        init(from decoder: Decoder) throws {
            let items = try decoder.container(keyedBy: CodingKeys.self)
            asset = []
            
            if let singleAsset = try? items.decode(Asset.self, forKey: CodingKeys.asset) {
            asset.append(singleAsset)
                
            } else if let AssetArray = try? items.decode([Asset].self, forKey: CodingKeys.asset) {
            asset = AssetArray
            }

            enum CodingKeys: String, CodingKey { case asset }
        }

        struct Asset: Codable, Identifiable{
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
    }

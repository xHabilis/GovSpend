//
//  GiftRevenueData.swift
//  GovSpend
//
//  Created by Isaac M on 8/8/21.
//

import Foundation

struct GiftRevenueData: Codable {
    let data: [GiftRevenue]?
    let meta: Meta?
    let links: Links?
}


struct GiftRevenue: Codable, Identifiable {
    let id = UUID()
    let record_date, contribution_amt, record_calendar_month: String
    var giftAsDouble: Double {
        return (contribution_amt as NSString).doubleValue
    }
}


struct GiftLinks: Codable {
    let linksSelf, first: String?
    let prev: String?
    let next, last: String?
}


struct GiftMeta: Codable {
    let count: Int?
    let labels, dataTypes, dataFormats: GiftRevenue?
    let totalCount, totalPages: Int?
}

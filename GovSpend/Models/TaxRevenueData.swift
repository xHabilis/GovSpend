//
//  RevenueData.swift
//  GovSpend
//
//  Created by Isaac M on 8/8/21.
//

import Foundation

struct TaxRevenueData: Codable {
    let data: [TheRevenue]?
    let meta: RevenueMeta?
    let links: Links?
}


struct TheRevenue: Codable, Identifiable {
    let id = UUID()
    let record_date, net_collections_amt, record_fiscal_year: String
        var revenueAsDouble: Double {
            return (net_collections_amt as NSString).doubleValue
        }
}


struct RevenueLinks: Codable {
    let linksSelf, first: String?
    let prev: String?
    let next, last: String?
}


struct RevenueMeta: Codable {
    let count: Int?
    let labels, dataTypes, dataFormats: TheRevenue?
    let totalCount, totalPages: Int?
}

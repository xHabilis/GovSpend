//
//  RevenueData.swift
//  GovSpend
//
//  Created by Isaac M on 8/8/21.
//

import Foundation

struct RevenueData: Codable {
    let data: [TheRevenue]?
    let meta: Meta?
    let links: Links?
}


struct TheRevenue: Codable, Identifiable {
    let id = UUID()
    let record_date, tax_category_desc, net_collections_amt, record_fiscal_year: String
    var revenueAsDouble: Double {
        return (net_collections_amt as NSString).doubleValue
    }
    
    var tag: String {
        return "\(record_date)\n\(tax_category_desc)"
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

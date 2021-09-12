//
//  NonTaxRevenueData.swift
//  GovSpend
//
//  Created by Isaac M on 9/12/21.
//

import Foundation

struct NonTaxRevenueData: Codable {
    let data: [NonTax]?
    let meta: NonTaxMeta?
    let links: Links?
}


struct NonTax: Codable, Identifiable {
    let id = UUID()
    let record_date, net_collections_amt, record_fiscal_year: String
    var revenueAsDouble: Double {
        return (net_collections_amt as NSString).doubleValue
    }
}


struct NonTaxLinks: Codable {
    let linksSelf, first: String?
    let prev: String?
    let next, last: String?
}


struct NonTaxMeta: Codable {
    let count: Int?
    let labels, dataTypes, dataFormats: NonTax?
    let totalCount, totalPages: Int?
}

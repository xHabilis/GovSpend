//
//  MonthlyDebtData.swift
//  GovSpend
//
//  Created by Isaac M on 8/8/21.
//

import Foundation

struct MonthlyDebtData: Codable {
    
    let data: [TheDebt]?
    let meta: Meta?
    let links: Links?
}


struct TheDebt: Codable, Identifiable {
    let id = UUID()
    let record_date, debt_held_public_amt, intragov_hold_amt, tot_pub_debt_out_amt: String
    var debtAsDouble: Double {
        return (tot_pub_debt_out_amt as NSString).doubleValue
    }
}


struct MonthlyLinks: Codable {
    let linksSelf, first: String?
    let prev: String?
    let next, last: String?
}


struct MonthlyMeta: Codable {
    let count: Int?
    let labels, dataTypes, dataFormats: TheDebt?
    let totalCount, totalPages: Int?
}

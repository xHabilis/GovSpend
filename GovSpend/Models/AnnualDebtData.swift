//
//  AnnualDebtData.swift
//  GovSpend
//
//  Created by Isaac M on 8/8/21.
//

import Foundation

struct AnnualDebtData: Codable {
    let data: [DebtData]?
    let meta: Meta?
    let links: Links?
}


struct DebtData: Codable, Identifiable {
    let id = UUID()
    let record_date, debt_outstanding_amt, src_line_nbr, record_fiscal_year: String?
    var debtAsDouble: Double {
        return (debt_outstanding_amt! as NSString).doubleValue
    }
}


struct Links: Codable {
    let linksSelf, first: String?
    let prev, next: String?
    let last: String?
}


struct Meta: Codable {
    let count: Int?
    let labels, dataTypes, dataFormats: DebtData?
    let totalCount, totalPages: Int?
}

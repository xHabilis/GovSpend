//
//  CategorySearchData.swift
//  GovSpend
//
//  Created by Isaac M on 7/12/21.
//

import Foundation

struct CategorySearchData: Codable {
    let status, copyright: String?
    let cycle: Int?
    let category: String?
    let base_uri: String?
    let results: [Top20Results]?
}

// MARK: - Result
struct Top20Results: Codable,Identifiable {
    let id = UUID()
    let relative_uri, name: String?
    let party: String?
    let state: String?
    let district: String?
    let committee: String?
    let status: String?
    let total_from_individuals, total_from_pacs, total_contributions: Double?
    let candidate_loans: Double?
    let total_disbursements, begin_cash, end_cash, total_refunds: Double?
    let debts_owed: Double?
    let date_coverage_from, date_coverage_to: String?
}



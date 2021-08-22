//
//  CommitteeData.swift
//  GovSpend
//
//  Created by Isaac M on 7/31/21.
//

import Foundation

struct CommitteeData: Codable {
    let status, copyright: String?
    let cycle: Int?
    let baseURI: String?
    let results: [CommitteeInfo]?
}


struct CommitteeInfo: Codable, Identifiable {
    
    let id = UUID()
    let name, party, treasurer: String?
    let address, city, state, zip: String?
    let total_receipts, total_from_individuals: Double?
    let total_from_pacs: Double?
    let total_contributions, total_disbursements, begin_cash, end_cash: Double?
    let total_refunds: Double?
    let display_type: String?
    let debts_owed: Double?
    let date_coverage_from, date_coverage_to: String?
    let fec_uri: String?
    let total_independent_expenditures: Double?
    let candidate: String?
    let leadership, super_pac: Bool?
    let total_candidate_contributions, transfers_in: Double?
    let designation, filing_frequency, committee_type: String?
    let total_coordinated_expenditures: Double?
    let end_date, next_filing_date: String?
    let other_cycles: [Int]?
}


//
//  CandidateDetailsData.swift
//  GovSpend
//
//  Created by Isaac M on 7/8/21.
//

import Foundation

struct CandidateDetailsData: Codable {
    
    let status: String?
    let copyright: String
    let base_uri: String?
    let cycle: Int?
    let results: [Results]
    
}

struct Results: Codable, Identifiable {
    let id: String
    let name: String
    let display_name: String
    let party: String
    let district: String?
    let fec_uri: String
    let committee: String?
    let mailing_address: String
    let mailing_city: String
    let mailing_state: String
    let mailing_zip: String
    let status: String
    let total_receipts: Double
    let total_from_individuals: Double
    let total_from_individuals_itemized: Double
    let total_from_individuals_unitemized: Double
    let percent_unitemized: Double
    let total_from_pacs: Double
    let total_contributions: Double
    let candidate_loans: Double
    let transfers_in: Double
    let total_disbursements: Double
    let begin_cash: Double
    let end_cash: Double
    let total_refunds: Double
    let individual_refunds: Double
    let pac_refunds: Double
    let debts_owed: Double
    let date_coverage_from: String
    let date_coverage_to: String
    let independent_expenditures: Double
    let coordinated_expenditures: Double
    let url: String
    let facebook_url: String
    let gender: String
    let twitter_user: String
    
}



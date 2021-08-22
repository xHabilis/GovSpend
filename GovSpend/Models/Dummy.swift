//
//  AllCongressDataDummy.swift
//  GovSpend
//
//  Created by Isaac M on 7/27/21.
//

import Foundation

struct Dummy {
    let status,
        copyright: String?
    let results: [DummyResult]?
}


struct DummyResult  {
    let congress, chamber: String?
    let numResults: Int?
    let members: [DummyMember]?
}


struct DummyMember: Identifiable  {
    let id: String?
    let short_title: String?
    let first_name: String?
    let last_name: String?
    let party: String?
    let twitter_account,
        facebook_account,
        youtube_account: String?
    let crp_id: String?
    let url: String?

    let fec_candidate_id: String?
    let contact_form: String?
    let in_office: Bool?
    let next_election: String?
    let last_updated,
        office,
        phone: String?
    let state: String?
    let missed_votes_pct: Double?
    let votes_with_party_pct,
        votes_against_party_pct: Double?
}


struct DummyPFList: Identifiable {
    let id: String?
    let name: String?
    let holdings_low: String?
    let holdings_high: String?
    let sector: String?
}
struct DummyPFListPositions: Identifiable {
    let id: String?
    let title: String?
    let organization: String?
    
}

struct FundRaising: Codable {

    let cand_name: String
    let cid: String
    let cycle: String
    let state: String
    let party: String
    let chamber: String
    let first_elected: String
    let next_election: String
    let total: String
    let spent: String
    let cash_on_hand: String
    let debt: String
    let origin: String
    let source: String
    let last_updated: String

}


struct dummyContribs: Identifiable {
    let id: String?
    let org_name: String
    let total: String
    let pacs: String
    let indivs: String
}

struct dummySector: Identifiable {
    let id: String?
    let sector_name: String
    let indivs: String
    let pacs: String
    let total: String
}





struct dummyCommittee: Codable, Identifiable {
    
    let id = UUID()
    let name, party, treasurer: String?
    let total_receipts, total_from_individuals: Double?
    let total_from_pacs: Double?
    let total_contributions, total_disbursements, begin_cash, end_cash: Double?
    let total_refunds: Double?
    let display_type: String?
    let debts_owed: Double?
    let date_coverage_from, date_coverage_to: String?
    let total_independent_expenditures: Double?
    let candidate: String?
    let leadership, super_pac: Bool?
    let total_candidate_contributions, transfers_in: Double?
    let committee_type: String?
    let total_coordinated_expenditures: Double?
    let end_date, next_filing_date: String?
    let other_cycles: [Int]?
}

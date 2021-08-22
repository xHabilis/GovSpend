//
//  CandidateModel.swift
//  GovSpend
//
//  Created by Isaac M on 7/7/21.
//

import Foundation

struct CandidateDetailsModel: Codable {
    let status: String?
    let copyright: String?
    let results: [TheResults]?
}

struct TheResults: Codable {
    
    let member_id: String?
    let first_name: String
    let last_name: String
    let date_of_birth: String
    let gender: String
    let url: String?
    let twitter_account: String?
    let facebook_account: String?
    let youtube_account: String?
    let crp_id: String?
    let in_office: Bool
    let current_party: String?
    let most_recent_vote: String?
    let last_updated: String?
    var fullName: String {
        
        return self.last_name + " " + self.first_name
    }

    let roles: [Roles]
    
    
}


struct Roles: Codable {
    
    let congress: String
    let chamber: String
    let title: String
    let short_title: String
    let state: String?
    let party: String?
    let leadership_role: String?
    let fec_candidate_id: String?
    let seniority: String?
    let district: String?
    let start_date: String?
    let end_date: String?
    let office: String?
    let phone : String?
    let contact_form : String?
    let next_election : String?
    let total_votes : Int?
    let missed_votes : Int?
    let total_present : Int?
    let senate_class : String?
    let state_rank : String?
    let bills_sponsored : Int?
    let bills_cosponsored : Int?
    let missed_votes_pct : Double?
    let votes_with_party_pct : Double?
    let votes_against_party_pct : Double?
    let committees: [Committees]?
    let subcommittees: [SubCommittees]?
}

struct Committees: Codable {
    
}

struct SubCommittees: Codable {
    
}



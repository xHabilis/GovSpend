

import Foundation

struct AllCongressData: Codable {
    let status, copyright: String?
    let results: [Result]?
}


struct Result: Codable {
    let congress, chamber: String?
    let numResults, offset: Int?
    let members: [Member]?
}


struct Member: Codable, Identifiable {
    let id, title, short_title: String?
    let api_uri: String?
    let first_name: String?
    let last_name: String?
    let date_of_birth, gender, party, leadership_role: String?
    let twitter_account, facebook_account, youtube_account, govtrack_id: String?
    let cspan_id, votesmart_id, icpsr_id, crp_id: String?
    let google_entity_id, fec_candidate_id: String?
    let url, rss_url, contact_form: String?
    let in_office: Bool?
    let seniority, next_election: String?
    let total_votes, missed_votes, total_present: Int?
    let last_updated, ocd_id, office, phone: String?
    let state, senate_class, state_rank, lis_id: String?
    let missed_votes_pct: Double?
    let votes_with_party_pct, votes_against_party_pct: Double?
    var fullName: String {
        return "\(String(describing: last_name)) \(String(describing: first_name))"
    }
}

//
//  K.swift
//  GovSpend
//
//  Created by Isaac M on 7/18/21.
//

import Foundation

import Foundation

struct K {
    
    struct appColors {
        
        static let background = "background"
        static let backgroundEggShell = "backgroundEggShell"
        static let blue = "partyBlue"
        static let lightBlue = "lightBlue"
        static let gray = "gray"
        static let lightGray = "lightGray"
        static let green = "green"
        static let red = "partyRed"
        static let yellow = "yellow"
        static let eggShell = "eggShell"
        static let grayBrown = "grayBrown"
        static let cardShadow = "cardShadow"
        static let cardShadowReverse = "cardShadowReverse"

    }
    
    struct partyLogos {
        
        static let republican = "republicanlogo"
        static let democrat = "democratlogo"
        static let liberterian = "liberterianlogo"
        static let green = "greenpartylogo"
        static let independent = "independentpartylogo"
    }
    
    struct apiURLs {
        static let getCandidateUrl = "https://api.propublica.org/congress/v1/members/"
        static let getCandidateMoneyUrl = "https://api.propublica.org/campaign-finance/v1/2020"
        static let candidateSearch = "https://api.propublica.org/campaign-finance/v1/"
        static let categorySearch = "https://api.propublica.org/campaign-finance/v1/2020/candidates/leaders/"
        static let stateSearch = "https://api.propublica.org/campaign-finance/v1/2020/races/"
        static let imageURL = "https://theunitedstates.io/images/congress/450x550/"
        static let imageURLjpg = ".jpg"
        static let currentCongress = "https://www.opensecrets.org/api/?method=getLegislators&id="
        static let personalFinance = "https://www.opensecrets.org/api/?method=memPFDprofile&year=2016&cid="
        static let fundRaising = "https://www.opensecrets.org/api/?method=candSummary&cid="
        static let topContrib = "https://www.opensecrets.org/api/?method=candContrib&cid="
        static let sectorTotals = "https://www.opensecrets.org/api/?method=candSector&cid="
        static let allCongress = "https://api.propublica.org/congress/v1/"
        static let committees = "https://api.propublica.org/campaign-finance/v1/"

    }
    
    
}

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
        static let imageFail = "imageFail"
        static let imageFailTwo = "imageFailTwo"
        static let capitalOne = "capitalOne"
        static let capitalTwo = "capitalTwo"
        static let capitalThree = "capitalThree"
        static let capitalFour = "capitalFour"
        static let capitalFive = "capitalFive"
        static let capitalVector = "capitalVector"
        static let fec = "fec"
        static let theflag = "theflag"
        static let flagTwo = "flagTwo"
        static let flagThree = "flagThree"
        static let flagalso = "flagalso"
        static let congressVectorOne = "congressVectorOne"
        static let congressVectorTwo = "congressVectorTwo"

    }
    
    
    struct apiURLs {
        static let getCandidateUrl = "https://api.propublica.org/congress/v1/members/"
        static let getCandidateMoneyUrl = "https://api.propublica.org/campaign-finance/v1/2020"
        static let candidateSearch = "https://api.propublica.org/campaign-finance/v1/"
        static let categorySearch = "https://api.propublica.org/campaign-finance/v1/2020/candidates/leaders/"
        static let imageURL = "https://theunitedstates.io/images/congress/450x550/"
        static let imageURLjpg = ".jpg"
        static let currentCongress = "https://www.opensecrets.org/api/?method=getLegislators&id="
        static let personalFinance = "https://www.opensecrets.org/api/?method=memPFDprofile&cid="
        static let fundRaising = "https://www.opensecrets.org/api/?method=candSummary&cid="
        static let topContrib = "https://www.opensecrets.org/api/?method=candContrib&cid="
        static let sectorTotals = "https://www.opensecrets.org/api/?method=candSector&cid="
        static let allCongress = "https://api.propublica.org/congress/v1/"
        static let committees = "https://api.propublica.org/campaign-finance/v1/"
        static let annualDebt = "https://api.fiscaldata.treasury.gov/services/api/fiscal_service/v2/accounting/od/debt_outstanding?fields=record_date,debt_outstanding_amt,src_line_nbr,record_fiscal_year&filter=record_fiscal_year:gt:1899?page[number]=1&page[size]=1000"
        static let monthlyDebt = "https://api.fiscaldata.treasury.gov/services/api/fiscal_service/v2/accounting/od/debt_to_penny?fields=record_date,debt_held_public_amt,%20intragov_hold_amt%20,tot_pub_debt_out_amt&page[number]=1&page[size]=30&sort=-record_date"
        static let giftRevenue = "https://api.fiscaldata.treasury.gov/services/api/fiscal_service/v2/accounting/od/gift_contributions?fields=record_date,contribution_amt,record_calendar_month&page[number]=1&page[size]=13&sort=-record_date"
        static let revenue = "https://api.fiscaldata.treasury.gov/services/api/fiscal_service/v2/revenue/rcm?fields=record_date,tax_category_desc,net_collections_amt,record_fiscal_year&page[number]=1&page[size]=28&sort=-record_date"
        

    }
    
    
}

//
//  StateNameManager.swift
//  GovSpend
//
//  Created by Isaac M on 7/12/21.
//

import Foundation
import SwiftUI

struct Configs {

//MARK: - Abbreviate State Names
    static func abbreviate(longStateName: String) -> String {
        var shortStateName: String!
        
        for name in Configs.stateDict {
            if name.value.localizedCaseInsensitiveContains(longStateName) {
                let abbreviated = name.key
                shortStateName = abbreviated
            }
        }
        return shortStateName
    }
    
    
//MARK:  Short State Names -> Expanded
    
    static func extendAbbreviation(StateName: String) -> String {
        var LongStateName: String!
        
        for name in Configs.stateDict {
            if name.key.localizedCaseInsensitiveContains(StateName) {
                let abbreviated = name.value
                LongStateName = abbreviated
            }
        }
        return LongStateName
    }
    
    
//MARK: - Convert Strings to currency formatt "$100,000,000"
    
    static func convertToDollars(someDouble: Double) -> String{
             let numberFormatter = NumberFormatter()
        
             numberFormatter.groupingSeparator = ","
             numberFormatter.groupingSize = 3
             numberFormatter.usesGroupingSeparator = true
             numberFormatter.decimalSeparator = "."
             numberFormatter.numberStyle = .decimal
             numberFormatter.maximumFractionDigits = 2
             numberFormatter.positivePrefix = "$"
             return numberFormatter.string(from: someDouble as NSNumber)!
         }
    
    
//MARK: - Convert Gov Abbreviations to Full
    static func getLongName(for apiShortName: String) -> String {

        if apiShortName.capitalized.starts(with: "D".capitalized) {
            return "Democrat"
        }
        if apiShortName.capitalized.starts(with: "R".capitalized) {
            return "Republican"
        }
        if apiShortName.capitalized.starts(with: "I".capitalized) {
            return "Independent"
        }
        if apiShortName.capitalized.starts(with: "G".capitalized) {
            return "Green Party"
        }
        if apiShortName.capitalized.starts(with: "L".capitalized) {
            return "Libertarian"
        }
        if apiShortName.capitalized.starts(with: "H".capitalized) {
            return "House"
        }

        if apiShortName.capitalized.starts(with: "S".capitalized) {
            return "Senate"

        } else {
            return ""
        }

    }
    
    
//MARK: - Assign Party Colors
    
    static func chooseColor(for party: String) -> Color {
        if party.capitalized.starts(with: "D".capitalized) {
            return Color(K.appColors.blue)
        }
        if party.capitalized.starts(with: "R".capitalized) {
            return Color(K.appColors.red)
        }
        if party.capitalized.starts(with: "I".capitalized) {
            return Color(K.appColors.background)
        }
        if party.capitalized.starts(with: "G".capitalized) {
            return Color(K.appColors.green)
        }
        if party.capitalized.starts(with: "L".capitalized) {
            return Color(K.appColors.yellow)
        } else {
            return Color(K.appColors.lightGray)
        }
        
    }
    
    
//MARK: - Convert Bool to String for View

    static func makeStatus(status: String) -> String {
        
        if status == "true" {
            return "Active"
        }
        if status == "C" {
            return "Active"
            
        } else {
            return "Inactive"
        }
    }
    
    static let stateDict: KeyValuePairs = [
        
        "AL": "Alabama",
        "AK": "Alaska",
        "AS": "American Samoa",
        "AZ": "Arizona",
        "AR": "Arkansas",
        "CA": "California",
        "CO": "Colorado",
        "CT": "Connecticut",
        "DE": "Delaware",
        "DC": "District Of Columbia",
        "FL": "Florida",
        "GA": "Georgia",
        "GU": "Guam",
        "HI": "Hawaii",
        "ID": "Idaho",
        "IL": "Illinois",
        "IN": "Indiana",
        "IA": "Iowa",
        "KS": "Kansas",
        "KY": "Kentucky",
        "LA": "Louisiana",
        "ME": "Maine",
        "MD": "Maryland",
        "MA": "Massachusetts",
        "MI": "Michigan",
        "MN": "Minnesota",
        "MS": "Mississippi",
        "MO": "Missouri",
        "MT": "Montana",
        "NE": "Nebraska",
        "NV": "Nevada",
        "NH": "New Hampshire",
        "NJ": "New Jersey",
        "NM": "New Mexico",
        "NY": "New York",
        "NC": "North Carolina",
        "ND": "North Dakota",
        "MP": "Northern Mariana Is",
        "OH": "Ohio",
        "OK": "Oklahoma",
        "OR": "Oregon",
        "PA": "Pennsylvania",
        "PR": "Puerto Rico",
        "RI": "Rhode Island",
        "SC": "South Carolina",
        "SD": "South Dakota",
        "TN": "Tennessee",
        "TX": "Texas",
        "UT": "Utah",
        "VT": "Vermont",
        "VA": "Virginia",
        "VI": "Virgin Islands",
        "WA": "Washington",
        "WV": "West Virginia",
        "WI": "Wisconsin",
        "WY": "Wyoming",
    ]
    static let AllCongressSessions = ["80","81","82","83","84","85","86","87","88","89","90","91","92","93","94","95","96",
                                      "97","98","99","100","101","102","103","104","105","106","107","108"
                                      ,"109","110","111","112","113","114","115","116","117", "Select Congress"]
    
    static let chambers = ["Senate", "House"]
    static let cycles = ["Select Cycle","2020", "2018", "2016", "2014", "2012", "2010"]
    
}






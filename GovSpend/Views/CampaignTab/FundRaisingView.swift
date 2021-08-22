//
//  FundRaisingView.swift
//  GovSpend
//
//  Created by Isaac M on 7/16/21.
//

import SwiftUI
import SwiftUICharts

struct FundRaisingView: View {

    @Environment(\.presentationMode) var presentationMode
    @StateObject var funds: FundRaisingManager
    @State private var showCitationView: Bool = false
    
    var id: String

    var body: some View {
        NavigationView {
            ScrollView (showsIndicators: false) {
    
                Color(K.appColors.background)
                    .cornerRadius(25)
                    .edgesIgnoringSafeArea(.bottom)
                    .navigationBarTitle("Fund Raising")
                    .navigationBarItems(trailing:
                                            Button(action: {
                                                showCitationView = true
                                                
                                            }){Image(systemName: "info.circle").imageScale(.large)
                                                .sheet(isPresented: $showCitationView) {
                                                    CitationView(); Image(systemName: "info.circle").imageScale(.large)
                                                }})
                
                    VStack (spacing: 35) {
                    
                    if let theFunds = funds.fundRaisingSummary?.attributes {

                       
                        
                        VStack (spacing: 5) {

                            Text(theFunds.cand_name)
                                .font(.system(size: 15)).fontWeight(.semibold)
                            Text(Configs.extendAbbreviation(StateName: "\(theFunds.state)"))
                                .font(.system(size: 12))
                            Text(Configs.getLongName(for: "\(theFunds.party)"))
                                .font(.system(size: 12))
                            Text(Configs.getLongName(for: "\(theFunds.chamber)"))
                                .font(.system(size: 12))

                        }
                        .frame(width: UIScreen.main.bounds.width-25, height: 100, alignment: .center)
                        .background(Configs.chooseColor(for: "\(theFunds.party)")).opacity(9)
                        .cornerRadius(20)
                        .shadow(radius: 10)
                        
                        
                        
                        VStack {
                            BarChartView(data: ChartData(values: funds.barChartData), title: "Fund Raising", legend: "Category", style: Styles.barChartMidnightGreenDark, form: ChartForm.extraLarge)
                        }
                            
                        VStack (spacing: 10) {
                            ItemNameValue(itemName: "Total Cash",
                                   itemValue: "\(Configs.convertToDollars(someDouble: Double(theFunds.total)!))",
                                   itemValueColor: K.appColors.green)

                            ItemNameValue(itemName: "Spent",
                                   itemValue: "\(Configs.convertToDollars(someDouble: Double(theFunds.spent)!))",
                                   itemValueColor: K.appColors.green)

                            ItemNameValue(itemName: "Cash on Hand",
                                   itemValue: "\(Configs.convertToDollars(someDouble: Double(theFunds.cash_on_hand)!))",
                                   itemValueColor: K.appColors.green)

                            ItemNameValue(itemName: "Debt",
                                   itemValue: "\(Configs.convertToDollars(someDouble: Double(theFunds.debt)!))",
                                   itemValueColor: K.appColors.green)

                            ItemNameValue(itemName: "First Elected",
                                   itemValue: theFunds.first_elected,
                                   itemValueColor: K.appColors.lightGray)
                            
                            ItemNameValue(itemName: "Next Election",
                                   itemValue: theFunds.next_election,
                                   itemValueColor: K.appColors.red)

                        }
                        .frame(width: UIScreen.main.bounds.width-25, height: 280, alignment: .center)
                            
                            
                    VStack (spacing: 15){
                        Text(theFunds.origin)
                            .font(.system(size: 15)).fontWeight(.semibold)
         

                        Link("Source", destination: URL(string: "\(theFunds.source)")!)
                            .frame(width: 300, height: 35, alignment: .center)
                            .font(.system(size: 15))
                            .background(Color(K.appColors.background))
                            .cornerRadius(15)
                            .shadow(radius: 5)
                        
                            Text("Last Updated: \(theFunds.last_updated)")
                                .font(.system(size: 11))
                    }
                    .frame(width: UIScreen.main.bounds.width-25, height: 150, alignment: .center)
                    .background(Color(K.appColors.grayBrown)).opacity(0.9)
                    .cornerRadius(20)
                    .shadow(radius: 10)
                        
                        
                    }

                }
            }

        }
        .onAppear() {
            funds.getFundRaisingSummary(for: id, in: "")
            
        }
        
        
    }
}

struct FundRaisingView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self, content: FundRaisingView(funds: FundRaisingManager(), id: "").preferredColorScheme)
        //.previewDevice(PreviewDevice(rawValue: "iPhone 8"))
    }
}


//let theFunds = FundRaising(cand_name: "Bernard Sanders",
//                           cid: "1234456",
//                           cycle: "2020",
//                           state: "CA",
//                           party: "D",
//                           chamber: "H",
//                           first_elected: "2018",
//                           next_election: "2022",
//                           total: "$123,456,778",
//                           spent: "$247,567",
//                           cash_on_hand: "$100,000,000",
//                           debt: "$289,556",
//                           origin: "Origin",
//                           source: "Source",
//                           last_updated: "02/23/2019")


//origin = "Center for Responsive Politics"
//source = "https://www.opensecrets.org/members-of-congress/summary?cid=N00035267&cycle=2022"
//last_updated = "06/30/2021"

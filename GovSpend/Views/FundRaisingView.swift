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
                
                    VStack (spacing: 35) {
                    
                    if let theFunds = funds.fundRaisingSummary?.attributes {

                       
                        
                        VStack (spacing: 5) {

                            Text(theFunds.cand_name)
                                .font(.system(size: 15)).fontWeight(.semibold)
                            Text(AppSettings.extendAbbreviation(StateName: "\(theFunds.state)"))
                                .font(.system(size: 12))
                            Text(AppSettings.getLongName(for: "\(theFunds.party)"))
                                .font(.system(size: 12))
                            Text(AppSettings.getLongName(for: "\(theFunds.chamber)"))
                                .font(.system(size: 12))

                        }
                        .frame(width: UIScreen.main.bounds.width-25, height: 100, alignment: .center)
                        .background(AppSettings.chooseColor(for: "\(theFunds.party)")).opacity(9)
                        .cornerRadius(20)
                        .shadow(radius: 10)
                        
                        

                        VStack (spacing: 10) {
                            ItemNameValue(itemName: "Total Cash",
                                   itemValue: "\(AppSettings.convertToDollars(someDouble: Double(theFunds.total)!))",
                                   itemValueColor: K.appColors.green)

                            ItemNameValue(itemName: "Spent",
                                   itemValue: "\(AppSettings.convertToDollars(someDouble: Double(theFunds.spent)!))",
                                   itemValueColor: K.appColors.green)

                            ItemNameValue(itemName: "Cash on Hand",
                                   itemValue: "\(AppSettings.convertToDollars(someDouble: Double(theFunds.cash_on_hand)!))",
                                   itemValueColor: K.appColors.green)

                            ItemNameValue(itemName: "Debt",
                                   itemValue: "\(AppSettings.convertToDollars(someDouble: Double(theFunds.debt)!))",
                                   itemValueColor: K.appColors.green)

                            ItemNameValue(itemName: "First Elected",
                                   itemValue: theFunds.first_elected,
                                   itemValueColor: K.appColors.lightGray)
                            
                            ItemNameValue(itemName: "Next Election",
                                   itemValue: theFunds.next_election,
                                   itemValueColor: K.appColors.red)

                        }
                        .frame(width: UIScreen.main.bounds.width-25, height: 280, alignment: .center)
                        
                        VStack {
                            BarChartView(data: ChartData(values: funds.barChartData), title: "Fund Raising", legend: "Category", style: Styles.barChartMidnightGreenLight, form: ChartForm.extraLarge, dropShadow: false, cornerImage: Image(systemName: "dollarsign.square"))
                        }
                            
                        
                        VStack (spacing: 15){
                            Text(theFunds.origin)
                                .font(.system(size: 15)).fontWeight(.semibold)

                            Link(destination: URL(string: "\(theFunds.source)")!, label: {
                                Text("Source")
                                    .frame(width: 300, height: 35, alignment: .center)
                                    .font(.system(size: 15))
                                    .background(Color(K.appColors.background))
                                    .cornerRadius(15)
                                    .shadow(color: Color(K.appColors.cardShadow),radius: 3)
                            })
                            
                            Text("Last Updated: \(theFunds.last_updated)")
                                .font(.system(size: 11))
                        }
                        .frame(width: UIScreen.main.bounds.width-25, height: 150, alignment: .center)
                        .background(Color(K.appColors.green)).opacity(0.9)
                        .cornerRadius(20)
                        .shadow(radius: 5)
                        
                        
                    }
                        
                    }
                    .frame(width: UIScreen.main.bounds.width)
                    .background(Color(K.appColors.background))
                    .edgesIgnoringSafeArea(.all)
                    .navigationBarTitle("Fund Raising")
                    .navigationBarItems(trailing:
                                            Button(action: {
                                                showCitationView = true
                                                
                                            }){Image(systemName: "info.circle").imageScale(.large)
                                                .sheet(isPresented: $showCitationView) {
                                                    CitationView()
                                                }})
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

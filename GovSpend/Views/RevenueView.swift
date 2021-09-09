//
//  RevenueView.swift
//  GovSpend
//
//  Created by Isaac M on 8/8/21.
//

import SwiftUI
import SwiftUICharts

struct RevenueView: View {

    @StateObject var taxRevenue: RevenueManager
    @StateObject var gift: GiftRevenueManager
    @State private var showCitationView: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView  (showsIndicators: false) {
                
                    VStack (spacing: 50){
                        
                        VStack (spacing: 20){
                        Text("IRS Tax and Non-Tax Revenue")
                            .font(.system(size: 12))
                            .frame(width: 250, height: 35, alignment: .center)
                            .background(Color(.systemGreen))
                            .cornerRadius(10)
                            .shadow(color: Color(K.appColors.cardShadow), radius: 2)
                        
                        BarChartView(data: ChartData(values: taxRevenue.barChartData), title: "Daily IRS Revenue", legend: "Date", style: Styles.barChartMidnightGreenLight, form: ChartForm.extraLarge, dropShadow: false, cornerImage: Image(systemName: "dollarsign.square"))
                        
                        }
                        
                        VStack (spacing: 20){
                        Text("Gift Contributions to Reduce the Public Debt")
                            .font(.system(size: 12))
                            .frame(width: 300, height: 35, alignment: .center)
                            .background(Color(.systemGreen))
                            .cornerRadius(10)
                            .shadow(color: Color(K.appColors.cardShadow), radius: 2)
                        
                        
                        BarChartView(data: ChartData(values: gift.barChartData), title: "Monthly Contributions", legend: "Date", style: Styles.barChartMidnightGreenLight, form: ChartForm.extraLarge, dropShadow: false, cornerImage: Image(systemName: "dollarsign.square"))
                        }
                        
                        VStack {
                            if let revenueDate = taxRevenue.revenue.first {
                                
                                Text("Updated: \(revenueDate.record_date)")
                                    .font(.system(size: 8)).fontWeight(.semibold).padding(.top)
                            }
                        }
                        
                    }
                    .padding(.top)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height,  alignment: .top)
                    .background(Color(K.appColors.background))
                

   

               
            }
            .navigationBarTitle("Gov$pend", displayMode: .inline)
            .navigationBarItems(trailing:
                                    Button(action: {
                                        showCitationView = true

                                    }){Image(systemName: "info.circle").imageScale(.large)
                                        .sheet(isPresented: $showCitationView) {
                                        CitationView()
                                    }})
            .onAppear() {

                taxRevenue.getMonthlyRevenue()
                gift.getGiftRevenue()
        }
        }
    }
}

struct RevenueView_Previews: PreviewProvider {
    static var previews: some View {
        RevenueView(taxRevenue: RevenueManager(), gift: GiftRevenueManager())
    }
}

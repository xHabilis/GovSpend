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
                        Text("Tax and Non-Tax Revenue ")
                            .font(.system(size: 13)).fontWeight(.semibold).padding(.vertical, 5.0)
                        
                        BarChartView(data: ChartData(values: taxRevenue.barChartData), title: "Daily Revenue", legend: "Date", style: Styles.barChartMidnightGreenLight, form: ChartForm.extraLarge)
                        
                        }
                        
                        VStack (spacing: 20){
                        Text("Gift Contributions to Reduce the Public Debt")
                            .font(.system(size: 13)).fontWeight(.semibold).padding(.vertical, 5.0)
                        
                        
                        BarChartView(data: ChartData(values: gift.barChartData), title: "Monthly Contributions", legend: "Date", style: Styles.barChartMidnightGreenDark, form: ChartForm.extraLarge)
                        }
                        
                        
                        
                    }
                    .padding(.top)
                    .frame(width: UIScreen.main.bounds.width-15, alignment: .top)

   

               
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

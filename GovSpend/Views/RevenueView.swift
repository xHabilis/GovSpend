//
//  RevenueView.swift
//  GovSpend
//
//  Created by Isaac M on 8/8/21.
//

import SwiftUI
import SwiftUICharts

struct RevenueView: View {

    @StateObject var taxRevenue: TaxRevenueManager
    @StateObject var nonTaxRevenue: NonTaxRevenueManager
    @StateObject var gift: GiftRevenueManager
    @State private var showCitationView: Bool = false
    
    var body: some View {
        ZStack {
            Color(K.appColors.background)
                .edgesIgnoringSafeArea(.bottom)
            ScrollView  (showsIndicators: false) {
                   
                    
                        VStack (spacing: 25){

                            
                            if let taxRevenue = taxRevenue.revenue.first, let nonTaxRevenue = nonTaxRevenue.nonTaxRevenue.first {
                                VStack (spacing: 10) {
                                    
                                    let total = Double(taxRevenue.net_collections_amt)! + Double(nonTaxRevenue.net_collections_amt)!
                                    
                                    Text("IRS Revenue Collected")
                                        .font(.system(size: 13)).fontWeight(.semibold).padding(.vertical, 5.0)
                                    Text(Configs.convertToDollars(someDouble: total))
                                        .font(.system(size: 20))
                                        .foregroundColor(.green)
                                        .frame(width: 250, height: 35, alignment: .center)
                                        .background(Color(K.appColors.background))
                                        .cornerRadius(10)
                                        .shadow(color: Color(K.appColors.cardShadow), radius: 2)
                                    
                                    Text("Tax Revenue")
                                        .font(.system(size: 12)).fontWeight(.semibold)
                                    Text(Configs.convertToDollars(someDouble: Double(taxRevenue.net_collections_amt)!))
                                        .font(.system(size: 12))
                                        .padding(.bottom, 3.0)
                                    
                                    Text("Non-Tax Revenue")
                                        .font(.system(size: 12)).fontWeight(.semibold)
                                    Text(Configs.convertToDollars(someDouble: Double(nonTaxRevenue.net_collections_amt)!))
                                        .font(.system(size: 12))
                                    
                                    Text("Last updated: \(taxRevenue.record_date)")
                                        .font(.system(size: 8.5))
                                    
                                }
                                .frame(width: UIScreen.main.bounds.width-74, height: 200, alignment: .center)

                            }
                            VStack {
                            
                            BarChartView(data: ChartData(values: taxRevenue.barChartData), title: "Daily Tax Revenue", legend: "Date", style: Styles.barChartMidnightGreenDark, form: ChartForm.extraLarge, dropShadow: false, cornerImage: Image(systemName: "dollarsign.square"))
                            
                            BarChartView(data: ChartData(values: nonTaxRevenue.barChartData), title: "Daily Non-Tax Revenue", legend: "Date", style: Styles.barChartMidnightGreenDark, form: ChartForm.extraLarge, dropShadow: false, cornerImage: Image(systemName: "dollarsign.square"))
                                
                                
                            BarChartView(data: ChartData(values: gift.barChartData), title: "Gift contributions to reduce the public Debt", legend: "Date", style: Styles.barChartMidnightGreenDark, form: ChartForm.extraLarge, dropShadow: false, cornerImage: Image(systemName: "dollarsign.square"))
                                
                            }

         
                            
                        }
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height,  alignment: .top)

                }
                .onAppear() {

                    taxRevenue.getTaxRevenue()
                    nonTaxRevenue.getNonTaxRevenue()
                    gift.getGiftRevenue()
                }.animation(.default)
        }
    }
}

struct RevenueView_Previews: PreviewProvider {
    static var previews: some View {
        RevenueView(taxRevenue: TaxRevenueManager(), nonTaxRevenue: NonTaxRevenueManager(), gift: GiftRevenueManager())
    }
}

//
//  HomeTabsView.swift
//  GovSpend
//
//  Created by Isaac M on 7/29/21.
//

import SwiftUI

struct TabManagerView: View {
    var body: some View {
        
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            CampaignFinanceView()
                .tabItem {
                    Label("Campaign", systemImage: "building.columns")
                }
            
            DebtView(annualDebt: AnnualDebtManager(), monthlyDebt: MonthlyDebtManager())
                .tabItem {
                    Label("Debt", systemImage: "list.bullet")
                    
                }
            
            RevenueView(taxRevenue: TaxRevenueManager(), nonTaxRevenue: NonTaxRevenueManager(), gift: GiftRevenueManager())
                .tabItem {
                    Label("Revenue", systemImage: "banknote")
                }

            SavedView()
                .tabItem {
                    Label("Saved", systemImage: "bookmark")
                }

        }
        
    }
}


struct HomeTabsView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self, content: TabManagerView().preferredColorScheme)
        //.previewDevice(PreviewDevice(rawValue: "iPhone 8"))
    }
}

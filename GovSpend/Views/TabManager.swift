//
//  HomeTabsView.swift
//  GovSpend
//
//  Created by Isaac M on 7/29/21.
//

import SwiftUI

struct TabManager: View {
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
            
            RevenueView(taxRevenue: RevenueManager(), gift: GiftRevenueManager())
                .tabItem {
                    Label("Revenue", systemImage: "banknote")
                }
            
            DebtView(annualDebt: AnnualDebtManager(), monthlyDebt: MonthlyDebtManager())
                .tabItem {
                    Label("Debt", systemImage: "list.dash")
                    
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
        ForEach(ColorScheme.allCases, id: \.self, content: TabManager().preferredColorScheme)
        //.previewDevice(PreviewDevice(rawValue: "iPhone 8"))
    }
}

//
//  HomeTabsView.swift
//  GovSpend
//
//  Created by Isaac M on 7/29/21.
//

import SwiftUI

struct HomeTabsView: View {
    var body: some View {
        
        TabView {
            HomeScreenView()
                .tabItem {
                    Label("Campaign", systemImage: "rectangle.stack.person.crop")
                }
            
            DebtView(annualDebt: AnnualDebtManager(), monthlyDebt: MonthlyDebtManager())
                .tabItem {
                    Label("Debt", systemImage: "list.dash")
                    
                }
            
            RevenueView(taxRevenue: RevenueManager(), gift: GiftRevenueManager())
                .tabItem {
                    Label("Revenue", systemImage: "banknote")
                }

        }
        
    }
}


struct HomeTabsView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self, content: HomeTabsView().preferredColorScheme)
        //.previewDevice(PreviewDevice(rawValue: "iPhone 8"))
    }
}

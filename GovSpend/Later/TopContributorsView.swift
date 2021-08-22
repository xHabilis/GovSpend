//
//  TopContributorsView.swift
//  GovSpend
//
//  Created by Isaac M on 7/7/21.
//

import SwiftUI

struct TopContributorsView: View {
    var body: some View {
        ZStack {
            Color("myGreen")
                .edgesIgnoringSafeArea(.all)
            ZStack {
                Color("myBackground")
            }
        }
    }
}













struct TopContributorsView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self, content: TopContributorsView().preferredColorScheme)
    }
}

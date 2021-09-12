//
//  Testing.swift
//  GovSpend
//
//  Created by Isaac M on 9/7/21.
//

import SwiftUI

struct Testing: View {
    
    @State private var candidateName: String = ""
    @State private var cycleYear = "2020"
    @State private var congressNumber = "117"
    @State private var chamber = "House"
    @State private var showCitationView: Bool = false
    @State private var isShowingCandidates: Bool = false
    var body: some View {
        VStack (spacing: 10) {
            
            Text("Total Public Debt Outstanding")
                .font(.system(size: 13)).fontWeight(.semibold).padding(.vertical, 5.0)
            Text("$28,456,765,543,000")
                .font(.system(size: 20)).fontWeight(.semibold)
                .foregroundColor(.red)
                .frame(width: 250, height: 35, alignment: .center)
                .background(Color(K.appColors.background))
                .cornerRadius(10)
                .shadow(color: Color(K.appColors.cardShadow), radius: 2)
            
            
            Text("Debt Held by the Public")
                .font(.system(size: 10)).fontWeight(.semibold)
            Text("$28,456,765,543")
                .font(.system(size: 9))
                .padding(.bottom, 3.0)
            
            Text("Intragovernmental Holdings")
                .font(.system(size: 10)).fontWeight(.semibold)
            Text("$28,456,765,543")
                .font(.system(size: 9))
            
        }
        .frame(width: UIScreen.main.bounds.width-45, height: 200, alignment: .center)
        .background(Color(K.appColors.background))
        .cornerRadius(30)
        .shadow(color: Color(K.appColors.cardShadow),radius: 3)

        
}

struct Testing_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self,
                content: Testing().preferredColorScheme)
        //.previewDevice(PreviewDevice(rawValue: "iPhone 8"))
    }
}
}

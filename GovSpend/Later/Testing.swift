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
        VStack {

            VStack (spacing: 3){
                VStack {
                    
                    Text("Top 20 Candidates")
                        .font(.system(size: 13))
                        .frame(width: UIScreen.main.bounds.width-45, height: 20, alignment: .center)
                        
                }
                .frame(width: UIScreen.main.bounds.width-45, height:20, alignment: .center)
                .background(Color(K.appColors.background))
              

                    HStack(spacing: 30) {
                        VStack (spacing: 10){
                            CategoryLink(CategoryUrlName: "individual-total",
                                         CategoryTitle: "Individual Totals")
                            
                            CategoryLink(CategoryUrlName: "receipts-total",
                                         CategoryTitle: "Receipt Totals")
      
                            CategoryLink(CategoryUrlName: "debts-owed",
                                         CategoryTitle: "Debts Owed")

                        }
                        
                        VStack(spacing: 10) {
                            CategoryLink(CategoryUrlName: "pac-total",
                                         CategoryTitle: "PAC Totals")
                            CategoryLink(CategoryUrlName: "candidate-loan",
                                         CategoryTitle: "Candidate Loans")
                            CategoryLink(CategoryUrlName: "end-cash",
                                         CategoryTitle: "End Cash")
                        }

                    }
                    .frame(width: UIScreen.main.bounds.width-60, height: 130, alignment: .center)

               
                
                VStack {
                    Text("Categories")
                        .font(.system(size: 13))
                        .frame(width: UIScreen.main.bounds.width-45, height: 20, alignment: .center)
                }
                .frame(width: UIScreen.main.bounds.width-45, height: 20, alignment: .center)
                .background(Color(K.appColors.background))
                
            }
            .frame(width: UIScreen.main.bounds.width-45, height: 200, alignment: .center)
            .background(Color(K.appColors.background))
            .cornerRadius(30)
            .shadow(color: Color(K.appColors.cardShadow),radius: 9)
         
        }

        
}

struct Testing_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self,
                content: Testing().preferredColorScheme)
        //.previewDevice(PreviewDevice(rawValue: "iPhone 8"))
    }
}
}

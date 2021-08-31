//
//  Testing.swift
//  GovSpend
//
//  Created by Isaac M on 8/23/21.
//

import SwiftUI


struct Testing: View {

    @State private var candidateName: String = ""
    @State private var cycleYear = "2020"
    @State private var congressNumber = "117"
    @State private var chamber = "Senate"
    @State private var showCitationView: Bool = false
    @State private var isShowingCandidates: Bool = false
    var body: some View {
        
        VStack(spacing: 0){
            VStack  {
                Text("Search FEC Registered Candidates")
                    .font(.system(size: 13)).fontWeight(.semibold)
                    .frame(width: UIScreen.main.bounds.width-45, height: 20, alignment: .center)

                Text("Cycles 2010 - 2020")
                    .font(.system(size: 9))
                    .frame(width: UIScreen.main.bounds.width-45, height: 15, alignment: .center)
            }
            .frame(width: UIScreen.main.bounds.width-45, height: 75, alignment: .center)
            .background(Color(K.appColors.background))
            
            VStack {
            
            VStack{
                Image("fec").resizable().aspectRatio(contentMode: .fit)
                    .frame(width: 140, height: 150, alignment: .center)
                    .shadow(color: Color(K.appColors.cardShadow),radius: 2)

                        
            }

                TextField("Enter Name",
                          text: $candidateName, onCommit:{
                            isShowingCandidates = true
                            
                          })
                    .font(.system(size: 11))
                    .keyboardType(.webSearch)
                    .padding(.leading)
                    .frame(width: 300, height: 40, alignment: .center)
                    .background(Color(K.appColors.background))
                    .cornerRadius(10)
                    .shadow(color: Color(K.appColors.cardShadow),radius: 0.4)
             
        }
        .frame(width: UIScreen.main.bounds.width-45, height: 250, alignment: .center)
        .background(Color(K.appColors.eggShell))

            VStack {
                //Year Picker
                Picker(cycleYear, selection: $cycleYear) {
                    ForEach(Configs.cycles.reversed(), id: \.self) {
                        Text($0)
                            .font(.system(size: 12))
                    }
                    .font(.system(size: 14))
                    .foregroundColor(Color.black)
                }

                //Picker Poperties
                .pickerStyle(MenuPickerStyle())
                .font(.system(size: 12))
                .frame(width: 125, height: 35, alignment: .center)
                .background(Color(K.appColors.grayBrown))
                .foregroundColor(.accentColor)
                .cornerRadius(15)
                .shadow(color: Color(K.appColors.cardShadow),radius: 1.5)
            }
            .frame(width: UIScreen.main.bounds.width-45, height: 75, alignment: .center)
            .background(Color(K.appColors.background))

        //Present Search Results
        NavigationLink(destination: FECSearchResultsView(candidateSearchManager: FECCandidateSearchManager(),
                                                         candidateDetailsManager: CandidateDetailsManager(),
                                                         searchName: candidateName,
                                                         theYear: cycleYear),
                       isActive: $isShowingCandidates) { EmptyView() }
            
        }
        .frame(width: UIScreen.main.bounds.width-45, height: 390, alignment: .center)
        .cornerRadius(24)
        .shadow(color: Color(K.appColors.cardShadow),radius: 2)
        
        VStack {

            VStack(spacing: 25) {
                VStack {
                    
                    Text("Top 20 Candidates")
                        .font(.system(size: 13)).fontWeight(.semibold)
                        .frame(width: UIScreen.main.bounds.width-45, height: 20, alignment: .center)
                    
                    Text("Categories")
                        .font(.system(size: 9))
                        .frame(width: UIScreen.main.bounds.width-45, height: 15, alignment: .center)
                }
                .frame(width: UIScreen.main.bounds.width-45, height: 75, alignment: .center)
                .background(Color(K.appColors.background))
                
                HStack (spacing: 25){
                    VStack(spacing: 15) {
                        CategoryLink(CategoryUrlName: "individual-total",
                                     CategoryTitle: "Individual Totals")
                        CategoryLink(CategoryUrlName: "candidate-loan",
                                     CategoryTitle: "Candidate Loans")
                        CategoryLink(CategoryUrlName: "end-cash",
                                     CategoryTitle: "End Cash")
                    }
                    
                    VStack (spacing: 15){
                        
                        CategoryLink(CategoryUrlName: "pac-total",
                                     CategoryTitle: "PAC Totals")
                        CategoryLink(CategoryUrlName: "debts-owed",
                                     CategoryTitle: "Debts Owed")
                        CategoryLink(CategoryUrlName: "receipts-total",
                                     CategoryTitle: "Receipt Totals")
                    }
                }
            
            }
            .frame(width: UIScreen.main.bounds.width-45, height: 250, alignment: .top)
            .background(Color(K.appColors.cardShadowReverse))
            .cornerRadius(24)
            .shadow(color: Color(K.appColors.cardShadow),radius: 2)
         
        }
}

struct Testing_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self, content: Testing().preferredColorScheme)
        //.previewDevice(PreviewDevice(rawValue: "iPhone 8"))
    }
}
}


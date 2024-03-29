//
//  HomeScreen.swift
//  GovSpend
//
//  Created by Isaac M on 7/7/21.
//

import SwiftUI

struct CampaignFinanceView: View {

    @State private var candidateName: String = ""
    @State private var cycleYear = "2020"
    @State private var congressNumber = "117"
    @State private var chamber = "House"
    @State private var showCitationView: Bool = false
    @State private var isShowingCandidates: Bool = false
   
    var body: some View {
        
        NavigationView {
            ScrollView (showsIndicators: false){
                ZStack {

                    
                    VStack (spacing: 35) {
                        VStack(spacing: 0) {
                 
                                VStack(spacing: 2){
                                    VStack{
                                        
                                        Text("Search Congress")
                                            .font(.system(size: 13)).fontWeight(.semibold)
                                            .frame(width: UIScreen.main.bounds.width-45, height: 20, alignment: .center)

                                    }
                                    HStack{
                                        Text("House: Sessions 102-117")
                                            .font(.system(size: 9))
                                        Text("Senate: Sessions 80-117")
                                            .font(.system(size: 9))
                                    }
                                }
                                .frame(width: UIScreen.main.bounds.width-45, height: 75, alignment: .center)
                                .background(Color(K.appColors.background))
                            
                                
                            Image("congressVectorOne").resizable().aspectRatio(contentMode: .fill)
                                .background(Color(K.appColors.background))
                                    .frame(width: UIScreen.main.bounds.width-45, height: 250, alignment: .center)
                                

                            HStack (spacing: 15) {
                                Picker(congressNumber, selection: $congressNumber) {
                                    ForEach(AppSettings.AllCongressSessions, id: \.self) {
                                        Text($0)
                                            .font(.system(size: 12))
                                        
                                    }
                                    .font(.system(size: 12))
                                    .foregroundColor(.accentColor)
                                    
                                }
                                
                                //Picker Poperties
                                .font(.system(size: 12))
                                .frame(width: 125, height: 35, alignment: .center)
                                .pickerStyle(MenuPickerStyle())
                                .background(Color(K.appColors.grayBrown))
                                .foregroundColor(.accentColor)
                                .cornerRadius(15)
                                .shadow(color: Color(K.appColors.cardShadow),radius: 1.5)

                                
                                
                                Picker(chamber, selection: $chamber) {
                                    ForEach(AppSettings.chambers, id: \.self) {
                                        Text($0)
                                            .font(.system(size: 12))
                                        
                                    }
                                    .font(.system(size: 1))
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


                                NavigationLink(
                                    destination: CongressSearchResultsView(theLocation: CoreLocationManager(), personalFinance: FinancesManager(), congress: AllCongressManager(),congressNum: congressNumber, congressChamber: chamber),
                                    label: {
                                        
                                        Image("blueArrow")
                                            .resizable()
                                            .frame(width: 25, height: 25, alignment: .center)
                                        
                                    })
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 12))
                                    .shadow(color: .black,radius: 1.5)

                            }
                            .frame(width: UIScreen.main.bounds.width-45, height: 75, alignment: .center)
                            .background(Color(K.appColors.background))
                            
                            
                        }
                        .frame(width: UIScreen.main.bounds.width-45, height: 390, alignment: .center)
                        .cornerRadius(30)
                        .shadow(color: Color(K.appColors.cardShadow),radius: 6)


//MARK: - Second Card: Search ALL FEC Candidates
       
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

                            VStack (spacing: 25) {

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
                                    .background(Color(K.appColors.cardShadowReverse))
                                    .cornerRadius(10)
                                    .shadow(color: Color(K.appColors.cardShadow),radius: 0.4)

                        }
                        .frame(width: UIScreen.main.bounds.width-45, height: 250, alignment: .center)
                        .background(Color(K.appColors.background))

                            

                            VStack {
                                //Year Picker
                                Picker(cycleYear, selection: $cycleYear) {
                                    ForEach(AppSettings.cycles.reversed(), id: \.self) {
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
                                                                         searchName: candidateName, theYear: cycleYear),
                                       isActive: $isShowingCandidates) { EmptyView() }

                        }
                        .frame(width: UIScreen.main.bounds.width-45, height: 390, alignment: .center)
                        .cornerRadius(30)
                        .shadow(color: Color(K.appColors.cardShadow),radius: 6)
                                         
//MARK: - Third Card: Categories
                        VStack {

                            VStack (spacing: 3){
                                VStack {
                                    
                                    Text("Top 20 Candidates")
                                        .font(.system(size: 13)).fontWeight(.semibold)
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
                                        .font(.system(size: 13)).fontWeight(.semibold)
                                        .frame(width: UIScreen.main.bounds.width-45, height: 20, alignment: .center)
                                }
                                .frame(width: UIScreen.main.bounds.width-45, height: 20, alignment: .center)
                                .background(Color(K.appColors.background))
                                
                            }
                            .frame(width: UIScreen.main.bounds.width-45, height: 200, alignment: .center)
                            .background(Color(K.appColors.background))
                            .cornerRadius(30)
                            .shadow(color: Color(K.appColors.cardShadow),radius: 6)
                         
                        }
                        


                        
                    }
                    .padding(.top)
                    //Main Stack
                    .frame(width: UIScreen.main.bounds.width-15, alignment: .center)
                }
            
        }
            .navigationBarTitle("GovSpend", displayMode: .inline)
            .navigationBarItems(trailing:
                                    Button(action: {
                                        showCitationView = true

                                    }){Image(systemName: "info.circle").imageScale(.large)
                                        .sheet(isPresented: $showCitationView) {
                                        CitationView()
                                    }})
        }
        .onAppear().animation(.default)
 
    }
    
    struct HomeScreenView_Previews: PreviewProvider {
        static var previews: some View {
            ForEach(ColorScheme.allCases, id: \.self,
                    content: CampaignFinanceView().preferredColorScheme)
            //.previewDevice(PreviewDevice(rawValue: "iPhone 8"))
        }
    }
    
}


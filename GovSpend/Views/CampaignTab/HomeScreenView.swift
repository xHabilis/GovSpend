//
//  HomeScreen.swift
//  GovSpend
//
//  Created by Isaac M on 7/7/21.
//

import SwiftUI

struct HomeScreenView: View {

    @State private var candidateName: String = ""
    @State private var cycleYear = "2020"
    @State private var congressNumber = "117"
    @State private var chamber = "Senate"
    @State private var showCitationView: Bool = false
    @State private var isShowingCandidates: Bool = false
   


    var body: some View {
        
        NavigationView {
            ScrollView (showsIndicators: false){
                ZStack {
                    Color(K.appColors.background)
                        //.edgesIgnoringSafeArea(.all)

                    
                    VStack (spacing: 25) {
                        Text("Search Congress")
                            .font(.system(size: 13)).fontWeight(.semibold)
                            .frame(width: UIScreen.main.bounds.width-45, height: 25, alignment: .bottom).padding(.bottom, -10.0)
                        VStack (spacing: 30){
                            
//MARK: - First Card: Search by Congress and Chamber
    
                            VStack(spacing: 2){
                                
                                VStack{
                                    Text("House Chambers: 102-117")
                                        .font(.system(size: 9))
                                    
                                }
                                VStack{
                                    Text("Senate Chambers: 80-117")
                                        .font(.system(size: 9))
                                }
                            }
                            .frame(width: UIScreen.main.bounds.width-45, height: 65, alignment: .center)
                            .background(Color(K.appColors.blue))
                            .font(.system(size: 12))
                            
                            VStack (spacing: 15) {
                                Picker(congressNumber, selection: $congressNumber) {
                                    ForEach(Configs.AllCongressSessions.reversed(), id: \.self) {
                                        Text($0)
                                            .font(.system(size: 12))
                                        
                                    }
                                    .font(.system(size: 12))
                                    .foregroundColor(.accentColor)
                                    
                                }
                                
                                //Picker Poperties
                                .font(.system(size: 12))
                                .pickerStyle(MenuPickerStyle())
                                .frame(width: 125, height: 35, alignment: .center)
                                .background(Color(K.appColors.grayBrown))
                                .foregroundColor(.accentColor)
                                .cornerRadius(15)

                                
                                
                                Picker(chamber, selection: $chamber) {
                                    ForEach(Configs.chambers, id: \.self) {
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

                                
                                //Search: GO Button
                                NavigationLink(
                                    destination: CongressSearchResultsView(personalFinance: FinancesManager(), congress: AllCongressManager(),congressNum: congressNumber, congressChamber: chamber),
                                    label: {
                                        
                                        Image("blueArrow")
                                            .resizable()
                                            .frame(width: 25, height: 25, alignment: .center)
                                        
                                    })
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 12))
                                    //.frame(width: 40, height: 30, alignment: .center)
                                    //.background(Color(K.appColors.background))
                                    //.cornerRadius(7)
                                    .shadow(color: .black,radius: 1.5)

                            }

                        }
                        .frame(width: UIScreen.main.bounds.width-75, height: 250, alignment: .top)
                        .background(Color(K.appColors.cardShadowReverse))
                        .cornerRadius(24)
                        //.shadow(color: .black, radius: 2)
                        .shadow(color: Color(K.appColors.cardShadow),radius: 3.5)
                      
                        
//MARK: - Second Card: Search ALL FEC Candidates
                        Text("Search FEC Registered Candidates")
                            .font(.system(size: 13)).fontWeight(.semibold).padding(.bottom, -10.0)
                            .frame(width: UIScreen.main.bounds.width-45, height: 15, alignment: .bottom)

                        VStack(spacing: 30) {
                            VStack (spacing: 15) {
                                Text("Cycles 2010 - 2020")
                                    .font(.system(size: 9))
                                    .frame(width: UIScreen.main.bounds.width-45, height: 15, alignment: .center)
                            }
                            .frame(width: UIScreen.main.bounds.width-45, height: 65, alignment: .center)
                            .background(Color(K.appColors.red))

                            TextField("Enter Name",
                                      text: $candidateName, onCommit:{
                                        isShowingCandidates = true

                                      })
                                .font(.system(size: 11))
                                .keyboardType(.webSearch)
                                .padding(.leading)
                                .frame(width: 280, height: 40, alignment: .center)
                                .background(Color(K.appColors.background))
                                .cornerRadius(10)
                                .shadow(color: Color(K.appColors.cardShadow),radius: 0.4)


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
                        .clipped()

                        //Present Search Results
                        NavigationLink(destination: FECSearchResultsView(candidateSearchManager: FECCandidateSearchManager(),
                                                                         candidateDetailsManager: CandidateDetailsManager(),
                                                                         searchName: candidateName,
                                                                         theYear: cycleYear),
                                       isActive: $isShowingCandidates) { EmptyView() }
                        
                        }
                        .frame(width: UIScreen.main.bounds.width-75, height: 250, alignment: .top)
                        .background(Color(K.appColors.cardShadowReverse))
                        .cornerRadius(24)
                        //.shadow(color: .black, radius: 2)
                        .shadow(color: Color(K.appColors.cardShadow),radius: 3.5)
                        
                        
//MARK: - Categories
                        VStack (spacing: 10) {
                        Text("Top 20 Candidates - Categories")
                            .font(.system(size: 13)).fontWeight(.semibold)
                            .frame(width: 290, height: 28, alignment: .center)
                        
                        VStack {
                        HStack (spacing:30){
                            VStack(spacing: 25) {
                                
                                CategoryLink(CategoryUrlName: "candidate-loan",
                                             CategoryTitle: "Candidate Loans")
                                CategoryLink(CategoryUrlName: "debts-owed",
                                             CategoryTitle: "Debts Owed")
                                CategoryLink(CategoryUrlName: "end-cash",
                                             CategoryTitle: "End Cash")
                            }
                            
                            VStack (spacing: 25){
                                CategoryLink(CategoryUrlName: "individual-total",
                                             CategoryTitle: "Individual Totals")
                                CategoryLink(CategoryUrlName: "pac-total",
                                             CategoryTitle: "PAC Totals")
                                CategoryLink(CategoryUrlName: "receipts-total",
                                             CategoryTitle: "Receipt Totals")
                            }
                        }
                        
                        }
                        .frame(width: UIScreen.main.bounds.width-75, height: 200, alignment: .center)
                        .background(Color(K.appColors.cardShadowReverse))
                        .cornerRadius(24)
                        //.shadow(color: .black, radius: 2)
                        .shadow(color: Color(K.appColors.cardShadow),radius: 3.5)
                    Spacer()
                     
                    }
                    

                        
                    }
                    //Main Stack
                    .frame(width: UIScreen.main.bounds.width-15, alignment: .center)
                }
            
        }
            .navigationBarTitle("Gov$pend", displayMode: .inline)
            .navigationBarItems(trailing:
                                    Button(action: {
                                        showCitationView = true

                                    }){Image(systemName: "info.circle").imageScale(.large)
                                        .sheet(isPresented: $showCitationView) {
                                        CitationView()
                                    }})
        }
        .onAppear().animation(.default)
        .onDisappear().animation(.default)
 
    }
    
    struct HomeScreenView_Previews: PreviewProvider {
        static var previews: some View {
            ForEach(ColorScheme.allCases, id: \.self,
                    content: HomeScreenView().preferredColorScheme)
            //.previewDevice(PreviewDevice(rawValue: "iPhone 8"))
        }
    }
    
}


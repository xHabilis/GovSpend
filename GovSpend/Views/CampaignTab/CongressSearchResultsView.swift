//
//  CurrentCongressLegislatorsView.swift
//  GovSpend
//
//  Created by Isaac M on 7/14/21.
//

import SwiftUI

struct CongressSearchResultsView: View {
    
    @StateObject var personalFinance: FinancesManager
    @StateObject var congress: AllCongressManager
    
    @State private var showCitationView: Bool = false
    @State private var searchText : String = ""
    
    
    var congressNum: String
    var congressChamber: String
    
    @ViewBuilder
    var body: some View {
        
        if congress.congressResults.count == 0 {
            LoadingView()
        }
        
        VStack {
            
            SearchBar(text: $searchText)
                .padding(.top)
            List(congress.congressResults.filter({ searchText.isEmpty ? true : $0.fullName.contains(searchText) })) { legislator in

                NavigationLink(
                    destination: FinancesView(theFinancials: FinancesManager(), firstName: legislator.first_name ?? "",
                                              lastName: legislator.last_name ?? "",
                                              bioID: legislator.id!,
                                              cID: legislator.crp_id ?? "",
                                              title: legislator.short_title ?? "",
                                              party: legislator.party ?? "",
                                              state: legislator.state ?? "",
                                              status: Configs.makeStatus(status: String(legislator.in_office!)),
                                              nextElection: legislator.next_election ?? "",
                                              facebook: legislator.facebook_account ?? "",
                                              twitter: legislator.twitter_account ?? "",
                                              youtube: legislator.youtube_account ?? "",
                                              contact: legislator.contact_form ?? "",
                                              phone: legislator.phone ?? "",
                                              website: legislator.url ?? ""),
                    label: {

                        HStack (spacing: 13){
                            VStack{
                                let id = legislator.id!
                                let fullImageURL = "\(K.apiURLs.imageURL)\(String(describing: id))\(K.apiURLs.imageURLjpg)"
                                RemoteImage(url: fullImageURL)
                                    .background(Color(K.appColors.background))
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 70, height: 60, alignment: .leading)
                                    .clipShape(Rectangle())
                                    .shadow(color: Color(.black), radius: 5)
                                    .cornerRadius(8)
                                    
                            }

                            VStack(spacing: 2){

                                CongressListCard(firstName: legislator.first_name ?? "",
                                                 lastName: legislator.last_name ?? "",
                                                 party: legislator.party ?? "",
                                                 statusTitle: "Current Status:",
                                                 status: String(legislator.in_office ?? false),
                                                 stateTitle: "State:",
                                                 state:  "\(Configs.extendAbbreviation(StateName: legislator.state ?? "N/A"))")

                            }.animation(.linear)
                            .frame(width: UIScreen.main.bounds.width-130, height: 60, alignment: .center)
                            .background(Configs.chooseColor(for: legislator.party ?? ""))
                            .cornerRadius(8)
                            .shadow(color: Color(K.appColors.cardShadow),radius: 1.5)

                        }
                    })
            
            
            
            }
            
            .onAppear() {
                
                congress.getCongress(congressNumber: congressNum, chamber: congressChamber)
                
            }
            
            .navigationBarTitle("\(congressChamber) - \(congressNum)", displayMode: .inline)
            
            .navigationBarItems(trailing:
                                    Button(action: {
                                        showCitationView = true
                                        
                                    }){Image(systemName: "info.circle").imageScale(.large)
                                        .sheet(isPresented: $showCitationView) {
                                            CitationView()
                                        }})
            
        }
    }
    
    
    
}



struct CurrentCongressResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self, content: CongressSearchResultsView(personalFinance: FinancesManager(), congress: AllCongressManager(),congressNum: "", congressChamber: "").preferredColorScheme)
        //.previewDevice(PreviewDevice(rawValue: "iPhone 8"))
    }
}


//
//  CurrentCongressLegislatorsView.swift
//  GovSpend
//
//  Created by Isaac M on 7/14/21.
//

import SwiftUI
import CoreLocation


struct CongressSearchResultsView: View {
    
    
    @ObservedObject var theLocation: CoreLocationManager
    @StateObject var personalFinance: FinancesManager
    @StateObject var congress: AllCongressManager
    @State private var showCitationView: Bool = false
    @State private var searchText : String = ""
    @State private var showAlert = false
    @State private var activeAlert: Alerts = .locationDenied

    var congressNum: String
    var congressChamber: String
    
    @ViewBuilder
    var body: some View {
        
        if congress.congressResults.count == 0 {
            LoadingView()
        }
        
        VStack {
            HStack (spacing: 0){
                
                //Core Location & Alerts
                Button(action: {

                    if theLocation.isDisabled {self.activeAlert = .locationDisabled
                        self.showAlert = true
                    }
                    if theLocation.isDenied {self.activeAlert = .locationDenied
                        self.showAlert = true
                    }
                    if theLocation.isRestricted {self.activeAlert = .locationRestricted
                        self.showAlert = true
                    }
                    
                    theLocation.checkForLocationServices()
                    searchText = theLocation.theAddress ?? ""

                }) {
                    Image(systemName: "location.circle").imageScale(.large)
                        .padding(.top, 5.0)
                }
                .alert(isPresented: $showAlert) {
                    switch activeAlert {
                    
                    case .locationDisabled:
                        return Alert(title: Text("Location access is Disabled"), message: Text("Please Enable in Settings"), dismissButton: .default(Text("OK")))
                        
                    case .locationDenied:
                        return Alert(title: Text("Location access request was denied"), message: Text("Please Allow Location Access for GovSpend in Location Settings"), dismissButton: .default(Text("OK")))
                        
                    case .locationRestricted:
                        return Alert(title: Text("Location access is Restricted"), message: Text("Please confirm this applications access in your settings."), dismissButton: .default(Text("OK")))
                    }
                }
                
                SearchBar(text: $searchText)
                    .padding(.top, 5.0)
                
            }
            
           
            
            //Filtered List
            List(congress.congressResults.filter({ searchText.isEmpty ? true : $0.fullName.contains(searchText) || $0.state!.contains(searchText) || $0.state!.contains(searchText) })) {
                legislator in

                NavigationLink(
                    destination: FinancesView(theFinancials: FinancesManager(), firstName: legislator.first_name ?? "",
                                              lastName: legislator.last_name ?? "",
                                              bioID: legislator.id!,
                                              cID: legislator.crp_id ?? "",
                                              title: legislator.short_title ?? "",
                                              party: legislator.party ?? "",
                                              state: legislator.state ?? "",
                                              status: AppSettings.makeStatus(status: String(legislator.in_office!)),
                                              nextElection: legislator.next_election ?? "",
                                              facebook: legislator.facebook_account ?? "",
                                              twitter: legislator.twitter_account ?? "",
                                              youtube: legislator.youtube_account ?? "",
                                              contact: legislator.contact_form ?? "",
                                              phone: legislator.phone ?? "",
                                              website: legislator.url ?? ""),
                    label: {

                        if #available(iOS 15, *) {
                            //iOS 15 View
                        
                        HStack (spacing: 13){
                            VStack{
                                let id = legislator.id!
                                let fullImageURL = "\(K.apiURLs.imageURL)\(String(describing: id))\(K.apiURLs.imageURLjpg)"
                                RemoteImage(url: fullImageURL)
                                    .aspectRatio(contentMode: .fill)
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
                                                 state:  "\(AppSettings.extendAbbreviation(StateName: legislator.state ?? "N/A"))")
                                
                            }.animation(.linear)
                            .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)
                            .background(AppSettings.chooseColor(for: legislator.party ?? ""))
                            .cornerRadius(8)
                            .shadow(color: Color(K.appColors.cardShadow),radius: 1.5)
                            
                        }
                    } else {
                       //iOS 14 View
                        
                        HStack (spacing: 13){
                            VStack{
                                let id = legislator.id!
                                let fullImageURL = "\(K.apiURLs.imageURL)\(String(describing: id))\(K.apiURLs.imageURLjpg)"
                                RemoteImage(url: fullImageURL)
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
                                                 state:  "\(AppSettings.extendAbbreviation(StateName: legislator.state ?? "N/A"))")
                                
                            }.animation(.linear)
                            .frame(width: UIScreen.main.bounds.width-130, height: 60, alignment: .center)
                            .background(AppSettings.chooseColor(for: legislator.party ?? ""))
                            .cornerRadius(8)
                            .shadow(color: Color(K.appColors.cardShadow),radius: 1.5)
                            
                            
                        }
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
        ForEach(ColorScheme.allCases, id: \.self, content: CongressSearchResultsView(theLocation: CoreLocationManager(), personalFinance: FinancesManager(), congress: AllCongressManager(),congressNum: "", congressChamber: "").preferredColorScheme)
        //.previewDevice(PreviewDevice(rawValue: "iPhone 8"))
    }
}



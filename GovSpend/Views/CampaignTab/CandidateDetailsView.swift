//
//  CandidateDetailsView.swift
//  GovSpend
//
//  Created by Isaac M on 7/9/21.
//

import SwiftUI

struct CandidateDetailsView: View {

    @StateObject var detailsManager: CandidateDetailsManager
    @State private var showCitationView: Bool = false
 

    let candidateURL: String

    var body: some View {
            ScrollView {
            HStack {
                VStack {
                    HStack (spacing: 8){
                        
                        if let details = detailsManager.candidateDetails.first {
       
                        VStack(spacing: 7) {
                            HStack (spacing: 7) {
                                VStack (spacing: 7){
                                    
                                    VStack (spacing: 5){
                                        
                                        Text(details.display_name)
                                            .font(.system(size: 14).bold())
                                        Text(Configs.extendAbbreviation(StateName: "\(details.mailing_state)"))
                                            .font(.system(size: 12)).fontWeight(.semibold)
                                    }
                                    .frame(width: 300, height: 30, alignment: .center)
                                    //.background(Color(K.appColors.green))
                                    
                                    
                                    HStack {
                                        
                                        Text("Party:")
                                            .font(.system(size: 11))
                                            .frame(width: 100, height: 20, alignment: .trailing)
                                        Text(Configs.getLongName(for: details.party))
                                            .font(.system(size: 11))
                                            .frame(width: 100, height: 20, alignment: .leading)
                                    }
                                    .frame(width: 300, height: 10, alignment: .center)
                                    //.background(Color(K.appColors.green))
                                    
                                    HStack {
                                        
                                        Text("Status:")
                                            .font(.system(size: 11))
                                            .frame(width: 100, height: 20, alignment: .trailing)
                                        Text(Configs.makeStatus(status: "\(details.status)"))
                                            .font(.system(size: 11))
                                            .frame(width: 100, height: 20, alignment: .leading)
                                    }
                                    .frame(width: 300, height: 10, alignment: .center)
                                    //.background(Color(K.appColors.green))

                                    
                                }
                                
                            }
                            .frame(width: UIScreen.main.bounds.width-50, height: 90, alignment: .center)
                            .background(Color(K.appColors.background))
                            .shadow(radius: 1)
                            .cornerRadius(8)
                            
                            if let iconData = detailsManager.candidateDetails.first {
                            
                            HStack (spacing: 35) {
                                Link(destination: URL(string: "\(iconData.facebook_url)")!, label: {
                                    Image("facebook").resizable().frame(width: 20, height: 20, alignment: .center)
                                })
                                Link(destination: URL(string: "https://twitter.com/\(iconData.twitter_user)")!, label: {
                                    Image("twitter").resizable().frame(width: 20, height: 20, alignment: .center)
                                })
                                Link(destination: URL(string: "\(iconData.url)")!, label: {
                                    Image("website").resizable().frame(width: 20, height: 20, alignment: .center)
                                })
                                Link(destination: URL(string: "\(iconData.fec_uri)")!, label: {
                                    Image("money")
                                })

                            }
                            .frame(width: UIScreen.main.bounds.width-50, height: 30, alignment: .center)
                            .background(Configs.chooseColor(for: iconData.party ))
                            .cornerRadius(8)
                            
                            }
                        }
                        .frame(width: UIScreen.main.bounds.width-25, height: 145, alignment: .center)
                        .background(Color(K.appColors.lightGray))
                        .shadow(radius: 5)
                        .cornerRadius(8)
                        
                        
                        } else {
                            LoadingView()
                        }

                    }
                    .frame(width: 420, height: 160, alignment: .center)
                    //.background(Color(K.appColors.lightGray))


//MARK: - Committee Button
                    
                    if let path = detailsManager.candidateDetails.first {
                    NavigationLink(
                        destination: CommitteesView(committeeObject: CommitteeManager(), commiteePath: path.committee!),
                        label: {

                            Text("Committees")
                                .padding(.horizontal)


                        })
                        .foregroundColor(Color.black)
                        .font(.system(size: 12))
                        .frame(width: UIScreen.main.bounds.width-300, height: 40, alignment: .center)
                        .background(Configs.chooseColor(for: path.party ))
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    }
                    
                    
                    VStack (spacing: 10){

                        
                        if let candidate = detailsManager.candidateDetails.first {
                        
                        ItemNameValue(itemName: "Total Receipts",
                               itemValue: "\(Configs.convertToDollars(someDouble: candidate.total_receipts))",
                               itemValueColor: K.appColors.green)
                        ItemNameValue(itemName: "Total from Individuals",
                               itemValue: "\(Configs.convertToDollars(someDouble: candidate.total_from_individuals))",
                               itemValueColor: K.appColors.green)
                            
                        ItemNameValue(itemName: "Total from Pacs",
                               itemValue: "\(Configs.convertToDollars(someDouble: candidate.total_from_pacs))",
                               itemValueColor: K.appColors.green)
                            
                        ItemNameValue(itemName: "Total Contributions",
                               itemValue: "\(Configs.convertToDollars(someDouble: candidate.total_contributions))",
                               itemValueColor: K.appColors.green)
                            
                        ItemNameValue(itemName: "Candidate Loans",
                               itemValue: "\(Configs.convertToDollars(someDouble: candidate.candidate_loans))",
                               itemValueColor: K.appColors.green)
                            
                        ItemNameValue(itemName: "Begin Cash",
                               itemValue: "\(Configs.convertToDollars(someDouble: candidate.begin_cash))",
                               itemValueColor: K.appColors.green)
                            
                        ItemNameValue(itemName: "End Cash",
                               itemValue: "\(Configs.convertToDollars(someDouble: candidate.end_cash))",
                               itemValueColor: K.appColors.green)
                            
                        ItemNameValue(itemName: "Pac Refunds",
                               itemValue: "\(Configs.convertToDollars(someDouble: candidate.pac_refunds))",
                               itemValueColor: K.appColors.green)
                            
                        ItemNameValue(itemName: "Debts Owed",
                               itemValue: "\(Configs.convertToDollars(someDouble: candidate.debts_owed))",
                               itemValueColor: K.appColors.green)

                        }else {
                            LoadingView()
                        }

                    }
                    ///Totals Frame
                    .padding(.top)
                    .frame(width: 400, height: 400, alignment: .center)
                    // .background(Color("myBackground"))
                    .cornerRadius(8)
                    .shadow(radius: 2)
                    
                    
                    
                    VStack (spacing: 10){
                        if let copyInfo = detailsManager.candidateDetailsMetaData {
                            Text("\(copyInfo.copyright)")
                                .font(.system(size: 12))
                        }
                        
                        //Text(theFunds.source)
                        Link("ProPublica", destination: URL(string: "https://projects.propublica.org/api-docs/campaign-finance/candidates/")!)
                            .frame(width: 250, height: 35, alignment: .center)
                            //.foregroundColor()
                            .font(.system(size: 15))
                            .background(Color(K.appColors.background))
                            .cornerRadius(15)
                            .shadow(radius: 5)
                    
  
                }
                .frame(width: UIScreen.main.bounds.width-25, height: 110, alignment: .center)
                    .background(Color(K.appColors.background)).opacity(0.9)
                .cornerRadius(20)
                .shadow(radius: 2)
                    
                    

                    
                    

                }
                .frame(width: 400, height: 800, alignment: .top)
            }
        }
        .onAppear(perform: {
            detailsManager.getCandidateDetails(with: candidateURL)
            
        })
        .navigationBarTitle("Candidate Details")
        .navigationBarItems(trailing:
                                Button(action: {
                                    showCitationView = true
                                    
                                }){Image(systemName: "info.circle").imageScale(.large)
                                    .sheet(isPresented: $showCitationView) {
                                        CitationView()
                                    }})

    }
}

struct CandidateDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self,
                content: CandidateDetailsView(detailsManager: CandidateDetailsManager(),
                                              candidateURL: "").preferredColorScheme)
    }
    
}




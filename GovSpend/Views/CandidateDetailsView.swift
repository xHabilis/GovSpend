//
//  CandidateDetailsView.swift
//  GovSpend
//
//  Created by Isaac M on 7/9/21.
//

import SwiftUI
import SwiftUICharts

struct CandidateDetailsView: View {

    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \FecCandidate.savedAt, ascending: false)],
        animation: .default) var candidate: FetchedResults<FecCandidate>
    
    @StateObject var detailsManager: CandidateDetailsManager
    
    @State private var showCitationView: Bool = false
    @State private var bookmark = false
    @State private var isShowingSaveAlert = false
    @State private var showCommittee: Bool = false
    
    let candidateURL: String

    var body: some View {
        ZStack {
            Color(K.appColors.background)
                .edgesIgnoringSafeArea(.all)
            ScrollView (showsIndicators: false){
                    
                HStack {
                    VStack {
                        HStack (spacing: 8){
                            
                            if let details = detailsManager.candidateDetails.first {
           
                            VStack(spacing: 7) {
                                HStack (spacing: 7) {
                                    VStack (spacing: 7){
                                        
                                        VStack (spacing: 5){
                                            
                                            HStack {
                                            Text(details.display_name)
                                                .font(.system(size: 16).bold()).padding(.leading, 5.0)
                                                
                                                //Add to Context: Save
                                                Button(action: {
                                                    
                                                    addItem()
                                                    bookmark = true
                                                    isShowingSaveAlert.toggle()
                                                    
                                                    
                                                }, label: {
                                                    if bookmark {
                                                    Image(systemName: "bookmark.fill")
                                                    } else {
                                                    Image(systemName: "bookmark")
                                                    }

                                                }).alert(isPresented: $isShowingSaveAlert, content: {
                                                    Alert(title: Text("Saved"), message: Text("\(details.display_name) Saved"), dismissButton: .default(Text("OK")))
                                                })
                                                
                                                
                                            }
                                            
                                            Text(Configs.extendAbbreviation(StateName: "\(details.mailing_state)"))
                                                .font(.system(size: 12)).fontWeight(.semibold)
                                                                                 
                                            
                                        }
                                        .frame(width: 300, height: 30, alignment: .center)

                                        
                                        
                                        HStack {
                                            
                                            Text("Party:")
                                                .font(.system(size: 11))
                                                .frame(width: 100, height: 20, alignment: .trailing)
                                            Text(Configs.getLongName(for: details.party))
                                                .font(.system(size: 11))
                                                .frame(width: 100, height: 20, alignment: .leading)
                                        }
                                        .frame(width: 300, height: 10, alignment: .center)
                                        
                                        HStack {
                                            
                                            Text("Status:")
                                                .font(.system(size: 11))
                                                .frame(width: 100, height: 20, alignment: .trailing)
                                            Text(Configs.makeStatus(status: "\(details.status)"))
                                                .font(.system(size: 11))
                                                .frame(width: 100, height: 20, alignment: .leading)
                                        }
                                        .frame(width: 300, height: 10, alignment: .center)

                                        
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



    //MARK: - Committee Button
                        
                        if let path = detailsManager.candidateDetails.first {
                            Button("Committees") {
                                showCommittee.toggle()
                            }
                            .foregroundColor(Color.black)
                            .font(.system(size: 12))
                            .frame(width: UIScreen.main.bounds.width-300, height: 40, alignment: .center)
                            .background(Configs.chooseColor(for: path.party))
                            .cornerRadius(10)
                            .shadow(color: Color(K.appColors.cardShadow),radius: 1.5)
                            
                            .sheet(isPresented: $showCommittee) {
                                CommitteesView(committeeObject: CommitteeManager(), commiteePath: path.committee ?? "")
                            }
                            
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
                        .padding(.top)
                        .frame(width: 400, height: 400, alignment: .center)
                        .cornerRadius(8)
                        .shadow(radius: 2)
                        
                        VStack {
                            BarChartView(data: ChartData(values: detailsManager.barChartData), title: "Contributions", legend: "Source", style: Styles.barChartMidnightGreenDark, form: ChartForm.extraLarge, dropShadow: false, cornerImage: Image(systemName: "dollarsign.square"))
                        }
                        .padding(.vertical)
                        
                        VStack (spacing: 20){
                            if let copyInfo = detailsManager.candidateDetailsMetaData {
                                Text("\(copyInfo.copyright)")
                                    .font(.system(size: 12))
                            }
                            
                            
                            Link(destination: URL(string: "https://projects.propublica.org/api-docs/campaign-finance/candidates/")!, label: {
                                Text("ProPublica")
                                    .frame(width: 250, height: 35, alignment: .center)
                                    .font(.system(size: 15))
                                    .background(Color(K.appColors.background))
                                    .cornerRadius(15)
                                    .shadow(color: Color(K.appColors.cardShadow),radius: 3)
                            })
                        
      
                    }
                    .frame(width: UIScreen.main.bounds.width-25, height: 130, alignment: .center)

                    .cornerRadius(20)
                    .shadow(radius: 2)

                    }
                }
            }
            .onAppear(perform: {
                detailsManager.getCandidateDetails(with: candidateURL)
                
            })
            .navigationBarTitle("Financials")
            .navigationBarItems(trailing:
                                    Button(action: {
                                        showCitationView = true
                                        
                                    }){Image(systemName: "info.circle").imageScale(.large)
                                        .sheet(isPresented: $showCitationView) {
                                            CitationView()
                                    }})

        }
   


    }
    
    //CoreData - ADD
    func addItem() {
        
        withAnimation {
            let newCandidate = FecCandidate(context: viewContext)
            
            newCandidate.name = detailsManager.candidateDetails.first?.display_name
            newCandidate.candidateURL = candidateURL
            newCandidate.party = detailsManager.candidateDetails.first?.party
            newCandidate.savedAt = Date()

            do {
                try viewContext.save()

            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                
            }
        }
    }
}

struct CandidateDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self,
                content: CandidateDetailsView(detailsManager: CandidateDetailsManager(),
                                              candidateURL: "").environment(\.managedObjectContext, PersistenceController.preview.container.viewContext).preferredColorScheme)
    }
    
}




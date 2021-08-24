//
//  CommitteesView.swift
//  GovSpend
//
//  Created by Isaac M on 7/31/21.
//

import SwiftUI

struct CommitteesView: View {
    
    @StateObject var committeeObject: CommitteeManager
    @State private var showCitationView: Bool = false
    
    var commiteePath: String
    
    
    @ViewBuilder
    var body: some View {
        ScrollView {
            
            if committeeObject.committeeList.count == 0 {
                LoadingView()
            }
            
            ZStack {
                VStack {
                    
                    if let item = committeeObject.committeeList.first {
                        Spacer()
                        VStack {
                            VStack {
                                
                                VStack {
                                    
                                    VStack {
                                        
                                        Text(item.name!).font(.system(size: 14)).fontWeight(.semibold).multilineTextAlignment(.center)
                                        
                                        Text("\(Configs.getLongName(for: item.party ?? ""))").font(.system(size: 12))
                                        
                                        Text(item.display_type ?? "").font(.system(size: 12))
                                    }
                                    .frame(width: UIScreen.main.bounds.width-35, height: 60, alignment: .center)
                                    
                                    VStack {
                                        HStack {
                                            Text("Date From:").font(.system(size: 10))
                                                .frame(width: 190, height: 10, alignment: .trailing)
                                            Text(item.date_coverage_from!).font(.system(size: 10))
                                                .frame(width: 190, height: 10, alignment: .leading)
                                        }
                                        .frame(width: 300, height: 10, alignment: .center)
                                        
                                        HStack {
                                            Text("Date To:").font(.system(size: 10))
                                                .frame(width: 190, height: 10, alignment: .trailing)
                                            Text(item.date_coverage_to!).font(.system(size: 10))
                                                .frame(width: 190, height: 10, alignment: .leading)
                                        }
                                        .frame(width: 300, height: 20, alignment: .center)
                                        
                                        HStack {
                                            Text("Treasurer:").font(.system(size: 11)).fontWeight(.semibold)
                                                .frame(width: 190, height: 10, alignment: .trailing)
                                            Text(item.treasurer!).font(.system(size: 11)).fontWeight(.semibold)
                                                .frame(width: 190, height: 10, alignment: .leading)
                                        }
                                        .frame(width: 300, height: 10, alignment: .center)
                                        
                                    }
                                }
                                .frame(width: UIScreen.main.bounds.width-60, height: 120, alignment: .center)
                                .background(Color(K.appColors.background))
                                .cornerRadius(8)
                                .shadow(radius: 2)
                                
                                
                            }
                            .frame(width: UIScreen.main.bounds.width-35, height: 140, alignment: .center)
                            .background(Color(K.appColors.lightGray))
                            .cornerRadius(8)
                            .shadow(radius: 2)
                            
                            Spacer()
                            
                            VStack (spacing: 8){
                                ItemNameValue(itemName: "Total Receipts",
                                              itemValue: "\(Configs.convertToDollars(someDouble: Double(item.total_receipts!)))",
                                              itemValueColor: K.appColors.green)
                                
                                ItemNameValue(itemName: "Individual Totals",
                                              itemValue: "\(Configs.convertToDollars(someDouble: Double(item.total_from_individuals!)))",
                                              itemValueColor: K.appColors.green)
                                
                                ItemNameValue(itemName: "PAC Total",
                                              itemValue: "\(Configs.convertToDollars(someDouble: Double(item.total_from_pacs!)))",
                                              itemValueColor: K.appColors.green)
                                
                                ItemNameValue(itemName: "Total Contributions",
                                              itemValue: "\(Configs.convertToDollars(someDouble: Double(item.total_contributions!)))",
                                              itemValueColor: K.appColors.green)
                                
                                ItemNameValue(itemName: "Total Disbursements",
                                              itemValue: "\(Configs.convertToDollars(someDouble: Double(item.total_disbursements!)))",
                                              itemValueColor: K.appColors.green)
                                
                                ItemNameValue(itemName: "Begin Cash",
                                              itemValue: "\(Configs.convertToDollars(someDouble: Double(item.begin_cash!)))",
                                              itemValueColor: K.appColors.green)
                                
                                ItemNameValue(itemName: "End Cash",
                                              itemValue: "\(Configs.convertToDollars(someDouble: Double(item.end_cash!)))",
                                              itemValueColor: K.appColors.green)
                                
                                ItemNameValue(itemName: "Debts Owed",
                                              itemValue: "\(Configs.convertToDollars(someDouble: Double(item.debts_owed!)))",
                                              itemValueColor: K.appColors.green)
                                
                                ItemNameValue(itemName: "Transfers In",
                                              itemValue: "\(Configs.convertToDollars(someDouble: Double(item.transfers_in!)))",
                                              itemValueColor: K.appColors.green)
                                
                                ItemNameValue(itemName: "Total Candidate Contrib",
                                              itemValue: "\(Configs.convertToDollars(someDouble: Double(item.total_candidate_contributions!)))",
                                              itemValueColor: K.appColors.green)
                                
                                
                            }
                            .frame(width: UIScreen.main.bounds.width-35, height: 400, alignment: .center)
                            
                            
                            
                        }
                        .frame(width: UIScreen.main.bounds.width-35, alignment: .center)
                        .cornerRadius(8)
                        .shadow(radius: 5)
                        
                        Spacer()
                        VStack (spacing: 20){
                            
                            Text("\(committeeObject.committeeMetaData!.copyright!)")
                                .font(.system(size: 12))
                            
                            Link(destination: URL(string: "https://projects.propublica.org/api-docs/campaign-finance/candidates/")!, label: {
                                Text("ProPublica")
                                    .frame(width: 250, height: 35, alignment: .center)
                                    .font(.system(size: 15))
                                    .background(Color(K.appColors.background))
                                    .cornerRadius(15)
                                    .shadow(color: Color(K.appColors.cardShadow),radius: 3)
                            })
                            
                            
                        }
                        .frame(width: UIScreen.main.bounds.width-25, height: 110, alignment: .center)
                        .background(Color(K.appColors.background)).opacity(0.9)
                        .cornerRadius(20)
                        .shadow(radius: 2)
                        
                    }
                }
                .onAppear() {
                    committeeObject.getCommittees(with: commiteePath)
                }
                .navigationBarTitle("Committee Funds")
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
}

struct CommitteesView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self, content: CommitteesView(committeeObject: CommitteeManager(), commiteePath: "").preferredColorScheme)
        //.previewDevice(PreviewDevice(rawValue: "iPhone 8"))
    }
}

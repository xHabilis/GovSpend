//
//  SearchResultsView.swift
//  GovSpend
//
//  Created by Isaac M on 7/10/21.
//

import SwiftUI

struct FECSearchResultsView: View {
    
    @StateObject var candidateSearchManager: FECCandidateSearchManager
    @StateObject var candidateDetailsManager:CandidateDetailsManager
    
    @State private var showCitationView: Bool = false
    
    
    var searchName: String
    let theYear: String
    
    @ViewBuilder
    var body: some View {
        
        if candidateSearchManager.searchResults.count == 0 {
            LoadingView()
        }
        
//MARK: - Search Results as a List
        
        List (candidateSearchManager.searchResults) { candidate in
            
            NavigationLink(
                
                destination: CandidateDetailsView(detailsManager: candidateDetailsManager, candidateURL: candidate.candidate!.relative_uri),
                label: {
                    
                    HStack {
                        VStack {
                            
                            Text("\(candidate.candidate!.name)".capitalized)
                                .padding(.leading)
                                .frame(width: 280, height: 40, alignment: .leading)
                                .font(.system(size: 12))
                                .background(Configs.chooseColor(for: candidate.candidate!.party))
                                .cornerRadius(8)
                                .shadow(color: Color(K.appColors.cardShadow),radius: 3.5)
                        }
                        
                        VStack {
                            
                            Text(candidate.candidate!.party)
                                .frame(width: 50, height: 40, alignment: .center)
                                .font(.system(size: 11))
                                .background(Configs.chooseColor(for: candidate.candidate!.party))
                                .cornerRadius(8)
                                .shadow(color: Color(K.appColors.cardShadow),radius: 3.5)
                        }
                        
                    }
                    
                })
            
        }
        .navigationBarTitle("Search Results", displayMode: .inline)
        .navigationBarItems(trailing:
                                Button(action: {
                                    showCitationView = true
                                    
                                }){Image(systemName: "info.circle").imageScale(.large)
                                    .sheet(isPresented: $showCitationView) {
                                        CitationView()
                                    }})
        .onAppear() {
            candidateSearchManager.getCandidateSearchResults(for: searchName, in: theYear)
        }
        
    }
    
}



struct SearchResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self, content: FECSearchResultsView(candidateSearchManager: FECCandidateSearchManager(), candidateDetailsManager: CandidateDetailsManager(), searchName: "", theYear: "").preferredColorScheme)
    }
}




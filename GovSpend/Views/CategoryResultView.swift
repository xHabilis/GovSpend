//
//  CategoryResultsView.swift
//  GovSpend
//
//  Created by Isaac M on 7/18/21.
//

import SwiftUI

struct CategoryResultView: View {
    
    @StateObject var categoriesList: CategorySearchManager
    @StateObject var candidateDetailsManager: CandidateDetailsManager
    @State private var showCitationView: Bool = false
    
    var categoryUrl: String
    var title: String
    
    @ViewBuilder
    var body: some View {
        
        if categoriesList.theCategoryResults.count == 0 {
            LoadingView()
        }
        List(categoriesList.theCategoryResults) {person in
            
            
            NavigationLink(destination: CandidateDetailsView(detailsManager: candidateDetailsManager, candidateURL: person.relative_uri!)) {
                
                HStack (){
                    VStack {
                        
                        Text("\(person.name!)".capitalized)
                            .padding(.leading)
                            .frame(width: 280, height: 40, alignment: .leading)
                            .font(.system(size: 12))
                            .background(AppSettings.chooseColor(for: person.party!))
                            .cornerRadius(8)
                            .shadow(radius: 2)
                    }
                    VStack {
                        
                        Text(person.party!)
                            .frame(width: 50, height: 40, alignment: .center)
                            .font(.system(size: 11))
                            .background(AppSettings.chooseColor(for: person.party!))
                            .cornerRadius(8)
                            .shadow(radius: 2)
                    }
                    
                }
                
            }
            
            
        } .navigationBarTitle("\(title)", displayMode: .inline)
        .navigationBarItems(trailing:
                                Button(action: {
                                    showCitationView = true
                                    
                                }){Image(systemName: "info.circle").imageScale(.large)
                                    .sheet(isPresented: $showCitationView) {
                                        CitationView()
                                    }})
        .onAppear() {
            categoriesList.getCategoryData(with: categoryUrl)
        }
        
    }
    
}

struct CategoryResultView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryResultView(categoriesList: CategorySearchManager(), candidateDetailsManager: CandidateDetailsManager(),categoryUrl: "", title: "")
    }
}

//
//  HomeView.swift
//  GovSpend
//
//  Created by Isaac M on 9/6/21.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showCitationView: Bool = false
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                VStack {
                    Image("congressVectorOne").resizable().aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width-45, height: 250, alignment: .center)
                    
                    
                    VStack {
                        Text("The liberties of a people never were, nor ever will be, secure, when the transactions of their rulers may be concealed from them. \n -Patrick Henry")
                            .font(.system(size: 12))
                            .multilineTextAlignment(.center)
                    }
                    
                    
                    .navigationBarTitle("Gov$pend")
                    .navigationBarItems(trailing:
                                            Button(action: {
                                                showCitationView = true
                                                
                                            }){Image(systemName: "square.grid.2x2.fill").imageScale(.large)
                                                .sheet(isPresented: $showCitationView) {
                                                    CitationView()
                                                }})
                }
            }
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self, content: HomeView().preferredColorScheme)
        //.previewDevice(PreviewDevice(rawValue: "iPhone 8"))
    }
}

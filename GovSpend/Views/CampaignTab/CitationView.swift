//
//  CitationView.swift
//  GovSpend
//
//  Created by Isaac M on 7/24/21.
//

import SwiftUI

struct CitationView: View {
    var body: some View {
        
        ZStack {
            VStack (spacing: 35){
                Text("All data is provided by the sources below. Information is presented if available.")
                    .foregroundColor(.black)
                    .font(.system(size: 12)).fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .lineLimit(3)
                    .padding(.horizontal)

                
                VStack(spacing: 10) {
                    Text("Center for Responsive Politics")
                        .font(.system(size: 15)).fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    
                    
                    Link(destination: URL(string: "https://www.opensecrets.org/open-data/api")!, label: {
                        Text("OpenSecrets")
                            .font(.system(size: 13))
                            .frame(width: 300, height: 40, alignment: .center)
                            .background(Color(K.appColors.cardShadowReverse))
                            .cornerRadius(15)
                            .shadow(color: Color(K.appColors.cardShadow), radius: 3)
                    })
                        
                }
   
                VStack(spacing: 10) {
                    Text("ProPublica")
                        .foregroundColor(.black)
                        .font(.system(size: 15)).fontWeight(.semibold)
                    
                    
                    Link(destination: URL(string: "https://projects.propublica.org/api-docs/campaign-finance/")!, label: {
                        Text("Campaign Finance")
                            .font(.system(size: 13))
                            .frame(width: 300, height: 40, alignment: .center)
                            .background(Color(K.appColors.cardShadowReverse))
                            .cornerRadius(15)
                            .shadow(color: Color(K.appColors.cardShadow), radius: 3)
                    })
                    
                    
                    
                    
                    
                    Link(destination: URL(string: "https://www.propublica.org/datastore/api/propublica-congress-api")!, label: {
                        Text("Congress")
                            .font(.system(size: 13))
                            .frame(width: 300, height: 40, alignment: .center)
                            .background(Color(K.appColors.cardShadowReverse))
                            .cornerRadius(15)
                            .shadow(color: Color(K.appColors.cardShadow), radius: 3)
                    })
                    
                }
                
                VStack(spacing: 10) {
                    Text("Treasury")
                        .foregroundColor(.black)
                        .font(.system(size: 15)).fontWeight(.semibold)
                    
                    Link(destination: URL(string: "https://fiscaldata.treasury.gov/datasets/")!, label: {
                        Text("Fiscal Data")
                            .font(.system(size: 13))
                            .frame(width: 300, height: 40, alignment: .center)
                            .background(Color(K.appColors.cardShadowReverse))
                            .cornerRadius(15)
                            .shadow(color: Color(K.appColors.cardShadow), radius: 3)
                    })
                    
                }
                
            }
            .frame(width: UIScreen.main.bounds.width-25, height: 500, alignment: .center)
            .background(Color(K.appColors.green)).opacity(0.9)
            .cornerRadius(30)
            .shadow(radius: 5)
            
        }
        .edgesIgnoringSafeArea(.bottom)

        
    }
    
    
}



struct CitationView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self, content: CitationView().preferredColorScheme)
        //.previewDevice(PreviewDevice(rawValue: "iPhone 8"))
    }
}

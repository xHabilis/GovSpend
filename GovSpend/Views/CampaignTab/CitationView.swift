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
                    
                    
                    Link("OpenSecrets", destination: URL(string: "https://www.opensecrets.org/open-data/api")!)
                        .frame(width: 300, height: 40, alignment: .center)
                        .font(.system(size: 13))
                        .background(Color(K.appColors.cardShadowReverse))
                        .cornerRadius(15)
                        .shadow(color: Color(K.appColors.cardShadow), radius: 2)
                }

                
                VStack(spacing: 10) {
                    Text("ProPublica")
                        .foregroundColor(.black)
                        .font(.system(size: 15)).fontWeight(.semibold)
                    
                    
                    Link("Campaign Finance", destination: URL(string: "https://projects.propublica.org/api-docs/campaign-finance/")!)
                        .frame(width: 300, height: 40, alignment: .center)
                        //.foregroundColor()
                        .font(.system(size: 13))
                        .background(Color(K.appColors.cardShadowReverse))
                        .cornerRadius(15)
                        .shadow(color: Color(K.appColors.cardShadow), radius: 2)
                    
                    
                    
                    
                    
                    Link("Congress", destination: URL(string: "https://www.propublica.org/datastore/api/propublica-congress-api")!)
                        .frame(width: 300, height: 40, alignment: .center)
                        //.foregroundColor()
                        .font(.system(size: 13))
                        .background(Color(K.appColors.cardShadowReverse))
                        .cornerRadius(15)
                        .shadow(color: Color(K.appColors.cardShadow), radius: 2)
                    
                }
                
                VStack(spacing: 10) {
                    Text("Treasury")
                        .foregroundColor(.black)
                        .font(.system(size: 15)).fontWeight(.semibold)
                    
                    Link("Fiscal Data", destination: URL(string: "https://fiscaldata.treasury.gov/datasets/")!)
                        .frame(width: 300, height: 40, alignment: .center)
                        //.foregroundColor()
                        .font(.system(size: 13))
                        .background(Color(K.appColors.cardShadowReverse))
                        .cornerRadius(15)
                        .shadow(color: Color(K.appColors.cardShadow), radius: 2)
                    
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

//
//  AboutView.swift
//  GovSpend
//
//  Created by Isaac M on 9/8/21.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        
        NavigationView {
            
            ZStack {
                Color(K.appColors.background)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    
                    VStack (spacing: 10){

                    Text("Gov$pend is a free application created to allow for the reference of Campaign Finances by election cycle, current and past US Debt as well as on going IRS Revenue Collection")
                            .font(.system(size: 14)).foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        Text("Data is provided by the sources below and information is presented if available.")
                            .font(.system(size: 12)).fontWeight(.semibold).foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .padding()
                    
                    }

                    VStack (spacing: 25){

                        VStack(spacing: 10) {
                            Text("Center for Responsive Politics")
                                .font(.system(size: 15)).fontWeight(.semibold)

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
                        
                        let mail = "xhabilis@gmail.com"
                        Link(destination: URL(string: "mailto:\(mail)")!, label: {
                            VStack (spacing: 2){
                                Image(systemName: "envelope").imageScale(.large)
                                Text("Contact Developer").font(.system(size: 13)).foregroundColor(.black)
                                
                            }

                        })
                        
                    }
                    .frame(width: UIScreen.main.bounds.width-40, height: 450, alignment: .center)
                }
                .navigationBarTitle("About")
            }
        }
        
    }

    struct AboutView_Previews: PreviewProvider {
        static var previews: some View {
            ForEach(ColorScheme.allCases, id: \.self, content: AboutView().preferredColorScheme)
            //.previewDevice(PreviewDevice(rawValue: "iPhone 8"))
        }
    }

}

//
//  TopContribView.swift
//  GovSpend
//
//  Created by Isaac M on 7/16/21.
//

import SwiftUI

struct TopContribView: View {
    
    @StateObject var contribs: TopContribManager
    @State private var showCitationView: Bool = false
    
    var id: String
    
    @ViewBuilder
    var body: some View {
        
        if contribs.topContributors.count == 0 {
            ProgressView()
        }
        
        ZStack {
            Color(K.appColors.background)
                .edgesIgnoringSafeArea(.bottom)
            
            VStack {
                
                List (contribs.topContributors) {contributor in
                    
                    if #available(iOS 15, *) {
                        // iOS 15 View
                    
                    HStack (spacing: 20) {
                        
                        VStack {
                            Text(contributor.attributes!.org_name)
                                .font(.system(size: 12)).fontWeight(.semibold).multilineTextAlignment(.leading).lineLimit(3)
                            
                        }
                        .frame(width: 180, height: 50, alignment: .leading)
                        
                        
                        VStack (spacing: 5) {
                            HStack {
                                Text("Total:")
                                    .frame(width: 60, height: 10, alignment: .trailing)
                                
                                Text("\(AppSettings.convertToDollars(someDouble: Double(contributor.attributes!.total)!))")
                                    .frame(width: 60, height: 10, alignment: .leading)
                                
                            }
                            .font(.system(size: 10))
                            
                            HStack {
                                Text("From Pacs:")
                                    .frame(width: 60, height: 10, alignment: .trailing)
                                
                                Text("\(AppSettings.convertToDollars(someDouble: Double(contributor.attributes!.pacs)!))")
                                    .frame(width: 60, height: 10, alignment: .leading)
                                
                            }
                            .font(.system(size: 10))
                            
                            HStack {
                                Text("Individuals:")
                                    .frame(width: 60, height: 10, alignment: .trailing)
                                
                                Text("\(AppSettings.convertToDollars(someDouble: Double(contributor.attributes!.indivs)!))")
                                    .frame(width: 60, height: 10, alignment: .leading)
                                
                            }
                            .font(.system(size: 10))
                            
                        }
                    }

                    
                } else {
                    //iOS 14 View
                    HStack (spacing: 20) {
                        
                        VStack {
                            Text(contributor.attributes!.org_name)
                                .font(.system(size: 12)).fontWeight(.semibold).multilineTextAlignment(.leading).lineLimit(3)
                            
                        }
                        .frame(width: 180, height: 50, alignment: .leading)
                        
                        
                        VStack (spacing: 5) {
                            HStack {
                                Text("Total:")
                                    .frame(width: 60, height: 10, alignment: .trailing)
                                
                                Text("\(AppSettings.convertToDollars(someDouble: Double(contributor.attributes!.total)!))")
                                    .frame(width: 60, height: 10, alignment: .leading)
                                
                            }
                            .font(.system(size: 10))
                            
                            HStack {
                                Text("From Pacs:")
                                    .frame(width: 60, height: 10, alignment: .trailing)
                                
                                Text("\(AppSettings.convertToDollars(someDouble: Double(contributor.attributes!.pacs)!))")
                                    .frame(width: 60, height: 10, alignment: .leading)
                                
                            }
                            .font(.system(size: 10))
                            
                            HStack {
                                Text("Individuals:")
                                    .frame(width: 60, height: 10, alignment: .trailing)
                                
                                Text("\(AppSettings.convertToDollars(someDouble: Double(contributor.attributes!.indivs)!))")
                                    .frame(width: 60, height: 10, alignment: .leading)
                                
                            }
                            .font(.system(size: 10))
                            
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width-35, height: 60, alignment: .center)
                    .background(Color(K.appColors.background))
                    .cornerRadius(8)
                    .shadow(color: Color(K.appColors.cardShadow),radius: 3)
                    
                }
                    
                }

                Spacer()
                if let topContItem = contribs.topContribPerson?.attributes {
                    VStack (spacing: 15){
                        Text("Center for Responsive Politics")
                            .font(.system(size: 15)).fontWeight(.semibold)
                        
                        
                        Link(destination: URL(string: "\(topContItem.source)")!, label: {
                            Text("Source")
                                .frame(width: 300, height: 35, alignment: .center)
                                .font(.system(size: 15))
                                .background(Color(K.appColors.background))
                                .cornerRadius(15)
                                .shadow(color: Color(K.appColors.cardShadow),radius: 3)
                        })
                        
                        Text(" Notice: The organizations themselves did not donate, rather the money came from the organization's PAC, its individual members or employees or owners, and those individuals' immediate families.")
                            .font(.system(size: 11)).fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                        
                    }
                    .frame(width: UIScreen.main.bounds.width-25, height: 150, alignment: .center)
                    .background(Color(K.appColors.green)).opacity(0.9)
                    .cornerRadius(20)
                    .shadow(radius: 5)
                }
                
            }
            .onAppear() {
                contribs.getTopContributors(for: id, in: "")
            }
            .navigationBarTitle("Top Contributors")
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


struct TopContribView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self, content: TopContribView(contribs: TopContribManager(), id: "").preferredColorScheme)
        //.previewDevice(PreviewDevice(rawValue: "iPhone 8"))
    }
}



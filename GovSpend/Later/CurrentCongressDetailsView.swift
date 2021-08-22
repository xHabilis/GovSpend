//
//  ContentView.swift
//  GovSpend
//
//  Created by Isaac M on 7/5/21.
//

import SwiftUI

struct CurrentCongressDetailsView: View {
    
    var idName: String
    
    var body: some View {
        ZStack {
            Color("myGreen")
                .edgesIgnoringSafeArea(.all)
            ZStack {
                Color("myBackground")
                VStack {
                    Spacer()
                    HStack {
                        HStack(spacing: 5) {
                            VStack {
                                Image("theron")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 112, height: 108, alignment: .center)
                                    .clipShape(Rectangle())
                                    .shadow(radius: 5)
                            }
                            VStack(alignment: .leading, spacing: 2) {
                                Text("Senator")
                                    .fontWeight(.semibold)
                                    .font(.system(size: 12))
                                    .frame(width: 130, height: 25, alignment: .leading)
                                Text("Bernard, Sanders")
                                    .fontWeight(.bold)
                                    .font(.system(size: 13))
                                    .padding(.bottom)
                                    .frame(width: 130, height: 25, alignment: .leading)
                               
                                HStack {
                                    Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                                        Image("phone")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 13, height: 18, alignment: .center)
                                        Text("6264562230")
                                            .font(.system(size: 10))
                                            .foregroundColor(Color("contact"))
                                            .frame(width: 85, height: 20, alignment: .leading)
                                        
                                    }
                                }
                                
                                HStack {
                                    Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                                        Image("facebook")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 13, height: 18, alignment: .center)
                                        Text("facebook")
                                            .font(.system(size: 10))
                                            .foregroundColor(Color("contact"))
                                            .frame(width: 85, height: 20, alignment: .leading)
                                    }
                                }

                                HStack {
                                    Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                                        Image("twitter")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 13, height: 18, alignment: .center)
                                        Text("twitter")
                                            .font(.system(size: 10))
                                            .foregroundColor(Color("contact"))
                                            .frame(width: 85, height: 20, alignment: .leading)
                                    }
                                }
                                
                                
                            }
                            .frame(width: 150, height: 130, alignment: .center)
                            
                            
                            VStack(alignment: .leading, spacing: 25) {
                                PoliticalPartyView(state: "Democrat", color: "myBlue")
                                
                                Text("Vermont")
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 10.5))
                                    .frame(width: 70, height: 25, alignment: .center)
                                    .background(Color(.lightGray))
                                    .cornerRadius(6)
                                    .shadow(radius: 1)
                                
                            }
                            .frame(width: 75, height: 130, alignment: .center)
                        }
                        .frame(width: 371, height: 151, alignment: .center)
                        .background(Color("myGray"))
                        .cornerRadius(8)
                        .shadow(radius: 2)
                    }
                    .frame(width: 365, height: 200, alignment: .bottom)
                    Spacer()
                    
                    
                    HStack(spacing: 120.0)  {
                        
                        VStack (alignment: .leading ,spacing: 11){
                            CandidateItemView(titleText: "Next Election Date",
                                              labeltext: "01/03/2020",
                                              labelColor: "myYellow",
                                              viewColor: "myGray")
                            CandidateItemView(titleText: "No. Bills Sponsored",
                                              labeltext: "143",
                                              labelColor: "myYellow",
                                              viewColor: "myGray")
                            CandidateItemView(titleText: "No. Bills Cosponsored",
                                              labeltext: "143",
                                              labelColor: "myYellow",
                                              viewColor: "myGray")
                            CandidateItemView(titleText: "Votes with Party",
                                              labeltext: "98%",
                                              labelColor: "myYellow",
                                              viewColor: "myGray")
                            CandidateItemView(titleText: "Votes against Party",
                                              labeltext: "2%",
                                              labelColor: "myYellow",
                                              viewColor: "myGray")
                        }

                        
                    }
                    .frame(width: 390, height: 300, alignment: .bottom)


                    Spacer()
                    
                    VStack {
                        VStack (spacing: 20) {
                            MoneyCategoryView(text: "Personal Finance", color: "myRed")
                            MoneyCategoryView(text: "Fund Raising", color: "myBlue")
                            MoneyCategoryView(text: "Top Contributors", color: "myGreen")
                            MoneyCategoryView(text: "Totals by Sector", color: "myYellow")
                        }
                        .frame(width: 400, height: 350, alignment: .center)
                        
                    }
                    .padding(.bottom)
                    .frame(width: 390, height: 300, alignment: .center)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    
                    
                    
                    
                    
                }
                
            }
        }
    }
}


struct OpenSecretCandidateDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self, content: CurrentCongressDetailsView(idName: "").preferredColorScheme)
    }
}

//MARK: - Political Party

struct PoliticalPartyView: View {
    
    let state: String
    let color: String
    
    var body: some View {
        Text(state)
            .fontWeight(.regular)
            .foregroundColor(Color.black)
            .font(.system(size: 10.5))
            .frame(width: 70, height: 25, alignment: .center)
            .background(Color(color))
            .cornerRadius(6)
            .shadow(radius: 1)
    }
}

//MARK: - Money Categories

struct MoneyCategoryView: View {
    
    let text: String
    let color: String
   
    var body: some View {
        Button(action: {
            print(text)
        }) {
            Text(text)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(Color.black)
                .frame(width: 200, height: 35, alignment: .center)
                .padding(5)
                .background(Color(color))
                .cornerRadius(8)
                .shadow(radius: 4)
        }
    }
}

//MARK: - Candidate Items

struct CandidateItemView: View {
    
    let titleText: String
    let labeltext: String
    let labelColor: String
    let viewColor: String
    
    var body: some View {
        HStack(alignment: .center ,spacing: 90){
            Text(titleText)
                .font(.system(size: 12))
                .frame(width: 150, height: 30, alignment: .leading)
            Text(labeltext)
                .font(.system(size: 12))
                .foregroundColor(.black)
                .frame(width: 107, height: 28, alignment: .center)
                .background(Color(labelColor))
                .cornerRadius(8)
            
            
        }
        .frame(width: 365, height: 40, alignment: .center)
        .background(Color(viewColor))
        .cornerRadius(8)
        .shadow(radius: 2)
    }
}

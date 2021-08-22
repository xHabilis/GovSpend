//
//  PersonalFinanceView.swift
//  GovSpend
//
//  Created by Isaac M on 7/7/21.
//

import SwiftUI

struct FinancesView: View {
    
    @StateObject var theFinancials: FinancesManager
    @State private var showCitationView: Bool = false
    @State private var showFundRaising = false
    
    var firstName: String
    var lastName: String
    var bioID: String
    var cID: String
    var title: String
    var party: String
    var state: String
    var status: String
    var nextElection: String
    var facebook: String
    var twitter: String
    var youtube: String
    var contact: String
    var phone: String
    var website: String
    
    var body: some View {
        ZStack {
            ZStack {
                VStack {
                    
//MARK: - Candidate Card
                    
                    HStack (spacing: 8) {
                        VStack {
                            
                            let fullImageURL = "\(K.apiURLs.imageURL)\(bioID)\(K.apiURLs.imageURLjpg)"
                            //let fullImageURL = "https://i.imgur.com/L4tLYAz.jpeg"
                            RemoteImage(url: fullImageURL)
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 140, alignment: .center)
                                .clipShape(Rectangle())
                                .shadow(radius: 5)
                                .cornerRadius(8)
                        }
                        
                        VStack(spacing: 7) {
                            HStack (spacing: 7) {
                                VStack {
                                    HStack {
                                        
                                        Text("\(title) \(firstName) \(lastName)")
                                            .font(.system(size: 14)).fontWeight(.semibold)
                                        
                                    }
                                    .frame(width: 280, height: 20, alignment: .center)
                                    //.background(Color(K.appColors.green))
                                    
                                    HStack {
                                        VStack {
                                            
                                            Text("Next Election:")
                                                .font(.system(size: 11))
                                        }
                                        .frame(width: 100, height: 20, alignment: .trailing)
                                        //.background(Color(.white))
                                        
                                        VStack {
                                            Text(nextElection)
                                                .font(.system(size: 11))
                                        }
                                        .frame(width: 100, height: 20, alignment: .leading)
                                        //.background(Color(.white))
                                        
                                    }
                                    .frame(width: 280, height: 20, alignment: .center)
                                    //.background(Color(K.appColors.green))
                                    
                                    
                                    
                                    HStack {
                                        VStack {
                                            Text("Status:")
                                                .font(.system(size: 11))
                                        }
                                        .frame(width: 100, height: 20, alignment: .trailing)
                                        // .background(Color(.white))
                                        //
                                        VStack {
                                            Text(status)
                                                .font(.system(size: 11))
                                        }
                                        .frame(width: 100, height: 20, alignment: .leading)
                                        // .background(Color(.white))
                                        
                                    }
                                    .frame(width: 280, height: 20, alignment: .center)
                                    //.background(Color(K.appColors.green))
                                    
                                    HStack {
                                        VStack {
                                            Text("Party:")
                                                .font(.system(size: 12))
                                        }
                                        .frame(width: 100, height: 20, alignment: .trailing)
                                        //.background(Color(.white))
                                        
                                        VStack {
                                            Text("\(Configs.getLongName(for: party))")
                                                .font(.system(size: 11))
                                        }
                                        .frame(width: 100, height: 20, alignment: .leading)
                                        //.background(Color(.white))
                                        
                                    }
                                    .frame(width: 280, height: 20, alignment: .center)
                                    //.background(Color(K.appColors.green))
                                }
                                
                            }
                            
                            .frame(width: UIScreen.main.bounds.width-140, height: 90, alignment: .leading)
                            
                            .background(Color(K.appColors.background))
                            .shadow(radius: 1)
                            .cornerRadius(8)
                            
                            
                            HStack (spacing: 30) {
                                
                                Link(destination: URL(string: "tel://\(phone)")!, label: {
                                    Image("phone").resizable().frame(width: 20, height: 20, alignment: .center)
                                })
                                Link(destination: URL(string: "https://twitter.com/\(twitter)")!, label: {
                                    Image("twitter").resizable().frame(width: 20, height: 20, alignment: .center)
                                })
                                Link(destination: URL(string: "https://www.facebook.com/\(facebook)")!, label: {
                                    Image("facebook").resizable().frame(width: 20, height: 20, alignment: .center)
                                })
                                Link(destination: URL(string: "https://www.youtube.com/\(youtube)")!, label: {
                                    Image("youtube").resizable().frame(width: 20, height: 20, alignment: .center)
                                })
                                Link(destination: URL(string: "\(website)") ?? URL(string: "https://www.google.com/")!, label: {
                                    Image("website").resizable().frame(width: 20, height: 20, alignment: .center)
                                })
                                
                                
                            }
                            .frame(width: UIScreen.main.bounds.width-140, height: 30, alignment: .center)
                            //.background(Color(K.appColors.green))
                            .background(Configs.chooseColor(for: party))
                            .cornerRadius(8)
                            
                            
                        }
                        .frame(width: UIScreen.main.bounds.width-125, height: 145, alignment: .center)
                        .background(Color(K.appColors.gray))
                        .shadow(radius: 5)
                        .cornerRadius(8)
                        
                        
                        
                        
                        
                        
                    }
                    .frame(width: UIScreen.main.bounds.width-15, height: 160, alignment: .center)
                    //.background(Color(K.appColors.lightGray))
                    
                    HStack{
                        //MARK: - Button: Top Contributors
                        
                        //Top Contributors Button
                        if let idInPF = theFinancials.pfProfile?.attributes {
                            NavigationLink(
                                destination: TopContribView(contribs: TopContribManager(), id: idInPF.member_id),
                                label: {
                                    Text("Top Contributors")
                                        .multilineTextAlignment(.center)
                                    
                                })
                                .foregroundColor(Color.black)
                                .font(.system(size: 12))
                                .frame(width: UIScreen.main.bounds.width-300, height: 40, alignment: .center)
                                .background(Color(K.appColors.green))
                                .cornerRadius(10)
                                //.shadow(color: .black, radius: 3)
                                .shadow(color: Color(K.appColors.cardShadow), radius: 2)
                        }
                        
//MARK: - Button: Sector Totals
                        
                        //Sector Totals Button
                        if let idInPF = theFinancials.pfProfile?.attributes {
                            NavigationLink(
                                destination: SectorTotalsView(sector: SectorTotalsManager(), id: idInPF.member_id),
                                label: {
                                    
                                    Text("Sector Totals")
                                        .padding(.horizontal)
                                    
                                    
                                })
                                .foregroundColor(Color.black)
                                .font(.system(size: 12))
                                .frame(width: UIScreen.main.bounds.width-300, height: 40, alignment: .center)
                                .background(Color(K.appColors.green))
                                .cornerRadius(10)
                                //.shadow(color: .black, radius: 3)
                                .shadow(color: Color(K.appColors.cardShadow), radius: 2)
                            
                        }
                        
//MARK: - Button: Fund Raising
                        
                        if let idInPF = theFinancials.pfProfile?.attributes {
                            Button("Fund Raising") {
                                showFundRaising.toggle()
                            }
                            .foregroundColor(Color.black)
                            .font(.system(size: 12))
                            .frame(width: UIScreen.main.bounds.width-300, height: 40, alignment: .center)
                            .background(Color(K.appColors.green))
                            .cornerRadius(10)
                            //.shadow(color: .black, radius: 3)
                            .shadow(color: Color(K.appColors.cardShadow), radius: 2)
                            
                            .sheet(isPresented: $showFundRaising) {
                                FundRaisingView(funds: FundRaisingManager(), id: idInPF.member_id)
                            }
                            
                        }
                        
                        
                    }
                    .frame(width: UIScreen.main.bounds.width-10, height: 50, alignment: .center)
                    
                    
                    Spacer()
                    
                    //MARK: - Conditional List: Reported Assets
                    
                    //Reported Assets Table
                    Text("Reported Assets")
                        .font(.system(size: 12)).fontWeight(.bold)
                        .frame(width: UIScreen.main.bounds.width-25, height: 15, alignment: .center)
                        //.background(Color(K.appColors.background))
                        //.cornerRadius(10)
                    

                        List(theFinancials.pfAssets) { asset in
                            //List(person) { asset in
                            
                            VStack (){
                                HStack {
                                    
                                    VStack (spacing: 4){
                                        Text(asset.attributes!.name)
                                            //Text(asset.name!)
                                            .font(.system(size: 12)).fontWeight(.semibold)
                                            .multilineTextAlignment(.leading).lineLimit(3)
                                    }
                                    .frame(width: 180, height: 35, alignment: .leading)
                                    VStack (spacing: 3.5){
                                        Text(asset.attributes!.sector)
                                            //Text(asset.sector!)
                                            .font(.system(size: 9))
                                        //.padding(.bottom, 2.0)
                                        
                                        Text("High: \(Configs.convertToDollars(someDouble: Double(asset.attributes!.holdings_high)!))")
                                            //Text(asset.holdings_high!)
                                            .font(.system(size: 7.5)).fontWeight(.semibold)
                                        //.padding(.bottom, -3.0)
                                        
                                        Text("Low: \(Configs.convertToDollars(someDouble: Double(asset.attributes!.holdings_low)!))")
                                            //Text(asset.holdings_low!)
                                            .font(.system(size: 7.5)).fontWeight(.semibold)
                                    }
                                    .frame(width: 150, height: 45, alignment: .center)
                                    
                                    
                                }
                            }
                            .frame(width: UIScreen.main.bounds.width-35, height: 55, alignment: .center)
                            .background(Color(K.appColors.background))
                            .cornerRadius(8)
                            .shadow(radius: 5)
                            
                        }

                    
                    
                    
                    
                    //MARK: - Conditional List: Positions
                    
                    //Positions Table
                    Text("Positions")
                        .font(.system(size: 12)).fontWeight(.bold)
                        .frame(width: UIScreen.main.bounds.width-25, height: 15, alignment: .center)
                        //.background(Color(K.appColors.background))
                        //.cornerRadius(10)
                    

                        List(theFinancials.pfPositions) { position in
                            //List(otherPerson) { position in
                            
                            VStack {
                                VStack(spacing: 5) {
                                    
                                    Text(position.attributes!.title)
                                        //Text(position.title!)
                                        .frame(width: UIScreen.main.bounds.width-25, height: 15, alignment: .center)
                                        .font(.system(size: 12))
                                    
                                    Text(position.attributes!.organization)
                                        //Text(position.organization!)
                                        .frame(width: UIScreen.main.bounds.width-25, height: 10, alignment: .center)
                                        .font(.system(size: 9))
                                }
                            }
                            .frame(width: UIScreen.main.bounds.width-35, height: 55, alignment: .center)
                            .background(Color(K.appColors.background))
                            .cornerRadius(8)
                            .shadow(radius: 5)
                        }

                    
                    
                }
                .animation(.easeIn)
                .navigationBarTitle("Finances", displayMode: .inline)
                .navigationBarItems(trailing:
                                        Button(action: {
                                            showCitationView = true
                                            
                                        }){Image(systemName: "info.circle").imageScale(.large)
                                            .sheet(isPresented: $showCitationView) {
                                                CitationView()
                                            }})
                .onAppear() {
                    theFinancials.getPersonalFinances(for: cID)

                }
                
            }
        }//
        
    }
    
}

struct PersonalFinanceView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self, content: FinancesView(theFinancials: FinancesManager(), firstName: "",
                                                                               lastName: "",
                                                                               bioID: "",
                                                                               cID: "",
                                                                               title: "",
                                                                               party: "",
                                                                               state: "",
                                                                               status: "",
                                                                               nextElection: "",
                                                                               facebook: "",
                                                                               twitter: "",
                                                                               youtube: "",
                                                                               contact: "",
                                                                               phone: "", website: ""
        ).preferredColorScheme)
        //.previewDevice(PreviewDevice(rawValue: "iPhone 8"))
    }
}

//
//let person = [
//
//    DummyPFList(id: "12345",
//                name: "Some Cool Company with a really long name to test",
//                holdings_low: "$200,000",
//                holdings_high: "$234,567,889",
//                sector: "Real Estate and Other Stuff Also"),
//    DummyPFList(id: "12345",
//                name: "Some Cool Company",
//                holdings_low: "$200,000",
//                holdings_high: "$234,567,889",
//                sector: "Real Estate and Other Stuff Also"),
//    DummyPFList(id: "12345",
//                name: "Some Cool Company",
//                holdings_low: "$200,000",
//                holdings_high: "$234,567,889",
//                sector: "Real Estate and Other Stuff Also"),
//    DummyPFList(id: "12345",
//                name: "Some Cool Company",
//                holdings_low: "$200,000",
//                holdings_high: "$234,567,889",
//                sector: "Real Estate and Other Stuff Also"),
//    DummyPFList(id: "12345",
//                name: "Some Cool Company",
//                holdings_low: "$200,000",
//                holdings_high: "$234,567,889",
//                sector: "Real Estate and Other Stuff Also"),
//    DummyPFList(id: "12345",
//                name: "Some Cool Company",
//                holdings_low: "$200,000",
//                holdings_high: "$234,567,889",
//                sector: "Real Estate and Other Stuff Also"),
//]
//
//let otherPerson = [
//
//    DummyPFListPositions(id: "123456",
//                         title: "CHairman Board of Directors of Clowns",
//                         organization: "Some Fancey place"),
//    DummyPFListPositions(id: "123456",
//                         title: "CHairman Board of Directors of Clowns",
//                         organization: "Some Fancey place"),
//    DummyPFListPositions(id: "123456",
//                         title: "CHairman Board of Directors of Clowns",
//                         organization: "Some Fancey place"),
//    DummyPFListPositions(id: "123456",
//                         title: "CHairman Board of Directors of Clowns",
//                         organization: "Some Fancey place"),
//]

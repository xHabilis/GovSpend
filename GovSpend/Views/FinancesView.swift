//
//  PersonalFinanceView.swift
//  GovSpend
//
//  Created by Isaac M on 7/7/21.
//

import SwiftUI


struct FinancesView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \CongressPerson.savedAt, ascending: false)],
        animation: .default) var congressPerson: FetchedResults<CongressPerson>

    @StateObject var theFinancials: FinancesManager
    @State private var showCitationView: Bool = false
    @State private var showFundRaising: Bool = false
    @State private var showTable: Bool = false
    @State private var bookmark = false
    @State private var isShowingSaveAlert = false
    
    var firstName, lastName, bioID, cID, title, party, state, status, nextElection, facebook, twitter, youtube, contact, phone, website: String
    
    @ViewBuilder
    var body: some View {

            ZStack {
                VStack {
                    
//MARK: - Candidate Card
                    
                    HStack (spacing: 8) {
                        VStack {
                            
                            let fullImageURL = "\(K.apiURLs.imageURL)\(bioID)\(K.apiURLs.imageURLjpg)"
                            RemoteImage(url: fullImageURL)
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 140, alignment: .center)
                                .clipShape(Rectangle())
                                .shadow(radius: 5)
                                .cornerRadius(8)
                        }
                        
                        VStack(spacing: 7) {
                            HStack (spacing: 7) {
                                VStack (spacing: 5){
                                    HStack {
                                        
                                        Text("\(title) \(firstName) \(lastName)")
                                            .font(.system(size: 16)).fontWeight(.semibold).padding(.leading, 5.0)
                                        
                                        
                                        
                                        //Add to Context: Save
                                        Button(action: {
                                            
                                            bookmark = true
                                            addItem()
                                            
                                            isShowingSaveAlert.toggle()
                                            
                                        }, label: {
                                            if bookmark {
                                            Image(systemName: "bookmark.fill")
                                            } else {
                                            Image(systemName: "bookmark")
                                            }

                                        }).alert(isPresented: $isShowingSaveAlert, content: {
                                            Alert(title: Text("Saved"), message: Text("\(title) \(firstName) \(lastName) Saved"), dismissButton: .default(Text("OK")))
                                        })
                                        
                                        
                                        

                                    }
                                    .frame(width: 280, height: 20, alignment: .center)
                                    
                                    HStack {
                                        VStack {
                                            
                                            Text("Next Election:")
                                                .font(.system(size: 11))
                                        }
                                        .frame(width: 100, height: 10, alignment: .trailing)
                                        
                                        VStack {
                                            Text(nextElection)
                                                .font(.system(size: 11))
                                        }
                                        .frame(width: 100, height: 10, alignment: .leading)
                                        
                                    }
                                    //.frame(width: 280, height: 20, alignment: .center)

                                    
                                    HStack {
                                        VStack {
                                            Text("Status:")
                                                .font(.system(size: 11))
                                        }
                                        .frame(width: 100, height: 10, alignment: .trailing)

                                        VStack {
                                            Text(status)
                                                .font(.system(size: 11))
                                        }
                                        .frame(width: 100, height: 10, alignment: .leading)
                                        
                                    }
                                   // .frame(width: 280, height: 20, alignment: .center)
                                    
                                    HStack {
                                        VStack {
                                            Text("Party:")
                                                .font(.system(size: 12))
                                        }
                                        .frame(width: 100, height: 10, alignment: .trailing)
                                        
                                        VStack {
                                            Text("\(AppSettings.getLongName(for: party))")
                                                .font(.system(size: 11))
                                        }
                                        .frame(width: 100, height: 10, alignment: .leading)
                                        
                                    }
                                    //.frame(width: 280, height: 20, alignment: .center)
    
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
                            .background(AppSettings.chooseColor(for: party))
                            .cornerRadius(8)
                            
                            
                        }
                        .frame(width: UIScreen.main.bounds.width-125, height: 145, alignment: .center)
                        .background(Color(K.appColors.gray))
                        .shadow(radius: 5)
                        .cornerRadius(8)

                        
                    }
                    .frame(width: UIScreen.main.bounds.width-15, height: 160, alignment: .center)
                    
                    HStack{
//MARK: - Button: Top Contributors
                        
                        if let idInPF = theFinancials.pfProfile?.attributes {
                            NavigationLink(
                                destination: TopContribView(contribs: TopContribManager(), id: idInPF.member_id),
                                label: {
                                    Text("Top Contributors")
                                    
                                })
                                .foregroundColor(Color(K.appColors.cardShadow))
                                .font(.system(size: 12))
                                .frame(width: 115, height: 40, alignment: .center)
                                .background(AppSettings.chooseColor(for: party))
                                .cornerRadius(10)
                                .shadow(color: Color(K.appColors.cardShadow),radius: 1.5)
                        }
                        
//MARK: - Button: Sector Totals
                        
                        //Sector Totals Button
                        if let idInPF = theFinancials.pfProfile?.attributes {
                            NavigationLink(
                                destination: SectorTotalsView(sector: SectorTotalsManager(), id: idInPF.member_id),
                                label: {
                                    Text("Sector Totals")
   
                                })
                                .foregroundColor(Color(K.appColors.cardShadow))
                                .font(.system(size: 12))
                                .frame(width: 115, height: 40, alignment: .center)
                                .background(AppSettings.chooseColor(for: party))
                                .cornerRadius(10)
                                .shadow(color: Color(K.appColors.cardShadow),radius: 1.5)
                            
                        }
                        
//MARK: - Button: Fund Raising
                        
                        if let idInPF = theFinancials.pfProfile?.attributes {
                            Button("Fund Raising") {
                                showFundRaising.toggle()
                            }
                            .foregroundColor(Color(K.appColors.cardShadow))
                            .font(.system(size: 12))
                            .frame(width: 115, height: 40, alignment: .center)
                            .background(AppSettings.chooseColor(for: party))
                            .cornerRadius(10)
                            .shadow(color: Color(K.appColors.cardShadow),radius: 1.5)
                            .sheet(isPresented: $showFundRaising) {
                                FundRaisingView(funds: FundRaisingManager(), id: idInPF.member_id)
                            }
                            
                        }
                        
                        
                    }
                    .frame(width: UIScreen.main.bounds.width-10, height: 50, alignment: .center)
                    
                    
                    Spacer()
                    
                    
                   
                    
                    
//MARK: - Reported Assets
                    
                    if let item = theFinancials.pfProfile?.assets {
                    Text("Reported Assets")
                        .font(.system(size: 12)).fontWeight(.bold)
                        .frame(width: UIScreen.main.bounds.width-25, height: 15, alignment: .center)

                        if #available(iOS 15, *) {
                            
                   // iOS 15 View
                        List(item.asset) { asset in
                            VStack (){
                                HStack {

                                    VStack (spacing: 4){
                                        Text(asset.attributes!.name)
                                            .font(.system(size: 12)).fontWeight(.semibold)
                                            .multilineTextAlignment(.leading).lineLimit(3)
                                            .padding(.leading, 4.0)
                                    }
                                    .frame(width: 180, height: 35, alignment: .leading)
                                    VStack (spacing: 3.5){
                                        Text(asset.attributes!.sector)
                                            .font(.system(size: 9))

                                        Text("High: \(AppSettings.convertToDollars(someDouble: Double(asset.attributes!.holdings_high)!))")
                                            .font(.system(size: 7.5)).fontWeight(.semibold)


                                        Text("Low: \(AppSettings.convertToDollars(someDouble: Double(asset.attributes!.holdings_low)!))")
                                            .font(.system(size: 7.5)).fontWeight(.semibold)
                                    }
                                    .frame(width: 150, height: 45, alignment: .center)



                            }
                            .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: 60)
                            //.background(Color(K.appColors.background))
                            //.cornerRadius(8)
                            //.shadow(color: Color(K.appColors.cardShadow),radius: 3)

                            }
                    }
                        
                        
                        } else {
                            
                           // iOS 14 View
                            List(item.asset) { asset in
                                VStack (){
                                    HStack {

                                        VStack (spacing: 4){
                                            Text(asset.attributes!.name)
                                                .font(.system(size: 12)).fontWeight(.semibold)
                                                .multilineTextAlignment(.leading).lineLimit(3)
                                                .padding(.leading, 4.0)
                                        }
                                        .frame(width: 180, height: 35, alignment: .leading)
                                        VStack (spacing: 3.5){
                                            Text(asset.attributes!.sector)
                                                .font(.system(size: 9))

                                            Text("High: \(AppSettings.convertToDollars(someDouble: Double(asset.attributes!.holdings_high)!))")
                                                .font(.system(size: 7.5)).fontWeight(.semibold)


                                            Text("Low: \(AppSettings.convertToDollars(someDouble: Double(asset.attributes!.holdings_low)!))")
                                                .font(.system(size: 7.5)).fontWeight(.semibold)
                                        }
                                        .frame(width: 150, height: 45, alignment: .center)



                                }
                                .frame(width: UIScreen.main.bounds.width-35, height: 55, alignment: .center)
                                .background(Color(K.appColors.background))
                                .cornerRadius(8)
                                .shadow(color: Color(K.appColors.cardShadow),radius: 3)

                                }
                        }
                            
                            
                        }
                        
                        
                    }

                    

                    
//MARK: - Positions
                    if let item = theFinancials.pfPositions?.position {
                    Text("Positions")
                        .font(.system(size: 12)).fontWeight(.bold)
                        .frame(width: UIScreen.main.bounds.width-25, height: 15, alignment: .center)

                        if #available(iOS 15, *) {
                    
                            //iOS 15 View
                            
                        List(item) { position in
                            VStack {
                                VStack(spacing: 5) {

                                    Text(position.attributes!.title)
                                        .font(.system(size: 12))

                                    Text(position.attributes!.organization)
                                        .font(.system(size: 9)).fontWeight(.semibold)

                                }
                                .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: 15, alignment: .center)

                            }

                        }
                            
                        } else {
                            
                           //iOS 14 View
                            List(item) { position in
                                VStack {
                                    VStack(spacing: 5) {

                                        Text(position.attributes!.title)
                                        .frame(width: UIScreen.main.bounds.width-25, height: 15, alignment: .center)
                                            .font(.system(size: 12))

                                        Text(position.attributes!.organization)
                                            .font(.system(size: 9)).fontWeight(.semibold)
                                            .frame(height: 10, alignment: .center)

                                    }

                                }
                                .frame(width: UIScreen.main.bounds.width-35, height: 55, alignment: .center)
                                .background(Color(K.appColors.background))
                                .cornerRadius(8)
                                .shadow(color: Color(K.appColors.cardShadow),radius: 3)
                            }
                        }
                    }
                        
                    
                    
                }
                .animation(.default)
                .navigationBarTitle("\(title) \(lastName) - \(AppSettings.extendAbbreviation(StateName: state))", displayMode: .inline)
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
    }

//MARK: - CoreData CRUD-ADD
    
    func addItem() {
        
        withAnimation {
            let newBookMark = CongressPerson(context: viewContext)
            
            //Map Data to Model
            newBookMark.firstName = firstName
            newBookMark.lastName = lastName
            newBookMark.party = party
            newBookMark.bioID = bioID
            newBookMark.state = state
            newBookMark.cID = cID
            newBookMark.title = title
            newBookMark.status = status
            newBookMark.nextElection = nextElection
            newBookMark.facebook = facebook
            newBookMark.twitter = twitter
            newBookMark.youtube = youtube
            newBookMark.contact = contact
            newBookMark.phone = phone
            newBookMark.website = website
            newBookMark.isBookmarked = bookmark
            newBookMark.savedAt = Date()

            do {
                try viewContext.save()

            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                
            }
        }
    }

    
}





struct PersonalFinanceView_Previews: PreviewProvider {
    @Binding var isOn: Bool
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
        ).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext).preferredColorScheme)
        //.previewDevice(PreviewDevice(rawValue: "iPhone 8"))
    }
}


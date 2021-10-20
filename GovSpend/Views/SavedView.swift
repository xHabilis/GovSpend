//
//  DefaultView.swift
//  GovSpend
//
//  Created by Isaac M on 8/24/21.
//

import SwiftUI
import CoreData

struct SavedView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \CongressPerson.savedAt, ascending: false)],
        animation: .default) var congressPerson: FetchedResults<CongressPerson>
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \FecCandidate.savedAt, ascending: false)],
        animation: .default)
    
    var candidate: FetchedResults<FecCandidate>

    var body: some View {

    
        NavigationView {
            List {
                Section(header: Text("Congress")) {
        
                ForEach(congressPerson) { legislator in
                    
                    NavigationLink(
                        destination: FinancesView(theFinancials: FinancesManager(), firstName: legislator.firstName ?? "",
                                                  lastName: legislator.lastName ?? "",
                                                  bioID: legislator.bioID ?? "",
                                                  cID: legislator.cID ?? "",
                                                  title: legislator.title ?? "",
                                                  party: legislator.party ?? "",
                                                  state: legislator.state ?? "",
                                                  status: AppSettings.makeStatus(status: String(legislator.status ?? "")),
                                                  nextElection: legislator.nextElection ?? "",
                                                  facebook: legislator.facebook ?? "",
                                                  twitter: legislator.twitter ?? "",
                                                  youtube: legislator.youtube ?? "",
                                                  contact: legislator.contact ?? "",
                                                  phone: legislator.phone ?? "",
                                                  website: legislator.website ?? ""),
                        label: {
        
        
                    HStack (spacing: 13){
                        VStack{
                            let id = legislator.bioID!
                            let fullImageURL = "\(K.apiURLs.imageURL)\(String(describing: id))\(K.apiURLs.imageURLjpg)"
                            RemoteImage(url: fullImageURL)
                                .aspectRatio(contentMode: .fill)
                                //.frame(width: 70, height: 60, alignment: .leading)
                                //.clipShape(Rectangle())
                                .shadow(color: Color(.black), radius: 5)
                                .cornerRadius(8)
                        }
        
                        VStack(spacing: 2){
        
                            CongressBookMark(firstName: legislator.firstName ?? "",
                                             lastName: legislator.lastName ?? "",
                                             party: legislator.party ?? "",
                                             stateTitle: "State:",
                                             state:  legislator.state ?? "N/A")
        
                        }.animation(.linear)
                        .frame(width: UIScreen.main.bounds.width-130, height: 60, alignment: .center)
                        .background(AppSettings.chooseColor(for: legislator.party ?? ""))
                        .cornerRadius(8)
                        .shadow(color: Color(K.appColors.cardShadow),radius: 1.5)
        
                    }
                        })
    
                }
                .onDelete(perform: deleteItems)
                }
                
                
                
                Section(header: Text("Candidates")) {
                    
                ForEach (candidate) { candidate in
                NavigationLink(

                    destination: CandidateDetailsView(detailsManager: CandidateDetailsManager(), candidateURL: candidate.candidateURL ?? ""),
                    label: {

                        HStack {
                            VStack {

                                Text(candidate.name ?? "".capitalized)
                                    .padding(.leading)
                                    .frame(width: 280, height: 40, alignment: .leading)
                                    .font(.system(size: 12))
                                    .background(AppSettings.chooseColor(for: candidate.party ?? ""))
                                    .cornerRadius(8)
                                    .shadow(color: Color(K.appColors.cardShadow),radius: 1.5)
                            }

                            VStack {

                                Text(candidate.party ?? "")
                                    .frame(width: 50, height: 40, alignment: .center)
                                    .font(.system(size: 11))
                                    .background(AppSettings.chooseColor(for: candidate.party ?? ""))
                                    .cornerRadius(8)
                                    .shadow(color: Color(K.appColors.cardShadow),radius: 1.5)
                            }

                        }

                    })

                }.onDelete(perform: deleteCandidate)
                }
                
                
//MARK: - Notify User
                HStack (spacing: 10){
                Image(systemName: "bookmark")
                    .accentColor(.accentColor)
                    .font(.system(size: 20))
                Text("Tap the Bookmark button to save and easily access your candidate's information on this screen.")
                    .font(.system(size: 11))
                    .multilineTextAlignment(.center)
                    
                }
                //.font(.system(size: 11))
                //.frame(width: UIScreen.main.bounds.width-45, height: 80, alignment: .center)
                
                
            }.navigationBarTitle("Saved", displayMode: .inline)

            
        }.onAppear() {}.animation(.default)

    }
    
    
    
    
    //MARK: - CoreData CRUD-Delete
    
    func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { congressPerson[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {

                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    func deleteCandidate(offsets: IndexSet) {
        withAnimation {
            offsets.map { candidate[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {

                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    
}





struct DefaultView_Previews: PreviewProvider {
    static var previews: some View{
        ForEach(ColorScheme.allCases, id: \.self, content: SavedView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext).preferredColorScheme)
        //.previewDevice(PreviewDevice(rawValue: "iPhone 8"))
    }
}

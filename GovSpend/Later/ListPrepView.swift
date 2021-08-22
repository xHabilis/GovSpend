//
//  ListPrepView.swift
//  GovSpend
//
//  Created by Isaac M on 7/14/21.
//

import SwiftUI

struct ListPrepView: View {
    var body: some View {
        List (cand) { legislator in
            
            NavigationLink(
                
                destination: CurrentCongressDetailsView(idName: "s"),
                label: {
                    
                    HStack (spacing: 13){
                        
                        VStack{
                            RemoteImage(url: "https://i.imgur.com/b7hc004.jpeg")
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 70, height: 60, alignment: .leading)
                                //.background(Color(.green))
                                .clipShape(Rectangle())
                                .shadow(radius: 5)
                                .cornerRadius(8)
                            
                        }
                        VStack (spacing: 2){


                            VStack (spacing: -2.0){
                                HStack {
                                    Text(legislator.name)
                                        .padding(.leading, 20.0)
                                        .frame(width: 246, height: 20, alignment: .center)
                                        //.background(Color(.green))
                                        .font(.system(size: 12).bold())
                                    
                                    Text(legislator.party)
                                        .font(.system(size: 12)).bold()
                                        .padding(.trailing, 4)
                                        .shadow(radius: 2)
                                        .frame(width: 25, height: 20, alignment: .topTrailing)
                                        //.background(Color(.green))
                                    
                                }
                                
                                
                                HStack {
                                    Text("First Elected:")
                                        .font(.system(size: 10))
  
                                    Text(legislator.elected)
                                        .font(.system(size: 10).weight(.semibold))
                                        .frame(width: 50, height: 20, alignment: .leading)
                                        .background(Color(.green))
                                        .cornerRadius(8)
                                        .shadow(radius: 5)
          
                                }
                                
                                HStack {
                                    Text("Office:")
                                        .font(.system(size: 10))
                                    
                                    Text(legislator.office)
                                        .font(.system(size: 10).weight(.semibold))
                                        .frame(width: 45, height: 20, alignment: .leading)
                                }

                            }
                        }
                        .frame(width: 280, height: 60, alignment: .center)
                        //.background(ThePartyColors.chooseColor(for: legislator.party))
                        .background(Configs.chooseColor(for: legislator.party))
                        .cornerRadius(8)
                        .shadow(radius: 5)

                    }

                })
        }
    }
}



struct ListPrepView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self, content: ListPrepView().preferredColorScheme)
            //.previewDevice(PreviewDevice(rawValue: "iPhone X"))
    }
}

struct Candidate: Identifiable{
    let id: String
    let name: String
    let party: String
    let elected: String
    let office: String
}


let cand = [
    Candidate(id: "1", name: "Bernard Sanders", party: "D", elected: "05/34/2012", office: "NJ01"),
    Candidate(id: "2", name: "Albert, Carl", party: "R", elected: "05/34/2012", office: "NJ01"),
    Candidate(id: "3", name: "Badillo, Herman", party: "D", elected: "05/34/2012", office: "NJ01"),
    Candidate(id: "4", name: "Baird, James R.", party: "R", elected: "05/34/2012", office: "NJ01"),
    Candidate(id: "5", name: "Bereuter, Doug", party: "D", elected: "05/34/2012", office: "NJ01"),
    Candidate(id: "6", name: "Blagojevich, Rod R.", party: "I", elected: "05/34/2012", office: "NJ01"),
    Candidate(id: "7", name: "Deutch, Theodore E.", party: "D", elected: "05/34/2012", office: "NJ01"),
    Candidate(id: "8", name: "Dodd, Christopher J. ", party: "R", elected: "05/34/2012", office: "NJ01"),
    Candidate(id: "9", name: "Fenwick, Millicent H. ", party: "R", elected: "05/34/2012", office: "NJ01"),
    Candidate(id: "10", name: "Bernard Sanders", party: "R", elected: "05/34/2012", office: "NJ01"),
    Candidate(id: "11", name: "Blumenauer, Earl", party: "I", elected: "05/34/2012", office: "NJ01"),
    Candidate(id: "12", name: "Fleischmann, Charles J.", party: "G", elected: "05/34/2012", office: "NJ01"),
    Candidate(id: "13", name: "Hightower, Jack E.", party: "O", elected: "05/34/2012", office: "NJ01"),
    Candidate(id: "14", name: "Lagomarsino, Robert J.", party: "L", elected: "05/34/2012", office: "NJ01"),
    Candidate(id: "15", name: "Mailliard, William S. ", party: "D", elected: "05/34/2012", office: "NJ01"),
    Candidate(id: "1", name: "Bernard Sanders", party: "D", elected: "05/34/2012", office: "NJ01"),
    Candidate(id: "2", name: "Albert, Carl", party: "R", elected: "05/34/2012", office: "NJ01"),
    Candidate(id: "3", name: "Badillo, Herman", party: "D", elected: "05/34/2012", office: "NJ01"),
    Candidate(id: "4", name: "Baird, James R.", party: "R", elected: "05/34/2012", office: "NJ01"),
    Candidate(id: "5", name: "Bereuter, Doug", party: "D", elected: "05/34/2012", office: "NJ01"),
    Candidate(id: "6", name: "Blagojevich, Rod R.", party: "D", elected: "05/34/2012", office: "NJ01"),
    Candidate(id: "7", name: "Deutch, Theodore E.", party: "D", elected: "05/34/2012", office: "NJ01"),
    Candidate(id: "8", name: "Dodd, Christopher J. ", party: "R", elected: "05/34/2012", office: "NJ01"),
    Candidate(id: "9", name: "Fenwick, Millicent H. ", party: "R", elected: "05/34/2012", office: "NJ01"),
    Candidate(id: "10", name: "Bernard Sanders", party: "R", elected: "05/34/2012", office: "NJ01"),
    Candidate(id: "11", name: "Blumenauer, Earl", party: "I", elected: "05/34/2012", office: "NJ01"),
    Candidate(id: "12", name: "Fleischmann, Charles J.", party: "G", elected: "05/34/2012", office: "NJ01"),
    Candidate(id: "13", name: "Hightower, Jack E.", party: "O", elected: "05/34/2012", office: "NJ01"),
    Candidate(id: "14", name: "Lagomarsino, Robert J.", party: "L", elected: "05/34/2012", office: "NJ01"),
    Candidate(id: "15", name: "Mailliard, William S. ", party: "D", elected: "05/34/2012", office: "NJ01"),
]

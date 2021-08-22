//
//  ListPrepView.swift
//  GovSpend
//
//  Created by Isaac M on 7/14/21.
//

import SwiftUI

struct PFListView: View {
    var body: some View {
        VStack {
        
            Text("Assets")
                .font(.system(size: 13))
                .frame(width: UIScreen.main.bounds.width-25, height: 15, alignment: .center)
                .background(Color(K.appColors.background))
                .cornerRadius(10)

        List (things) { legislator in
  
                        VStack (spacing: 20){

                            HStack {
                                
                                VStack {
                                    Text(legislator.name)
                                        .font(.system(size: 12))

                                }
                                .frame(width: 170, height: 30, alignment: .leading)
                                //.background(Color(.green))
                                
                                Text("Real Estate")
                                    .frame(width: 50, height: 30, alignment: .center)
                                    .font(.system(size: 9))
                                
                                VStack(spacing: 8) {
                                    Text("High: $124,345,456")
                                        .font(.system(size: 9))
  
                                    Text("Low $24,345,456")
                                        .font(.system(size: 9).weight(.semibold))
                                }
                                .frame(width: 150, height: 30, alignment: .trailing)
                                //.background(Color(.green))
                                    
                            }
                        }
                        .frame(width: 390, height: 30, alignment: .leading)
                        //.background(Color(K.appColors.lightGray))
                        .cornerRadius(8)
                        .shadow(radius: 5)
        }
        
        Text("Positions")
            .font(.system(size: 13))
            .frame(width: 200, height: 25, alignment: .center)
            .background(Color(K.appColors.green))
            .cornerRadius(10)
            .shadow(radius: 1)
        List (alsoanother) { legislator in
    
                        VStack (spacing: 20){

                            HStack {

                                VStack (spacing: 8){
                                    Text(legislator.name)
                                        .font(.system(size: 15))

                                    Text("Real Estate")
                                        .font(.system(size: 10))

                                }
                                .frame(width: 170, height: 40, alignment: .center)
                                //.background(Color(.green))

                            }
                        }
                        .frame(width: 390, height: 50, alignment: .center)
                        .background(Color(K.appColors.lightGray))
                        .cornerRadius(8)
                        .shadow(radius: 5)
            
        }
        }
    }
}


//
//struct PFListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ForEach(ColorScheme.allCases, id: \.self, content: PFListView().preferredColorScheme)
//            //.previewDevice(PreviewDevice(rawValue: "iPhone X"))
//    }
//}

struct PFListView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self, content: PFListView().preferredColorScheme)
            //.previewDevice(PreviewDevice(rawValue: "iPhone X"))
    }
}

struct Person: Identifiable{
    let id: String
    let name: String
    let party: String
    let elected: String
    let office: String
}


let things = [
    Candidate(id: "1", name: "Bernard Sanders", party: "D", elected: "05/34/2012", office: "NJ01"),
    Candidate(id: "2", name: "Albert, Carl", party: "R", elected: "05/34/2012", office: "NJ01"),
    Candidate(id: "3", name: "Badillo, Herman", party: "D", elected: "05/34/2012", office: "NJ01"),
    Candidate(id: "4", name: "Baird, James R.", party: "R", elected: "05/34/2012", office: "NJ01"),
    Candidate(id: "5", name: "Bereuter, Doug", party: "D", elected: "05/34/2012", office: "NJ01"),
    Candidate(id: "6", name: "Blagojevich, Rod R.", party: "I", elected: "05/34/2012", office: "NJ01"),
    Candidate(id: "7", name: "Deutch, Theodore E.", party: "D", elected: "05/34/2012", office: "NJ01"),
//    Candidate(id: "8", name: "Dodd, Christopher J. ", party: "R", elected: "05/34/2012", office: "NJ01"),
//    Candidate(id: "9", name: "Fenwick, Millicent H. ", party: "R", elected: "05/34/2012", office: "NJ01"),
//    Candidate(id: "10", name: "Bernard Sanders", party: "R", elected: "05/34/2012", office: "NJ01"),
//    Candidate(id: "11", name: "Blumenauer, Earl", party: "I", elected: "05/34/2012", office: "NJ01"),
//    Candidate(id: "12", name: "Fleischmann, Charles J.", party: "G", elected: "05/34/2012", office: "NJ01"),
//    Candidate(id: "13", name: "Hightower, Jack E.", party: "O", elected: "05/34/2012", office: "NJ01"),
//    Candidate(id: "14", name: "Lagomarsino, Robert J.", party: "L", elected: "05/34/2012", office: "NJ01"),
//    Candidate(id: "15", name: "Mailliard, William S. ", party: "D", elected: "05/34/2012", office: "NJ01"),
//    Candidate(id: "1", name: "Bernard Sanders", party: "D", elected: "05/34/2012", office: "NJ01"),
//    Candidate(id: "2", name: "Albert, Carl", party: "R", elected: "05/34/2012", office: "NJ01"),
//    Candidate(id: "3", name: "Badillo, Herman", party: "D", elected: "05/34/2012", office: "NJ01"),
//    Candidate(id: "4", name: "Baird, James R.", party: "R", elected: "05/34/2012", office: "NJ01"),
//    Candidate(id: "5", name: "Bereuter, Doug", party: "D", elected: "05/34/2012", office: "NJ01"),
//    Candidate(id: "6", name: "Blagojevich, Rod R.", party: "D", elected: "05/34/2012", office: "NJ01"),
//    Candidate(id: "7", name: "Deutch, Theodore E.", party: "D", elected: "05/34/2012", office: "NJ01"),
//    Candidate(id: "8", name: "Dodd, Christopher J. ", party: "R", elected: "05/34/2012", office: "NJ01"),
//    Candidate(id: "9", name: "Fenwick, Millicent H. ", party: "R", elected: "05/34/2012", office: "NJ01"),
//    Candidate(id: "10", name: "Bernard Sanders", party: "R", elected: "05/34/2012", office: "NJ01"),
//    Candidate(id: "11", name: "Blumenauer, Earl", party: "I", elected: "05/34/2012", office: "NJ01"),
//    Candidate(id: "12", name: "Fleischmann, Charles J.", party: "G", elected: "05/34/2012", office: "NJ01"),
//    Candidate(id: "13", name: "Hightower, Jack E.", party: "O", elected: "05/34/2012", office: "NJ01"),
//    Candidate(id: "14", name: "Lagomarsino, Robert J.", party: "L", elected: "05/34/2012", office: "NJ01"),
//    Candidate(id: "15", name: "Mailliard, William S. ", party: "D", elected: "05/34/2012", office: "NJ01"),
]

let anotherone = [
    Candidate(id: "8", name: "Dodd, Christopher J. ", party: "R", elected: "05/34/2012", office: "NJ01"),
    Candidate(id: "9", name: "Fenwick, Millicent H. ", party: "R", elected: "05/34/2012", office: "NJ01"),
    Candidate(id: "10", name: "Bernard Sanders", party: "R", elected: "05/34/2012", office: "NJ01"),
    Candidate(id: "11", name: "Blumenauer, Earl", party: "I", elected: "05/34/2012", office: "NJ01"),
    Candidate(id: "12", name: "Fleischmann, Charles J.", party: "G", elected: "05/34/2012", office: "NJ01"),

    
]
let alsoanother = [
    Candidate(id: "8", name: "Dodd, Christopher J. ", party: "R", elected: "05/34/2012", office: "NJ01"),
    Candidate(id: "9", name: "Fenwick, Millicent H. ", party: "R", elected: "05/34/2012", office: "NJ01"),
    Candidate(id: "10", name: "Bernard Sanders", party: "R", elected: "05/34/2012", office: "NJ01"),
    Candidate(id: "11", name: "Blumenauer, Earl", party: "I", elected: "05/34/2012", office: "NJ01"),
    Candidate(id: "12", name: "Fleischmann, Charles J.", party: "G", elected: "05/34/2012", office: "NJ01"),

    
]

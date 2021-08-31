//
//  ListPrepView.swift
//  GovSpend
//
//  Created by Isaac M on 7/14/21.
//

//import SwiftUI
//
//
//struct ImageOverlay: View {
//    
//    @State private var candidateName: String = ""
//    @State private var cycleYear = "2020"
//    @State private var congressNumber = "117"
//    @State private var chamber = "Senate"
//    @State private var showCitationView: Bool = false
//    @State private var isShowingCandidates: Bool = false
//    
//    var body: some View {
//
//        ZStack {
//            TextField("Enter Name",
//                      text: $candidateName, onCommit:{
//                        isShowingCandidates = true
//
//                      })
//                .font(.system(size: 11))
//                .keyboardType(.webSearch)
//                .padding(.leading)
//                .frame(width: 300, height: 40, alignment: .center)
//                .background(Color(K.appColors.background))
//                .cornerRadius(10)
//                .shadow(color: Color(K.appColors.cardShadow),radius: 0.4)
//        }.background(Color.black)
//        .opacity(0.8)
//        .cornerRadius(10.0)
//        .padding(6)
//    }
//    
//}
//
//
//        
//        
//
//struct ImageOverlay_Previews: PreviewProvider {
//    static var previews: some View {
//        ForEach(ColorScheme.allCases, id: \.self, content: ImageOverlay().preferredColorScheme)
//            //.previewDevice(PreviewDevice(rawValue: "iPhone X"))
//    }
//}
//

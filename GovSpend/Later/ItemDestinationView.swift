//
//  ItemDestinationView.swift
//  GovSpend
//
//  Created by Isaac M on 7/11/21.
//

import SwiftUI

struct ItemDestinationView: View {
    
    @State private var noDataFound = false

    
    var body: some View {
        
        NavigationView {
        
        
        
        
        
        Button("Source") {

                    noDataFound = true
                }
        .frame(width: 80, height: 30, alignment: .center)
        .background(Color(K.appColors.blue))
        .font(.system(size: 11))
        .foregroundColor(.white)
        .cornerRadius(5)
        .shadow(radius: 10)
                .alert(isPresented: $noDataFound) {
                    Alert(title: Text("Data Provided By"),
                          message: Text("Wear sunscreen"),
                          dismissButton: .default(Text("OK")))

                }
        

        
        }
    
    
    }
    
    
    
}



struct ItemDestinationView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDestinationView()
    }
}


//struct LoadingView: View {
//    
//    @State private var hasTimeElapsed = false
//    
//    var body: some View {
//        
//       
//        if hasTimeElapsed {
//            VStack {
//                
//                Text("Candidate Data Not Found")
//                
//            }
//        }else{
//            
//            VStack {
//                
//                ProgressView().onAppear(perform: delayText)
//                    .progressViewStyle(CircularProgressViewStyle(tint: .blue))
//                    .scaleEffect(3)
//            }.frame(width: 100, height: 100, alignment: .center)
//            .background(Color(K.appColors.blue))
//            .cornerRadius(10)
//            .shadow(radius: 7)
//        }
//        
//        
//
//        
//        
//        
//        
//    }
//    private func delayText() {
//         DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
//             hasTimeElapsed = true
//         }
//     }
//}

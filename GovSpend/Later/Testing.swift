//
//  Testing.swift
//  GovSpend
//
//  Created by Isaac M on 8/23/21.
//

import SwiftUI

struct Something: View {

    var body: some View {

        VStack (spacing: 10){
                Testing(CategoryUrlName: "google.com", CategoryTitle: "Category")
        }
        

    }
}

struct Something_Previews: PreviewProvider {
    static var previews: some View {
        Something()
    }
}
struct Testing: View {
    
    var CategoryUrlName: String
    var CategoryTitle: String
    
    @State private var isCurrent:Bool = false
    
    var body: some View {
        NavigationLink(
            destination: CategoryResultView(categoriesList: CategorySearchManager(), candidateDetailsManager: CandidateDetailsManager(), categoryUrl: CategoryUrlName, title: CategoryTitle),
            label: {
                
                Text(CategoryTitle)
                
            })
            .foregroundColor(Color(.black))
            .font(.system(size: 12))
            .frame(width: 115, height: 32, alignment: .center)
            .background(Color(K.appColors.green))
            .cornerRadius(10)
            .shadow(color: Color(K.appColors.cardShadow),radius: 2)
        
        
        NavigationLink(
            destination: CategoryResultView(categoriesList: CategorySearchManager(), candidateDetailsManager: CandidateDetailsManager(), categoryUrl: CategoryUrlName, title: CategoryTitle),
            isActive: $isCurrent,
            label: {
                NavLink(color: K.appColors.green)
            }).onTapGesture {
                isCurrent = false
                NavLink.init(color: K.appColors.red)
            }
        


            
    }
}

struct NavLink: View {
    var color: String
    var body: some View {
        Text("Navigate")
            .foregroundColor(Color(.black))
            .font(.system(size: 12))
            .frame(width: 115, height: 32, alignment: .center)
            .background(Color(color))
            .cornerRadius(10)
            .shadow(color: Color(K.appColors.cardShadow),radius: 2)
    }
}

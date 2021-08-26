//
//  Testing.swift
//  GovSpend
//
//  Created by Isaac M on 8/23/21.
//

import SwiftUI

struct Test: View {
    @State private var rememberMe = false

    var body: some View {
        VStack {
            //SaveButton(isOn: $rememberMe)
            Text(rememberMe ? "On" : "Off")
        }
    }
}


struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}



//struct SaveButton: View {
//
//    @Binding var isOn: Bool
//
//    var body: some View {
//
//        Button(action: {self.isOn.toggle()} , label: {
//            if isOn {
//                Image(systemName: "bookmark.fill")
//            } else {
//                Image(systemName: "bookmark")
//            }
//        })
//
//        .padding()
//        .clipShape(Rectangle())
//    }
//}

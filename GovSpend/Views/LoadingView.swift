//
//  LoadingView.swift
//  GovSpend
//
//  Created by Isaac M on 7/24/21.
//

import SwiftUI

struct LoadingView: View {

    @State private var hasTimeElapsed = false

    var body: some View {

        if hasTimeElapsed {
            VStack {

                Text("Error: Data may be missing or unavailable at this time.")
                    .font(.system(size: 10))
                    .padding(.top)

            }

        }else{

            VStack {

                ProgressView()
                    .onAppear(perform: delayText)
                    .progressViewStyle(CircularProgressViewStyle(tint: .accentColor))
                    .scaleEffect(1.5)

            }.frame(width: 100, height: 100, alignment: .center)

        }

    }
    private func delayText() {
         DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
             hasTimeElapsed = true
         }
     }
}


struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}











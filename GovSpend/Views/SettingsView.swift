//
//  SettingsView.swift
//  GovSpend
//
//  Created by Isaac M on 8/24/21.
//

import SwiftUI


struct SettingsView: View {

    @State private var tapCount = 0

    @State var theColorScheme: ColorScheme
    
    
    @State var isOn:Bool = false
    
    
    
    
   func toggleColorScheme() {
        
    if isOn {theColorScheme = (theColorScheme == .dark) ? .light : .dark}
   
    }
    
    
    var body: some View {
        
        Button("Tap count: \(tapCount)") {
              self.tapCount += 1
            
          }
        
        Toggle(isOn: $isOn, label: {
            Text("Dark Mode")
            
            
            
        })
        

                   
        
        
    }
}





struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(theColorScheme: .light)
    }
}



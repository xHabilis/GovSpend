//
//  Testing.swift
//  GovSpend
//
//  Created by Isaac M on 8/23/21.
//

import SwiftUI

struct TestData: Identifiable {
    var id = UUID()
    var title: String
    var items: [String]
}

struct ListView : View {
    let mygroups = [
        TestData(title: "Numbers", items: ["1","2","3"]),
        TestData(title: "Letters", items: ["A","B","C"]),
        TestData(title: "Symbols", items: ["€","%","&"])
    ]

    var body: some View {
        List {
            ForEach(mygroups) { gr in
                Section(header: Text(gr.title)) {
                    ForEach(gr.items, id: \.self, content: { item in
                                                Text(item)
                                            })
                }
            }
        }
    }
}


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}




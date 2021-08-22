//
//  SectorTotalsView.swift
//  GovSpend
//
//  Created by Isaac M on 7/16/21.
//

import SwiftUI

struct SectorTotalsView: View {

    @StateObject var sector: SectorTotalsManager
    @State private var showCitationView: Bool = false
    
    var id: String
    
@ViewBuilder
    var body: some View {
        
        if sector.sectorTotal.count == 0 {
            LoadingView()
        }
        
        ZStack {
            Color(K.appColors.background)
                .edgesIgnoringSafeArea(.bottom)
            VStack {
                List (sector.sectorTotal) { sectorItem in
                //List (sectorStuff) { sector in
                    HStack {
                        VStack {
                            Text(sectorItem.attributes!.sector_name)
                            //Text(sector.sector_name)
                                .font(.system(size: 12)).fontWeight(.semibold)
                                .multilineTextAlignment(.leading)
                                .lineLimit(3)
                            
                        }
                        .frame(width: 180, height: 50, alignment: .leading)
                        //.background(Color(K.appColors.lightBlue))
                        
                        VStack (spacing: 5) {
                            
                            HStack {
                                Text("Total:")
                                    .frame(width: 60, height: 10, alignment: .trailing)
                                //.background(Color(K.appColors.lightBlue))
                                Text("\(Configs.convertToDollars(someDouble: Double(sectorItem.attributes!.total)!))")
                                //Text(sectorItem.attributes)
                                    .frame(width: 60, height: 10, alignment: .leading)
                                //.background(Color(K.appColors.lightBlue))
                            }
                            .font(.system(size: 10))
                            
                            HStack {
                                Text("From Pacs:")
                                    .frame(width: 60, height: 10, alignment: .trailing)
                                //.background(Color(K.appColors.lightBlue))
                                
                                Text("\(Configs.convertToDollars(someDouble: Double(sectorItem.attributes!.pacs)!))")
                                //Text(sector.pacs)
                                    .frame(width: 60, height: 10, alignment: .leading)
                                //.background(Color(K.appColors.lightBlue))
                            }
                            .font(.system(size: 10))
                            
                            HStack {
                                Text("Individuals:")
                                    .frame(width: 60, height: 10, alignment: .trailing)
                                //.background(Color(K.appColors.lightBlue))
                                
                                Text("\(Configs.convertToDollars(someDouble: Double(sectorItem.attributes!.indivs)!))")
                                //Text(sector.indivs)
                                    .frame(width: 60, height: 10, alignment: .leading)
                                //.background(Color(K.appColors.lightBlue))
                            }
                            .font(.system(size: 10))
                            
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width-35, height: 60, alignment: .center)
                    .background(Color(K.appColors.background))
                    .cornerRadius(8)
                    .shadow(radius: 5)
                }
                Spacer()
                
                if let theSector = sector.sectorCandidate?.attributes {
                VStack (spacing: 15){
                    Text("Center for Responsive Politics")
                        .font(.system(size: 15)).fontWeight(.semibold)
                    
                    //Text(theFunds.source)
                    Link("Source", destination: URL(string: "\(theSector.source)")!)
                        .frame(width: 300, height: 35, alignment: .center)
                        //.foregroundColor()
                        .font(.system(size: 15))
                        .background(Color(K.appColors.background))
                        .cornerRadius(15)
                        .shadow(radius: 5)
                    
                    Text("Last Updated: 04/04/2020")
                        .font(.system(size: 11)).fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                
                    
                }
                .frame(width: UIScreen.main.bounds.width-25, height: 150, alignment: .center)
                .background(Color(K.appColors.green)).opacity(0.9)
                .cornerRadius(20)
                .shadow(radius: 5)
                    
                }
            }
            .onAppear() {
                sector.getSectorTotals(for: id, in: "")
            }
            
            .navigationBarTitle("Sector Totals")
            .navigationBarItems(trailing:
                                    Button(action: {
                                        showCitationView = true
                                        
                                    }){Image(systemName: "info.circle").imageScale(.large)
                                        .sheet(isPresented: $showCitationView) {
                                            CitationView()
                                        }})
        }
        
        
        
    }
}

struct SectorTotalsView_Previews: PreviewProvider {
    static var previews: some View {
        SectorTotalsView(sector: SectorTotalsManager(), id: "")
    }
}


//            .onAppear() {
//                sector.getSectorTotals(for: id, in: "2020")
//            }

//.navigationBarTitle("Sector Totals")
//.navigationBarItems(trailing:
//                        Button(action: {
//                            showCitationView = true
//
//                        }){Image(systemName: "info.circle").imageScale(.large)
//                            .sheet(isPresented: $showCitationView) {
//                                CitationView()
//                            }})

let sectorStuff = [
    dummySector(id: "12345",
                sector_name: "Real Estate/ Finance and Length",
                indivs: "$12,455",
                pacs: "$45,345",
                total: "5$00,000"),
    dummySector(id: "12345",
                sector_name: "Real Estate/ Finance and Length",
                indivs: "$12,455",
                pacs: "$45,345",
                total: "5$00,000"),
    dummySector(id: "12345",
                sector_name: "Real Estate/ Finance and Length",
                indivs: "$12,455",
                pacs: "$45,345",
                total: "5$00,000"),
    dummySector(id: "12345",
                sector_name: "Real Estate/ Finance and Length",
                indivs: "$12,455",
                pacs: "$45,345",
                total: "5$00,000"),
    dummySector(id: "12345",
                sector_name: "Real Estate/ Finance and Length",
                indivs: "$12,455",
                pacs: "$45,345",
                total: "5$00,000"),
    dummySector(id: "12345",
                sector_name: "Real Estate/ Finance and Length",
                indivs: "$12,455",
                pacs: "$45,345",
                total: "5$00,000"),
    dummySector(id: "12345",
                sector_name: "Real Estate/ Finance and Length",
                indivs: "$12,455",
                pacs: "$45,345",
                total: "5$00,000"),
    dummySector(id: "12345",
                sector_name: "Real Estate/ Finance and Length",
                indivs: "$12,455",
                pacs: "$45,345",
                total: "5$00,000"),
    dummySector(id: "12345",
                sector_name: "Real Estate/ Finance and Length",
                indivs: "$12,455",
                pacs: "$45,345",
                total: "5$00,000"),
    dummySector(id: "12345",
                sector_name: "Real Estate/ Finance and Length",
                indivs: "$12,455",
                pacs: "$45,345",
                total: "5$00,000"),
]

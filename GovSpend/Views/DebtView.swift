//
//  DebtView.swift
//  GovSpend
//
//  Created by Isaac M on 8/8/21.
//

import SwiftUI
import SwiftUICharts

struct DebtView: View {
    
    @StateObject var annualDebt: AnnualDebtManager
    @StateObject var monthlyDebt: MonthlyDebtManager
    
    @State private var showCitationView: Bool = false
    
    var body: some View {
        NavigationView {
            
            ScrollView (showsIndicators: false) {
                
                VStack (spacing: 25){
 
                    if let allDebt = monthlyDebt.monthlyDebt.first {
                        VStack (spacing: 2) {
                            
                            Text("Total Public Debt Outstanding")
                                .font(.system(size: 13)).fontWeight(.semibold).padding(.vertical, 5.0)
                            Text(Configs.convertToDollars(someDouble: Double(allDebt.tot_pub_debt_out_amt)!))
                                .font(.system(size: 12))
                                .frame(width: 250, height: 35, alignment: .center)
                                .background(Color(.systemBlue))
                                .cornerRadius(10)
                                .shadow(color: Color(K.appColors.cardShadow), radius: 2)
                            
                            
                            Text("Debt Held by the Public")
                                .font(.system(size: 10)).fontWeight(.semibold)
                            Text(Configs.convertToDollars(someDouble: Double(allDebt.debt_held_public_amt)!))
                                .font(.system(size: 9))
                                .padding(.bottom, 3.0)
                            
                            Text("Intragovernmental Holdings")
                                .font(.system(size: 10)).fontWeight(.semibold)
                            Text(Configs.convertToDollars(someDouble: Double(allDebt.intragov_hold_amt)!))
                                .font(.system(size: 9))
                            
                        }
                    }
                    
                    
                    VStack (spacing: 40) {
                    BarChartView(data: ChartData(values: annualDebt.barChartData), title: "National Debt: Annual", legend: "Calendar Year", style: Styles.barChartStyleOrangeLight, form: ChartForm.extraLarge, dropShadow: false, cornerImage: Image(systemName: "dollarsign.square"))
                    
                    BarChartView(data: ChartData(values: monthlyDebt.barChartData), title: "Monthly Snapshot", legend: "Date", style: Styles.barChartStyleNeonBlueLight, form: ChartForm.extraLarge, dropShadow: false, cornerImage: Image(systemName: "dollarsign.square"))
                    }
                    
                    if let allDebt = monthlyDebt.monthlyDebt.first {
                        
                        Text("Updated: \(allDebt.record_date)")
                            .font(.system(size: 8)).fontWeight(.semibold).padding(.top)
                    }
                    
                }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .top)
                .background(Color(K.appColors.background))
                .edgesIgnoringSafeArea(.all)
                
                
                
                
            }
            .navigationBarTitle("Gov$pend", displayMode: .inline)
            .navigationBarItems(trailing:
                                    Button(action: {
                                        showCitationView = true
                                        
                                    }){Image(systemName: "info.circle").imageScale(.large)
                                        .sheet(isPresented: $showCitationView) {
                                            CitationView()
                                        }})
            .onAppear() {
                
                annualDebt.getAnnualDebt()
                monthlyDebt.getMonthlyDebt()
                
            }
        }
        
    }
}

struct AnnualDebtView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self, content: DebtView(annualDebt: AnnualDebtManager(), monthlyDebt: MonthlyDebtManager()).preferredColorScheme)
        //.previewDevice(PreviewDevice(rawValue: "iPhone 8"))
    }
}


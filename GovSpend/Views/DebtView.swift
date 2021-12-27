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
            ZStack {
                Color(K.appColors.background)
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView (showsIndicators: false) {
                        
                        VStack (spacing: 25){
                           
                            
                            if let allDebt = monthlyDebt.monthlyDebt.first {
                                VStack (spacing: 10) {
                                    
                                    Text("Total Public Debt Outstanding")
                                        .font(.system(size: 13)).fontWeight(.semibold).padding(.vertical, 5.0)
                                    Text(AppSettings.convertToDollars(someDouble: Double(allDebt.tot_pub_debt_out_amt)!))
                                        .font(.system(size: 20)).fontWeight(.bold)
                                        .foregroundColor(.red)
                                        .frame(width: 250, height: 35, alignment: .center)
                                        .background(Color(K.appColors.background))
                                        .cornerRadius(10)
                                        .shadow(color: Color(K.appColors.cardShadow), radius: 2)
                                    
                                    
                                    Text("Debt Held by the Public")
                                        .font(.system(size: 12)).fontWeight(.semibold)
                                    Text(AppSettings.convertToDollars(someDouble: Double(allDebt.debt_held_public_amt)!))
                                        .font(.system(size: 12))
                                        .padding(.bottom, 3.0)
                                    
                                    Text("Intragovernmental Holdings")
                                        .font(.system(size: 12)).fontWeight(.semibold)
                                    Text(AppSettings.convertToDollars(someDouble: Double(allDebt.intragov_hold_amt)!))
                                        .font(.system(size: 12))

                                    
                                }
                                .frame(width: UIScreen.main.bounds.width-74, height: 200, alignment: .center)
                                .background(Color(K.appColors.background))
                                .cornerRadius(20)
                                .shadow(color: Color(K.appColors.cardShadow), radius: 2)

                            }
                                                        
                            VStack {
                            BarChartView(data: ChartData(values: annualDebt.barChartData), title: "National Debt: Annual", legend: "Calendar Year", style: Styles.barChartStyleOrangeLight, form: ChartForm.extraLarge, dropShadow: false, cornerImage: Image(systemName: "dollarsign.square"))
                  

                            BarChartView(data: ChartData(values: monthlyDebt.barChartData), title: "Daily Debt Total", legend: "Date", style: Styles.barChartStyleNeonBlueLight, form: ChartForm.extraLarge, dropShadow: false, cornerImage: Image(systemName: "dollarsign.square"))
                        
                            }

                            if let allDebt = monthlyDebt.monthlyDebt.first {
                                
                                Text("Last Updated: \(allDebt.record_date)")
                                    .font(.system(size: 11)).fontWeight(.semibold).padding(.top)
                            }
      
                        }

                    }
                    .navigationBarTitle("GovSpend", displayMode: .inline)
                    .onAppear() {
                        
                        annualDebt.getAnnualDebt()
                        monthlyDebt.getMonthlyDebt()
                        
                }.animation(.default)
 
        }
        
    }
}

struct AnnualDebtView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self, content: DebtView(annualDebt: AnnualDebtManager(), monthlyDebt: MonthlyDebtManager()).preferredColorScheme)
        //.previewDevice(PreviewDevice(rawValue: "iPhone 8"))
    }
}


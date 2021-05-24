//
//  ContentView.swift
//  Calculadora_Investimentos
//
//  Created by Marcelo Diefenbach on 24/05/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Rectangle().foregroundColor(Color.init("BgBlack")).ignoresSafeArea()
            VStack{
                InitialInvestmentView()
                MonthlyInvestmentView()
                PeriodInvestmentView().padding(.top,UIScreen.main.bounds.height*0.006)
                HStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(.blue)
                            .frame(width: UIScreen.main.bounds.width*0.9, height: UIScreen.main.bounds.height*0.05, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        Text("Resultado completo")
                            .foregroundColor(.white)
                            .font(Font.custom("Poppins-Regular", size: UIScreen.main.bounds.height*0.015))
                    }
                }.padding(.top,UIScreen.main.bounds.height*0.006)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

func formatar(valor: Double, tipo: Bool) -> String {
    let formatter = NumberFormatter()
    formatter.locale = Locale.current // Change this to another locale if you want to force a specific locale, otherwise this is redundant as the current locale is the default already
    formatter.numberStyle = .currency
    if(tipo){
        formatter.maximumFractionDigits = 2
        formatter.currencySymbol = "R$"
    }else{
        formatter.maximumFractionDigits = 0
        formatter.currencySymbol = ""
    }

    if let formattedTipAmount = formatter.string(from: valor as NSNumber) {
        return "\(formattedTipAmount)"
    }
    return ""
}

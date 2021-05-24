//
//  PriodInvestment.swift
//  Calculadora_Investimentos
//
//  Created by Marcelo Diefenbach on 24/05/21.
//

import SwiftUI

struct PeriodInvestmentView: View {
    @State private var periodInvestment: Double = 0
    var body: some View {
        ZStack{
                RoundedRectangle(cornerRadius: 15)
                .foregroundColor(Color.white)
                .frame(width: UIScreen.main.bounds.width*0.9, height: UIScreen.main.bounds.height*0.25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            VStack{
                Text("Por quanto tempo você fará o investimento?")
                    .font(Font.custom("Poppins-Bold", size: UIScreen.main.bounds.height*0.018))
                    .multilineTextAlignment(.center)
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,
                           maxWidth: UIScreen.main.bounds.width*0.6,
                           minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,
                           maxHeight: UIScreen.main.bounds.height*0.06,
                           alignment: .center)
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        .frame(width: UIScreen.main.bounds.width*0.4, height: UIScreen.main.bounds.height*0.05, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Text("\(formatar(valor: periodInvestment, tipo: false))").bold().fixedSize().foregroundColor(.white)
                }
                Slider(value: $periodInvestment, in: 0...100)
                    .padding(.horizontal,UIScreen.main.bounds.height*0.07)
                    .padding(.top,UIScreen.main.bounds.width*0.01)
                    .padding(.bottom,UIScreen.main.bounds.width*0.015)
                HStack{
                    Text("0").font(Font.custom("Poppins-Regular", size: UIScreen.main.bounds.height*0.013))
                        .foregroundColor(.gray)
                        .frame(width: UIScreen.main.bounds.width*0.2,
                               height: UIScreen.main.bounds.height*0.01,
                               alignment: .leading)
                        .padding(.leading,UIScreen.main.bounds.width*0.15)
                    Spacer()
                    Text("100").font(Font.custom("Poppins-Regular", size: UIScreen.main.bounds.height*0.013))
                        .foregroundColor(.gray)
                        .frame(width: UIScreen.main.bounds.width*0.2,
                               height: UIScreen.main.bounds.height*0.01,
                               alignment: .trailing)
                        .padding(.trailing,UIScreen.main.bounds.width*0.15)
                }
            }
        }
    }
}

struct PeriodInvestmentView_Previews: PreviewProvider {
    static var previews: some View {
        PeriodInvestmentView()
    }
}

private func formatar(valor: Double) -> String {
    let formatter = NumberFormatter()
    formatter.locale = Locale.current // Change this to another locale if you want to force a specific locale, otherwise this is redundant as the current locale is the default already
    formatter.numberStyle = .currency
    formatter.maximumFractionDigits = 0
    formatter.currencySymbol = ""
    if let formattedTipAmount = formatter.string(from: valor as NSNumber) {
        return "\(formattedTipAmount)"
    }
    return ""
}

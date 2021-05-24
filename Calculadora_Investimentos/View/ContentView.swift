//
//  ContentView.swift
//  Calculadora_Investimentos
//
//  Created by Marcelo Diefenbach on 24/05/21.
//

import SwiftUI

struct ContentView: View {
    @State private var inicialInvestment: Double = 0

    var body: some View {
        ZStack{
            Rectangle().foregroundColor(Color.init("BgBlack")).ignoresSafeArea()
            ZStack{
                    RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(Color.white)
                    .frame(width: UIScreen.main.bounds.width*0.9, height: UIScreen.main.bounds.height*0.3, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                VStack{
                    Text("Qual o valor do seu investimento inicial?")
                        .font(Font.custom("Poppins-Bold", size: UIScreen.main.bounds.height*0.02))
                        .multilineTextAlignment(.center)
                        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,
                               maxWidth: UIScreen.main.bounds.width*0.7,
                               minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,
                               maxHeight: UIScreen.main.bounds.height*0.07,
                               alignment: .center)
                    ZStack{
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                            .frame(width: UIScreen.main.bounds.width*0.5, height: UIScreen.main.bounds.height*0.06, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        Text("\(formatar(valor: inicialInvestment))").bold().fixedSize().foregroundColor(.white)

                    }
                    Slider(value: $inicialInvestment, in: 0...100)
                        .padding(.horizontal,UIScreen.main.bounds.height*0.06)
                        .padding(.top,UIScreen.main.bounds.width*0.03)
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

func formatar(valor: Double) -> String {
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

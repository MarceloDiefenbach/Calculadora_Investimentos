//
//  InitialInvestment.swift
//  Calculadora_Investimentos
//
//  Created by Marcelo Diefenbach on 24/05/21.
//

import SwiftUI

struct InitialInvestmentView: View {
    @Binding var initialInvestment: Double
    
    var body: some View {
        ZStack{
            Rectangle().foregroundColor(Color.init("BgBlack")).ignoresSafeArea()
                RoundedRectangle(cornerRadius: UIScreen.main.bounds.height*0.015)
                .foregroundColor(Color.white)
                .frame(width: UIScreen.main.bounds.width*0.9, height: UIScreen.main.bounds.height*0.18, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            VStack{
                HStack{
                    Text("Qual o valor do seu investimento inicial?")
                        .foregroundColor(Color.init("BgBlack"))
                        .font(Font.custom("Poppins-Bold", size: UIScreen.main.bounds.height*0.015))
                        .multilineTextAlignment(.leading)
                        Spacer()
                    ZStack{
                        RoundedRectangle(cornerRadius: UIScreen.main.bounds.height*0.015)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                            .frame(width: UIScreen.main.bounds.width*0.35, height: UIScreen.main.bounds.height*0.04, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        Text("\(formatar(valor: initialInvestment, tipo: true))").foregroundColor(Color.white)
                            .font(Font.custom("Poppins-Medium", size: UIScreen.main.bounds.height*0.02))
                    }
                }.padding(.horizontal,UIScreen.main.bounds.height*0.05)
                Slider(value: $initialInvestment, in: 0.01...100000, step: 100)
                    .padding(.horizontal,UIScreen.main.bounds.height*0.05)
                    .padding(.top,UIScreen.main.bounds.width*0.01)
                    .padding(.bottom,UIScreen.main.bounds.width*0.015)
                HStack{
                    Text("R$0").font(Font.custom("Poppins-Regular", size: UIScreen.main.bounds.height*0.013))
                        .foregroundColor(.gray)
                        .frame(width: UIScreen.main.bounds.width*0.2,
                               height: UIScreen.main.bounds.height*0.01,
                               alignment: .leading)
                    Spacer()
                    Text("R$100.000").font(Font.custom("Poppins-Regular", size: UIScreen.main.bounds.height*0.013))
                        .foregroundColor(.gray)
                        .frame(width: UIScreen.main.bounds.width*0.2,
                               height: UIScreen.main.bounds.height*0.01,
                               alignment: .trailing)
                }.padding(.horizontal,UIScreen.main.bounds.width*0.12)
            }
        }
    }
}

//struct InitialInvestmentView_Previews: PreviewProvider {
//    static var previews: some View {
//        InitialInvestmentView()
//    }
//}

let formatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.locale = Locale.current // Change this to another locale if you want to force a specific locale, otherwise this is redundant as the current locale is the default already
    formatter.numberStyle = .currency
    
    formatter.maximumFractionDigits = 0
    formatter.currencySymbol = "R$"
    
    return formatter
}()

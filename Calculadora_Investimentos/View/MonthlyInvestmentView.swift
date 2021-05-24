//
//  MonthlyInvestmentView.swift
//  Calculadora_Investimentos
//
//  Created by Marcelo Diefenbach on 24/05/21.
//

import SwiftUI

struct MonthlyInvestmentView: View {
    @State private var monthlyInvestmentValue: Double = 0

    var body: some View {
        ZStack{
                RoundedRectangle(cornerRadius: 15)
                .foregroundColor(Color.white)
                .frame(width: UIScreen.main.bounds.width*0.9, height: UIScreen.main.bounds.height*0.25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            VStack{
                Text("Qual será o seu investimento mensal?")
                    .font(Font.custom("Poppins-Bold", size: UIScreen.main.bounds.height*0.018))
                    .multilineTextAlignment(.center)
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,
                           maxWidth: UIScreen.main.bounds.width*0.5,
                           minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,
                           maxHeight: UIScreen.main.bounds.height*0.06,
                           alignment: .center)
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        .frame(width: UIScreen.main.bounds.width*0.4, height: UIScreen.main.bounds.height*0.05, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Text("\(formatar(valor: monthlyInvestmentValue, tipo: true))").bold().fixedSize().foregroundColor(.white)
                }
                Slider(value: $monthlyInvestmentValue, in: 0...100000)
                    .padding(.horizontal,UIScreen.main.bounds.height*0.07)
                    .padding(.top,UIScreen.main.bounds.width*0.01)
                    .padding(.bottom,UIScreen.main.bounds.width*0.015)
                HStack{
                    Text("R$100").font(Font.custom("Poppins-Regular", size: UIScreen.main.bounds.height*0.013))
                        .foregroundColor(.gray)
                        .frame(width: UIScreen.main.bounds.width*0.2,
                               height: UIScreen.main.bounds.height*0.01,
                               alignment: .leading)
                        .padding(.leading,UIScreen.main.bounds.width*0.15)
                    Spacer()
                    Text("R$100.000").font(Font.custom("Poppins-Regular", size: UIScreen.main.bounds.height*0.013))
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

struct MonthlyInvestmentView_Previews: PreviewProvider {
    static var previews: some View {
        MonthlyInvestmentView()
    }
}

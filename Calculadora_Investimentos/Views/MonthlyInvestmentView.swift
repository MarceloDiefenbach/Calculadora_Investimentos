//
//  MonthlyInvestmentView.swift
//  Calculadora_Investimentos
//
//  Created by Marcelo Diefenbach on 24/05/21.
//

import SwiftUI

struct MonthlyInvestmentView: View {
    @Binding var monthlyInvestmentValue: Double

    var body: some View {
        ZStack{
            Rectangle().foregroundColor(Color.init("BgBlack")).ignoresSafeArea()
                RoundedRectangle(cornerRadius: UIScreen.main.bounds.height*0.015)
                .foregroundColor(Color.white)
                .frame(width: UIScreen.main.bounds.width*0.9, height: UIScreen.main.bounds.height*0.18, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            VStack{
                HStack{
                    Text("""
                        Você investirá qual
                        valor por mês?
                        """)
                        .foregroundColor(Color.init("BgBlack"))
                        .font(Font.custom("Poppins-Bold", size: UIScreen.main.bounds.height*0.015))
                        .multilineTextAlignment(.leading)
                        Spacer()
                    ZStack{
                        RoundedRectangle(cornerRadius: UIScreen.main.bounds.height*0.015)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                            .frame(width: UIScreen.main.bounds.width*0.35, height: UIScreen.main.bounds.height*0.04, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        Text("\(formatar(valor: monthlyInvestmentValue, tipo: true))").foregroundColor(Color.white)
                            .font(Font.custom("Poppins-Medium", size: UIScreen.main.bounds.height*0.02))
                    }
                }.padding(.horizontal,UIScreen.main.bounds.height*0.05)
                Slider(value: $monthlyInvestmentValue, in: 0.01...10000)
                    .padding(.horizontal,UIScreen.main.bounds.height*0.05)
                    .padding(.top,UIScreen.main.bounds.width*0.01)
                    .padding(.bottom,UIScreen.main.bounds.width*0.015)
                HStack{
                    Text("R$0.01").font(Font.custom("Poppins-Regular", size: UIScreen.main.bounds.height*0.013))
                        .foregroundColor(.gray)
                        .frame(width: UIScreen.main.bounds.width*0.2,
                               height: UIScreen.main.bounds.height*0.01,
                               alignment: .leading)
                    Spacer()
                    Text("R$10.000").font(Font.custom("Poppins-Regular", size: UIScreen.main.bounds.height*0.013))
                        .foregroundColor(.gray)
                        .frame(width: UIScreen.main.bounds.width*0.2,
                               height: UIScreen.main.bounds.height*0.01,
                               alignment: .trailing)
                }.padding(.horizontal,UIScreen.main.bounds.width*0.12)
            }
        }
    }
}

//struct MonthlyInvestmentView_Previews: PreviewProvider {
//    static var previews: some View {
//        MonthlyInvestmentView()
//    }
//}

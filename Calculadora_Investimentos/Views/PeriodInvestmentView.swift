//
//  PriodInvestment.swift
//  Calculadora_Investimentos
//
//  Created by Marcelo Diefenbach on 24/05/21.
//

import SwiftUI

struct PeriodInvestmentView: View {
    @Binding var periodInvestment: Double
    
    var body: some View {
        ZStack{
            Rectangle().foregroundColor(Color.init("BgBlack")).ignoresSafeArea()
                RoundedRectangle(cornerRadius: UIScreen.main.bounds.height*0.015)
                .foregroundColor(Color.white)
                .frame(width: UIScreen.main.bounds.width*0.9, height: UIScreen.main.bounds.height*0.18, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            VStack{
                HStack{
                    Text("Por quanto tempo você fará este investimento?")
                        .foregroundColor(Color.init("BgBlack"))
                        .font(Font.custom("Poppins-Bold", size: UIScreen.main.bounds.height*0.015))
                        .multilineTextAlignment(.leading)
                        Spacer()
                    ZStack{
                        RoundedRectangle(cornerRadius: UIScreen.main.bounds.height*0.015)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                            .frame(width: UIScreen.main.bounds.width*0.35, height: UIScreen.main.bounds.height*0.04, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        if( periodInvestment == 1 ){
                            Text("\(formatar(valor: periodInvestment, tipo: false)) mês").foregroundColor(Color.white)
                                .font(Font.custom("Poppins-Medium", size: UIScreen.main.bounds.height*0.02))
                        } else {
                            Text("\(formatar(valor: periodInvestment, tipo: false)) meses").foregroundColor(Color.white)
                                .font(Font.custom("Poppins-Medium", size: UIScreen.main.bounds.height*0.02))
                        }
                    }
                }.padding(.horizontal,UIScreen.main.bounds.height*0.05)
                Slider(value: $periodInvestment, in: 1...100, step: 1)
                    .padding(.horizontal,UIScreen.main.bounds.height*0.05)
                    .padding(.top,UIScreen.main.bounds.width*0.01)
                    .padding(.bottom,UIScreen.main.bounds.width*0.015)
                HStack{
                    Text("1").font(Font.custom("Poppins-Regular", size: UIScreen.main.bounds.height*0.013))
                        .foregroundColor(.gray)
                        .frame(width: UIScreen.main.bounds.width*0.2,
                               height: UIScreen.main.bounds.height*0.01,
                               alignment: .leading)
                    Spacer()
                    Text("100").font(Font.custom("Poppins-Regular", size: UIScreen.main.bounds.height*0.013))
                        .foregroundColor(.gray)
                        .frame(width: UIScreen.main.bounds.width*0.2,
                               height: UIScreen.main.bounds.height*0.01,
                               alignment: .trailing)
                }.padding(.horizontal,UIScreen.main.bounds.width*0.12)
            }
        }
    }
}

//struct PeriodInvestmentView_Previews: PreviewProvider {
//    static var previews: some View {
//        PeriodInvestmentView()
//    }
//}

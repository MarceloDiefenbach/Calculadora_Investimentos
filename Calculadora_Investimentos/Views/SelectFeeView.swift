//
//  SelectFeeView.swift
//  Calculadora_Investimentos
//
//  Created by Marcelo Diefenbach on 25/05/21.
//

import SwiftUI

struct SelectFeeView: View {
    @Binding var feeInvestment: Double

    var body: some View {
        ZStack{
            Rectangle().foregroundColor(Color.init("BgBlack")).ignoresSafeArea()
                RoundedRectangle(cornerRadius: UIScreen.main.bounds.height*0.015)
                .foregroundColor(Color.white)
                .frame(width: UIScreen.main.bounds.width*0.9, height: UIScreen.main.bounds.height*0.18, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            VStack{
                HStack{
                    Text("Qual o rendimento de sua aplicação?")
                        .frame(width: UIScreen.main.bounds.width*0.35, height: UIScreen.main.bounds.height*0.05, alignment: .leading)
                        .foregroundColor(Color.init("BgBlack"))
                        .font(Font.custom("Poppins-Bold", size: UIScreen.main.bounds.height*0.015))
                        .multilineTextAlignment(.leading)
                        .padding(.leading, UIScreen.main.bounds.height*0.01)
                        Spacer()
                    ZStack{
                        RoundedRectangle(cornerRadius: UIScreen.main.bounds.height*0.015)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                            .frame(width: UIScreen.main.bounds.width*0.35, height: UIScreen.main.bounds.height*0.04, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        Text("\(formatar(valor: feeInvestment, tipo: false))% ao ano").foregroundColor(Color.white)
                            .font(Font.custom("Poppins-Medium", size: UIScreen.main.bounds.height*0.02))
                    }
                }.padding(.horizontal,UIScreen.main.bounds.height*0.05)
                Slider(value: $feeInvestment, in: 0...20, step: 1)
                    .padding(.horizontal,UIScreen.main.bounds.height*0.05)
                    .padding(.top,UIScreen.main.bounds.width*0.01)
                    .padding(.bottom,UIScreen.main.bounds.width*0.015)
                HStack{
                    Text("0.01%").font(Font.custom("Poppins-Regular", size: UIScreen.main.bounds.height*0.013))
                        .foregroundColor(.gray)
                        .frame(width: UIScreen.main.bounds.width*0.2,
                               height: UIScreen.main.bounds.height*0.005,
                               alignment: .leading)
                    Spacer()
                    Text("20%").font(Font.custom("Poppins-Regular", size: UIScreen.main.bounds.height*0.013))
                        .foregroundColor(.gray)
                        .frame(width: UIScreen.main.bounds.width*0.2,
                               height: UIScreen.main.bounds.height*0.005,
                               alignment: .trailing)
                }.padding(.horizontal,UIScreen.main.bounds.width*0.12)
            }
        }
    }
}

//struct SelectFeeView_Previews: PreviewProvider {
//    static var previews: some View {
//        SelectFeeView()
//    }
//}

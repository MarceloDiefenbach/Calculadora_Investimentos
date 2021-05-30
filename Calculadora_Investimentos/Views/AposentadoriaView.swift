//
//  AposentadoriaView.swift
//  Calculadora_Investimentos
//
//  Created by Marcelo Diefenbach on 28/05/21.
//

import SwiftUI

struct AposentadoriaView: View {
    @State var idadeAposentar: Double = 1
    @State var valorAposentadoria: Double = 1000
    @State var totalAcumulado: Double = 0
    
    var body: some View {
        ZStack (alignment: Alignment.bottom){
            Rectangle().foregroundColor(Color.init("BgBlack")).ignoresSafeArea()
            VStack {
                Spacer()
                HStack {
                    Text("""
Calcular
aposentadoria
""")
                        .frame(width: UIScreen.main.bounds.width*0.7, alignment: .leading)
                        .foregroundColor(Color.white)
                        .font(Font.custom("Poppins-Bold", size: UIScreen.main.bounds.height*0.04))
                    Spacer()
                }.padding(.leading, UIScreen.main.bounds.height*0.04)
                ZStack {
                    RoundedRectangle(cornerRadius: UIScreen.main.bounds.height*0.015)
                        .foregroundColor(Color.white)
                        .frame(width: UIScreen.main.bounds.width*0.9, height: UIScreen.main.bounds.height*0.18, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    VStack{
                        HStack{
                            Text("""
                                Qual salário de
                                aposentadoria esperado?
                                """)
                                .foregroundColor(Color.init("BgBlack"))
                                .font(Font.custom("Poppins-Bold", size: UIScreen.main.bounds.height*0.015))
                            Spacer()
                            ZStack{
                                RoundedRectangle(cornerRadius: UIScreen.main.bounds.height*0.015)
                                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                                    .frame(width: UIScreen.main.bounds.width*0.35, height: UIScreen.main.bounds.height*0.04, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                Text("\(formatar(valor: valorAposentadoria, tipo: true)) ").foregroundColor(Color.white)
                                    .font(Font.custom("Poppins-Medium", size: UIScreen.main.bounds.height*0.02))
                            }
                        }.padding(.horizontal,UIScreen.main.bounds.height*0.05)
                        Slider(value: $valorAposentadoria, in: 1000...10000, step: 100)
                            .padding(.horizontal,UIScreen.main.bounds.height*0.05)
                            .padding(.top,UIScreen.main.bounds.width*0.01)
                            .padding(.bottom,UIScreen.main.bounds.width*0.015)
                        HStack{
                            Text("R$1.000").font(Font.custom("Poppins-Regular", size: UIScreen.main.bounds.height*0.013))
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
                }.padding(.bottom,UIScreen.main.bounds.width*0.01)
                ZStack {
                    RoundedRectangle(cornerRadius: UIScreen.main.bounds.height*0.015)
                        .foregroundColor(Color.blue)
                        .frame(width: UIScreen.main.bounds.width*0.9, height: UIScreen.main.bounds.height*0.17, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    VStack (alignment: .center){
                            Text("""
                                Para ter este salário você
                                precisa acumular investido:
                                """)
                                .foregroundColor(Color.white)
                                .font(Font.custom("Poppins-Bold", size: UIScreen.main.bounds.height*0.019))
                                .multilineTextAlignment(.center)
                            ZStack{
                                RoundedRectangle(cornerRadius: UIScreen.main.bounds.height*0.015)
                                    .foregroundColor(.white)
                                    .frame(width: UIScreen.main.bounds.width*0.5, height: UIScreen.main.bounds.height*0.04, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                Text("\(formatar(valor: calculaAposentadoria(valorAposentadoria: Int(valorAposentadoria)), tipo: true)) ").foregroundColor(Color.blue)
                                    .font(Font.custom("Poppins-Medium", size: UIScreen.main.bounds.height*0.02))
                            }
                        
                    }.padding(.bottom, UIScreen.main.bounds.height*0.01)
                }.padding(.bottom, UIScreen.main.bounds.height*0.06)
            }
        }
        
    }
}

struct AposentadoriaView_Previews: PreviewProvider {
    static var previews: some View {
        AposentadoriaView()
    }
}


func calculaAposentadoria(valorAposentadoria: Int) -> Double {
    
    return Double(valorAposentadoria) / 0.004

}


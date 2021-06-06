//
//  InitialView.swift
//  Calculadora_Investimentos
//
//  Created by Marcelo Diefenbach on 25/05/21.
//

import SwiftUI

struct InitialView: View {

    var body: some View {
        NavigationView{
            ZStack (alignment: Alignment.bottom) {
                Rectangle().foregroundColor(Color.init("BgBlack")).ignoresSafeArea()
                VStack {
                    HStack {
                        Text("""
Soluções
para sua
organização
financeira
""")
                            .frame(width: UIScreen.main.bounds.width*0.6, height: UIScreen.main.bounds.height*0.26, alignment: .leading)
                            .foregroundColor(Color.white)
                            .font(Font.custom("Poppins-Bold", size: UIScreen.main.bounds.height*0.04))
                        Spacer()
                    }.padding(.leading, UIScreen.main.bounds.height*0.04)
                    
                    NavigationLink(destination: InputView()) {
                        ZStack {
                            RoundedRectangle(cornerRadius: UIScreen.main.bounds.height*0.015)
                                .foregroundColor(.blue)
                                .frame(width: UIScreen.main.bounds.width*0.9, height: UIScreen.main.bounds.height*0.07, alignment: .center)
                            HStack {
                                Text("Calcular Investimentos")
                                    .foregroundColor(.white)
                                    .font(Font.custom("Poppins-Bold", size: UIScreen.main.bounds.height*0.02))
                                    .padding(.leading, UIScreen.main.bounds.width*0.1)
                                Spacer()
                            }
                        }
                    }.navigationTitle("Início")
                    .navigationBarHidden(true)
                    
                    NavigationLink(destination: MoneyConvertView()) {
                        ZStack{
                            RoundedRectangle(cornerRadius: UIScreen.main.bounds.height*0.015)
                                .foregroundColor(.white)
                                .frame(width: UIScreen.main.bounds.width*0.9, height: UIScreen.main.bounds.height*0.07, alignment: .center)
                            HStack{
                                Text("Converter câmbio")
                                    .foregroundColor(Color.init("BgBlack"))
                                    .font(Font.custom("Poppins-Bold", size: UIScreen.main.bounds.height*0.02))
                                    .padding(.leading, UIScreen.main.bounds.width*0.1)
                                Spacer()
                            }
                        }
                    }.navigationTitle("Início")
                    .navigationBarHidden(true)
                    
                    NavigationLink(destination: AposentadoriaView()) {
                        ZStack{
                            RoundedRectangle(cornerRadius: UIScreen.main.bounds.height*0.015)
                                .foregroundColor(.blue)
                                .frame(width: UIScreen.main.bounds.width*0.9, height: UIScreen.main.bounds.height*0.07, alignment: .center)
                            HStack{
                                Text("Calculadora de aposentadora")
                                    .foregroundColor(.white)
                                    .font(Font.custom("Poppins-Bold", size: UIScreen.main.bounds.height*0.02))
                                    .padding(.leading, UIScreen.main.bounds.width*0.1)
                                Spacer()
                            }
                        }
                    }.navigationTitle("Início")
                    .navigationBarHidden(true)
                    
                }.padding(.bottom, UIScreen.main.bounds.height*0.06)
            }
        }.colorScheme(.dark)
    }
}

struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView()
    }
}

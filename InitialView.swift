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
            ZStack{
                Rectangle().foregroundColor(Color.init("BgBlack")).ignoresSafeArea()
                VStack{
                    Spacer()
                    HStack{
                        Text("Soluções para sua organização financeira")
                            .frame(width: UIScreen.main.bounds.width*0.6, height: UIScreen.main.bounds.height*0.25, alignment: .leading)
                            .foregroundColor(Color.white)
                            .font(Font.custom("Poppins-Bold", size: UIScreen.main.bounds.height*0.04))
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }.padding(.leading, UIScreen.main.bounds.height*0.04)
                    
                    NavigationLink(destination: ContentView()) {
                        ZStack{
                            RoundedRectangle(cornerRadius: UIScreen.main.bounds.height*0.015)
                                .foregroundColor(.blue)
                                .frame(width: UIScreen.main.bounds.width*0.9, height: UIScreen.main.bounds.height*0.07, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            HStack{
                                Text("Calcular Investimentos")
                                    .foregroundColor(.white)
                                    .font(Font.custom("Poppins-Bold", size: UIScreen.main.bounds.height*0.02))
                                    .padding(.leading, UIScreen.main.bounds.width*0.1)
                                Spacer()
                            }
                        }
                    }
                    
                    NavigationLink(destination: ContentView()) {
                        ZStack{
                            RoundedRectangle(cornerRadius: UIScreen.main.bounds.height*0.015)
                                .foregroundColor(.white)
                                .frame(width: UIScreen.main.bounds.width*0.9, height: UIScreen.main.bounds.height*0.07, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            HStack{
                                Text("Calcular Aposentadora")
                                    .foregroundColor(Color.init("BgBlack"))
                                    .font(Font.custom("Poppins-Bold", size: UIScreen.main.bounds.height*0.02))
                                    .padding(.leading, UIScreen.main.bounds.width*0.1)
                                Spacer()
                            }
                        }
                    }
                    
                    NavigationLink(destination: ContentView()) {
                        ZStack{
                            RoundedRectangle(cornerRadius: UIScreen.main.bounds.height*0.015)
                                .foregroundColor(.blue)
                                .frame(width: UIScreen.main.bounds.width*0.9, height: UIScreen.main.bounds.height*0.07, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            HStack{
                                Text("Calcular Financiamento")
                                    .foregroundColor(.white)
                                    .font(Font.custom("Poppins-Bold", size: UIScreen.main.bounds.height*0.02))
                                    .padding(.leading, UIScreen.main.bounds.width*0.1)
                                Spacer()
                            }
                        }
                    }
                }.padding(.bottom, UIScreen.main.bounds.height*0.08)
            }
        }
    }
}

struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView()
    }
}

//
//  MoneyConvertView.swift
//  Calculadora_Investimentos
//
//  Created by Marcelo Diefenbach on 27/05/21.
//

import SwiftUI

struct MoneyConvertView: View {
    
    @State private var valor: Double = 0
    @State private var tipo1: String = "US ($)"
    @State private var tipo2: String = "BRL (R$)"
    @State private var selectedFlavor = String()

    @State private var xValorViewToda: Int = 0
    @State private var xValorPopUp: CGFloat = UIScreen.main.bounds.height*0.75
    @State private var xValorPopUp02: CGFloat = UIScreen.main.bounds.height*0.75

    var body: some View {
        ZStack{
            Rectangle().foregroundColor(Color.init("BgBlack")).ignoresSafeArea()
            VStack{
                HStack{
                    Text("""
Calcular
câmbio de
moedas
""")
                        .frame(width: UIScreen.main.bounds.width*0.6, alignment: .leading)
                        .foregroundColor(Color.white)
                        .font(Font.custom("Poppins-Bold", size: UIScreen.main.bounds.height*0.04))
                    Spacer()
                }.padding(.leading, UIScreen.main.bounds.height*0.025)
                ZStack{
                    HStack{
                        RoundedRectangle(cornerRadius: UIScreen.main.bounds.height*0.015)
                            .strokeBorder(Color.white, lineWidth: 2)
                            .frame(width: UIScreen.main.bounds.width*0.9, height: UIScreen.main.bounds.height*0.1)
                            .foregroundColor(.clear)
                    }
                    HStack{
                        Text("De")
                            .font(Font.custom("Poppins-Bold", size: UIScreen.main.bounds.height*0.018))
                            .foregroundColor(.white)
                        ZStack {
                            RoundedRectangle(cornerRadius: UIScreen.main.bounds.height*0.015)
                                .foregroundColor(.blue)
                                .frame(width: UIScreen.main.bounds.width*0.25, height: UIScreen.main.bounds.height*0.05)
                            Text("\(tipo1)")
                                .font(Font.custom("Poppins-Regular", size: UIScreen.main.bounds.height*0.018))
                                .foregroundColor(.white)
                                .onTapGesture {
                                    xValorPopUp = UIScreen.main.bounds.height*0.28
                                }
                        }.padding(.trailing, UIScreen.main.bounds.height*0.02)
                        Text("Para")
                            .font(Font.custom("Poppins-Bold", size: UIScreen.main.bounds.height*0.018))
                            .foregroundColor(.white)
                        ZStack {
                            RoundedRectangle(cornerRadius: UIScreen.main.bounds.height*0.015)
                                .foregroundColor(.blue)
                                .frame(width: UIScreen.main.bounds.width*0.25, height: UIScreen.main.bounds.height*0.05)
                            Text("\(tipo2)")
                                .font(Font.custom("Poppins-Regular", size: UIScreen.main.bounds.height*0.018))
                                .foregroundColor(.white)
                                .onTapGesture {
                                    xValorPopUp02 = UIScreen.main.bounds.height*0.28
                                }
                        }
                    }
                }
                ZStack{
                    RoundedRectangle(cornerRadius: UIScreen.main.bounds.height*0.015)
                    .foregroundColor(Color.white)
                    .frame(width: UIScreen.main.bounds.width*0.9, height: UIScreen.main.bounds.height*0.18, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    VStack{
                        Slider(value: $valor, in: 1...100)
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
                        HStack{
                            ZStack{
                                RoundedRectangle(cornerRadius: UIScreen.main.bounds.height*0.015)
                                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                                    .frame(width: UIScreen.main.bounds.width*0.35, height: UIScreen.main.bounds.height*0.04, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    Text("R$ \(formatar(valor: valor, tipo: false))").foregroundColor(Color.white)
                                        .font(Font.custom("Poppins-Medium", size: UIScreen.main.bounds.height*0.02))
                            }
                            Text(">")
                                .foregroundColor(Color.init("BgBlack"))
                                .font(Font.custom("Poppins-Bold", size: UIScreen.main.bounds.height*0.015))
                                .multilineTextAlignment(.leading)
                            ZStack{
                                RoundedRectangle(cornerRadius: UIScreen.main.bounds.height*0.015)
                                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                                    .frame(width: UIScreen.main.bounds.width*0.35, height: UIScreen.main.bounds.height*0.04, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    Text("$ \(formatar(valor: valor, tipo: false))").foregroundColor(Color.white)
                                        .font(Font.custom("Poppins-Medium", size: UIScreen.main.bounds.height*0.02))

                            }
                        }.padding(.horizontal,UIScreen.main.bounds.height*0.05)
                        .padding(.top, UIScreen.main.bounds.width*0.03)
                    }
                }.padding(.top, UIScreen.main.bounds.width*0.01)
            }.padding(.top, UIScreen.main.bounds.width*0.45)
            //.offset(y: CGFloat(xValorViewToda)).animation(.spring(response: 0.8, dampingFraction: 0.8, blendDuration: 0))
            
            // picker de primeiro tipo de moeda
            ZStack (alignment: Alignment.top) {
                RoundedRectangle(cornerRadius: 12).foregroundColor(Color.blue).frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*0.5, alignment: .center)
                HStack(alignment: .top){
                    VStack{
                        ZStack{
                            RoundedRectangle(cornerRadius: 12).foregroundColor(Color.init("BgBlack")).frame(width: UIScreen.main.bounds.width*0.9, height: UIScreen.main.bounds.height*0.2, alignment: .center)
                            Picker("Flavor", selection: $tipo1) {
                                Text("US ($)").tag("US ($)")
                                Text("BRL (R$)").tag("BRL (R$)")
                                Text("Outro").tag("3")
                            }.colorScheme(.dark)
                        }.frame(width: UIScreen.main.bounds.width*0.9, alignment: .top)
                        ZStack{
                            RoundedRectangle(cornerRadius: 12).foregroundColor(Color.white).frame(width: UIScreen.main.bounds.width*0.9, height: UIScreen.main.bounds.height*0.06, alignment: .center)
                            Text("Confirmar")
                                .foregroundColor(Color.init("BgBlack"))
                                .font(Font.custom("Poppins-Bold", size: UIScreen.main.bounds.height*0.02))
                                
                        }.padding(.top, -20)
                        .onTapGesture {
                            xValorPopUp = UIScreen.main.bounds.height*0.75
                        }
                    }
                }
            }.offset(y: CGFloat(xValorPopUp)).animation(.spring(response: 0.8, dampingFraction: 0.8, blendDuration: 0))
            
            ZStack (alignment: Alignment.top) {
                RoundedRectangle(cornerRadius: 12).foregroundColor(Color.blue).frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*0.5, alignment: .center)
                HStack(alignment: .top){
                    VStack{
                        ZStack{
                            RoundedRectangle(cornerRadius: 12).foregroundColor(Color.init("BgBlack")).frame(width: UIScreen.main.bounds.width*0.9, height: UIScreen.main.bounds.height*0.2, alignment: .center)
                            Picker("Flavor", selection: $tipo2) {
                                Text("US ($)").tag("US ($)")
                                Text("BRL (R$)").tag("BRL (R$)")
                                Text("Outro").tag("3")
                            }.colorScheme(.dark)
                        }.frame(width: UIScreen.main.bounds.width*0.9, alignment: .top)
                        ZStack{
                            RoundedRectangle(cornerRadius: 12).foregroundColor(Color.white).frame(width: UIScreen.main.bounds.width*0.9, height: UIScreen.main.bounds.height*0.06, alignment: .center)
                            Text("Confirmar")
                                .foregroundColor(Color.init("BgBlack"))
                                .font(Font.custom("Poppins-Bold", size: UIScreen.main.bounds.height*0.02))
                                
                        }.padding(.top, -20)
                        .onTapGesture {
                            xValorPopUp02 = UIScreen.main.bounds.height*0.75
                        }
                    }
                }
            }.offset(y: CGFloat(xValorPopUp02)).animation(.spring(response: 0.8, dampingFraction: 0.8, blendDuration: 0))
        }
    }
}

struct MoneyConvertView_Previews: PreviewProvider {
    static var previews: some View {
        MoneyConvertView()
    }
}

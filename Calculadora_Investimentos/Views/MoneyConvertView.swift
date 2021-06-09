//
//  MoneyConvertView.swift
//  Calculadora_Investimentos
//
//  Created by Marcelo Diefenbach on 27/05/21.
//

import SwiftUI

struct MoneyConvertView: View {
    
    @ObservedObject private var quoteListVM = QuoteListViewModel(exchange: "USD-BRL")
    
    @State private var valor: Double = 0
    @State private var tipo1: String = "USD"
    @State private var tipo2: String = "BRL"
    @State private var selectedFlavor = String()

    
    
    //@State private var xValorViewToda: Int = 0
    @State private var xValorPopUp: CGFloat = UIScreen.main.bounds.height*0.75
    @State private var xValorPopUp02: CGFloat = UIScreen.main.bounds.height*0.75

    var body: some View {
        ZStack (alignment: Alignment.bottom){
            Rectangle().foregroundColor(Color.init("BgBlack")).ignoresSafeArea()
            VStack {
                HStack {
                    Text("""
Calcular
câmbio de
moedas
""")
                        .frame(width: UIScreen.main.bounds.width*0.6, alignment: .leading)
                        .foregroundColor(Color.white)
                        .font(Font.custom("Poppins-Bold", size: UIScreen.main.bounds.height*0.04))
                    Spacer()
                }.padding(.leading, UIScreen.main.bounds.height*0.04)
                ZStack {
                    HStack {
                        RoundedRectangle(cornerRadius: UIScreen.main.bounds.height*0.015)
                            .strokeBorder(Color.white, lineWidth: 2)
                            .frame(width: UIScreen.main.bounds.width*0.9, height: UIScreen.main.bounds.height*0.14)
                            .foregroundColor(.clear)
                    }
                    VStack{
                        HStack {
                            Text("De")
                                .font(Font.custom("Poppins-Bold", size: UIScreen.main.bounds.height*0.018))
                                .foregroundColor(.white)
                            ZStack {
                                RoundedRectangle(cornerRadius: UIScreen.main.bounds.height*0.015)
                                    .foregroundColor(.blue)
                                    .frame(width: UIScreen.main.bounds.width*0.25, height: UIScreen.main.bounds.height*0.05)
                                HStack{
                                    Text("\(tipo1)")
                                        .font(Font.custom("Poppins-Regular", size: UIScreen.main.bounds.height*0.018))
                                        .foregroundColor(.white)
                                    Image("Options_Down").resizable().aspectRatio(contentMode: .fit).frame(width: UIScreen.main.bounds.width*0.018)
                                }
                            }.padding(.trailing, UIScreen.main.bounds.height*0.02)
                            .onTapGesture {
                                xValorPopUp = UIScreen.main.bounds.height*0.1
                            }
                            Text("Para")
                                .font(Font.custom("Poppins-Bold", size: UIScreen.main.bounds.height*0.018))
                                .foregroundColor(.white)
                            ZStack {
                                RoundedRectangle(cornerRadius: UIScreen.main.bounds.height*0.015)
                                    .foregroundColor(.blue)
                                    .frame(width: UIScreen.main.bounds.width*0.25, height: UIScreen.main.bounds.height*0.05)
                                HStack{
                                    Text("\(tipo2)")
                                        .font(Font.custom("Poppins-Regular", size: UIScreen.main.bounds.height*0.018))
                                        .foregroundColor(.white)
                                    Image("Options_Down").resizable().aspectRatio(contentMode: .fit).frame(width: UIScreen.main.bounds.width*0.018)
                                }
                            }
                            .onTapGesture {
                                xValorPopUp02 = UIScreen.main.bounds.height*0.1
                            }
                        }.padding(.top, UIScreen.main.bounds.height*0.01)
                        HStack {
                            Text("Cotação atual: \(tipo2) \(formatarCotacao(valor: quoteListVM.quotes.first?.bid ?? 1, tipo: false)) ")
                                .font(Font.custom("Poppins-Regular", size: UIScreen.main.bounds.height*0.018))
                                .foregroundColor(.white)
                        }.padding(.top, UIScreen.main.bounds.height*0.005)
                    }
                }
                ZStack{
                    RoundedRectangle(cornerRadius: UIScreen.main.bounds.height*0.015)
                    .foregroundColor(Color.white)
                    .frame(width: UIScreen.main.bounds.width*0.9, height: UIScreen.main.bounds.height*0.21, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    VStack {
                        Slider(value: $valor, in: 0...10000, step: 10)
                            .padding(.horizontal,UIScreen.main.bounds.height*0.05)
                            //.padding(.top,UIScreen.main.bounds.width*0.00)
                            .padding(.bottom,UIScreen.main.bounds.width*0.015)
                        HStack {
                            Text("\(tipo1) 1").font(Font.custom("Poppins-Regular", size: UIScreen.main.bounds.height*0.013))
                                .foregroundColor(.gray)
                                .frame(width: UIScreen.main.bounds.width*0.2,
                                       height: UIScreen.main.bounds.height*0.01,
                                       alignment: .leading)
                            Spacer()
                            Text("\(tipo1) 10.000").font(Font.custom("Poppins-Regular", size: UIScreen.main.bounds.height*0.013))
                                .foregroundColor(.gray)
                                .frame(width: UIScreen.main.bounds.width*0.2,
                                       height: UIScreen.main.bounds.height*0.01,
                                       alignment: .trailing)
                        }.padding(.horizontal, UIScreen.main.bounds.width*0.1)
                        .padding(.bottom, UIScreen.main.bounds.height*0.025)
                        HStack {
                            ZStack {
                                Text("\(tipo1) \(formatarCotacao(valor: valor, tipo: false)) =").foregroundColor(Color.init("BgBlack"))
                                    .font(Font.custom("Poppins-Medium", size: UIScreen.main.bounds.height*0.018))

                            }
                            ZStack {
                                RoundedRectangle(cornerRadius: UIScreen.main.bounds.height*0.015)
                                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                                    .frame(width: UIScreen.main.bounds.width*0.4, height: UIScreen.main.bounds.height*0.04, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .overlay(
                                        Text("\(tipo2) \(formatarCotacao(valor: valor*(quoteListVM.quotes.first?.bid ?? 1), tipo: false))").foregroundColor(Color.white)
                                                .font(Font.custom("Poppins-Medium", size: UIScreen.main.bounds.height*0.018))
                                    )
                            }
                        }
                    }
                }.padding(.top, UIScreen.main.bounds.height*0.01)
            }.padding(.bottom, UIScreen.main.bounds.height*0.06)
            //.offset(y: CGFloat(xValorViewToda)).animation(.spring(response: 0.8, dampingFraction: 0.8, blendDuration: 0))
            
            // picker de primeiro tipo de moeda
            ZStack (alignment: Alignment.top) {
                RoundedRectangle(cornerRadius: 12).foregroundColor(Color.blue).frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*0.5, alignment: .center)
                HStack(alignment: .top){
                    VStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 12).foregroundColor(Color.init("BgBlack")).frame(width: UIScreen.main.bounds.width*0.9, height: UIScreen.main.bounds.height*0.2, alignment: .center)
                            Picker("Flavor", selection: $tipo1) {
                                Text("USD").tag("USD")
                                Text("AUD").tag("AUD")
                                Text("BRL").tag("BRL")
                                Text("EUR").tag("EUR")
                                Text("BTC").tag("BTC")
                            }.colorScheme(.dark)
                        }.frame(width: UIScreen.main.bounds.width*0.9, alignment: .top)
                        ZStack {
                            RoundedRectangle(cornerRadius: 12).foregroundColor(Color.white).frame(width: UIScreen.main.bounds.width*0.9, height: UIScreen.main.bounds.height*0.06, alignment: .center)
                            Text("Confirmar")
                                .foregroundColor(Color.init("BgBlack"))
                                .font(Font.custom("Poppins-Bold", size: UIScreen.main.bounds.height*0.02))
                                
                        }.padding(.top, -20)
                        .onTapGesture {
                            xValorPopUp = UIScreen.main.bounds.height*0.75
                            quoteListVM.update(exchange: "\(tipo1)-\(tipo2)")
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
                                Text("USD").tag("USD")
                                Text("AUD").tag("AUD")
                                Text("BRL").tag("BRL")
                                Text("EUR").tag("EUR")
                                Text("BTC").tag("BTC")
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
                            quoteListVM.update(exchange: "\(tipo1)-\(tipo2)")
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

func formatarCotacao(valor: Double, tipo: Bool) -> String {
    let formatter = NumberFormatter()
    formatter.locale = Locale.current // Change this to another locale if you want to force a specific locale, otherwise this is redundant as the current locale is the default already
    formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        formatter.currencySymbol = ""
    
    if let formattedTipAmount = formatter.string(from: valor as NSNumber) {
        return "\(formattedTipAmount)"
    }
    return ""
}

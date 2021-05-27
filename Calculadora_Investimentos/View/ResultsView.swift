//
//  ResultsView.swift
//  Calculadora_Investimentos
//
//  Created by João Brentano on 24/05/21.
//

import SwiftUI

struct ResultsView: View {
    @State private var meses: Int = 10
    
    var initialInvestment: Double
    var monthlyInvestment: Double
    var anualFee: Double
    var periodInvestment: Double

    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(Color.init("BgBlack"))
            VStack {
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: UIScreen.main.bounds.height*0.015)
                            .foregroundColor(.white)
                        VStack {
                            Text("Resultados")
                                .font(Font.custom("Poppins-Bold", size: UIScreen.main.bounds.height*0.025))
                                .foregroundColor(Color.init("BgBlack"))
                            HStack {
                                Text("Valor investido:")
                                    .font(Font.custom("Poppins-Regular", size: UIScreen.main.bounds.height*0.018))
                                    .foregroundColor(Color.init("BgBlack"))
                                Spacer()
                                ZStack {
                                    RoundedRectangle(cornerRadius: UIScreen.main.bounds.height*0.015)
                                        .foregroundColor(.blue)
                                        .frame(width: UIScreen.main.bounds.width*0.4, height: UIScreen.main.bounds.height*0.05)
                                    Text("\(formatar(valor: initialInvestment+(monthlyInvestment*periodInvestment), tipo: true))")
                                        .font(Font.custom("Poppins-Regular", size: UIScreen.main.bounds.height*0.018))
                                        .foregroundColor(.white)
                                }
                            }
                            HStack {
                                Text("Juros recebido:")
                                    .font(Font.custom("Poppins-Regular", size: UIScreen.main.bounds.height*0.018))
                                    .foregroundColor(Color.init("BgBlack"))
                                Spacer()
                                ZStack {
                                    RoundedRectangle(cornerRadius: UIScreen.main.bounds.height*0.015)
                                        .foregroundColor(.blue)
                                        .frame(width: UIScreen.main.bounds.width*0.4, height: UIScreen.main.bounds.height*0.05)
                                    Text("\(formatar(valor: calculaRendimento(tempo: Int(periodInvestment), dinheiroInicial: initialInvestment, dinheiroMensal: monthlyInvestment, porcentagemAnual: anualFee)-(initialInvestment+(monthlyInvestment*periodInvestment)), tipo: true))")
                                        .font(Font.custom("Poppins-Regular", size: UIScreen.main.bounds.height*0.018))
                                        .foregroundColor(.white)
                                }
                            }
                            HStack {
                                Text("Valor total:")
                                    .font(Font.custom("Poppins-Regular", size: UIScreen.main.bounds.height*0.018))
                                    .foregroundColor(Color.init("BgBlack"))
                                Spacer()
                                ZStack {
                                    RoundedRectangle(cornerRadius: UIScreen.main.bounds.height*0.015)
                                        .foregroundColor(.blue)
                                        .frame(width: UIScreen.main.bounds.width*0.4, height: UIScreen.main.bounds.height*0.05)
                                    Text("\(formatar(valor: calculaRendimento(tempo: Int(periodInvestment), dinheiroInicial: initialInvestment, dinheiroMensal: monthlyInvestment, porcentagemAnual: anualFee), tipo: true))")
                                        .font(Font.custom("Poppins-Regular", size: UIScreen.main.bounds.height*0.018))
                                        .foregroundColor(.white)
                                }
                            }
                        }.padding(.horizontal, UIScreen.main.bounds.width*0.05)
                    }
                    .frame(width: UIScreen.main.bounds.width*0.9, height: UIScreen.main.bounds.height*0.3)
                }
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(.white)
                        VStack{
                            ScrollView(.vertical, showsIndicators: false){
                                let monthcalc: [Double] = calculaMeses(tempo: Int(periodInvestment), dinheiroInicial: initialInvestment, dinheiroMensal: monthlyInvestment, porcentagemAnual: anualFee)
                                ForEach (0..<monthcalc.count) { index in
                                    
                                    HStack {
                                        Text("Mês \(index+1)").font(Font.custom("Poppins-Regular", size: UIScreen.main.bounds.height*0.018))
                                            .foregroundColor(Color.init("BgBlack"))
                                        Spacer()
                                        Text("\(formatar(valor: monthcalc[index], tipo: true))").font(Font.custom("Poppins-Regular", size: UIScreen.main.bounds.height*0.018))
                                            .foregroundColor(Color.init("BgBlack"))
                                    }.padding(.horizontal, UIScreen.main.bounds.width*0.03)
                                    .padding(.vertical, UIScreen.main.bounds.height*0.006)
                                    Divider().padding(.horizontal, UIScreen.main.bounds.width*0.03)
                                }.padding(.top,UIScreen.main.bounds.height*0.014)
                            }.padding(.horizontal, UIScreen.main.bounds.width*0.02)
                        }
                    }.padding(.vertical,UIScreen.main.bounds.height*0.006)
                }.padding(.horizontal, UIScreen.main.bounds.width*0.05)
                Spacer()
            }.padding(.top, UIScreen.main.bounds.height*0.012)
        }
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(initialInvestment: 0, monthlyInvestment: 1, anualFee: 2, periodInvestment: 12)
    }
}

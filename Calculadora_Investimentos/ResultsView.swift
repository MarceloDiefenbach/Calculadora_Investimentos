//
//  ResultsView.swift
//  Calculadora_Investimentos
//
//  Created by João Brentano on 24/05/21.
//

import SwiftUI

struct ResultsView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(Color.init("BgBlack"))
            VStack {
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(.white)
                        VStack {
                            Text("Resultados")
                                .bold()
                            HStack {
                                Text("Valor investido:")
                                Spacer()
                                ZStack {
                                    RoundedRectangle(cornerRadius: 15)
                                        .foregroundColor(.blue)
                                    Text("R$500,00")
                                        .foregroundColor(.white)
                                }
                                .frame(width: UIScreen.main.bounds.width*0.3, height: UIScreen.main.bounds.height*0.05)
                            }
                            .padding(.horizontal, UIScreen.main.bounds.width*0.07)
                            HStack {
                                Text("Juros recebido:")
                                Spacer()
                                ZStack {
                                    RoundedRectangle(cornerRadius: 15)
                                        .foregroundColor(.blue)
                                    Text("R$500,00")
                                        .foregroundColor(.white)
                                }
                                .frame(width: UIScreen.main.bounds.width*0.3, height: UIScreen.main.bounds.height*0.05)
                            }
                            .padding(.horizontal, UIScreen.main.bounds.width*0.07)
                            HStack {
                                Text("Valor total:")
                                Spacer()
                                ZStack {
                                    RoundedRectangle(cornerRadius: 15)
                                        .foregroundColor(.blue)
                                    Text("R$500,00")
                                        .foregroundColor(.white)
                                }
                                .frame(width: UIScreen.main.bounds.width*0.3, height: UIScreen.main.bounds.height*0.05)
                            }
                            .padding(.horizontal, UIScreen.main.bounds.width*0.07)
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width*0.8, height: UIScreen.main.bounds.height*0.3)
                }
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(.white)
                        List {
                            HStack {
                                Text("Mês 1")
                                Spacer()
                                Text("R$100,00")
                            }
                            HStack {
                                Text("Mês 2")
                                Spacer()
                                Text("R$100,00")
                            }
                            HStack {
                                Text("Mês 3")
                                Spacer()
                                Text("R$100,00")
                            }
                            HStack {
                                Text("Mês 4")
                                Spacer()
                                Text("R$100,00")
                            }
                            HStack {
                                Text("Mês 5")
                                Spacer()
                                Text("R$100,00")
                            }
                            HStack {
                                Text("Mês 6")
                                Spacer()
                                Text("R$100,00")
                            }
                            HStack {
                                Text("Mês 7")
                                Spacer()
                                Text("R$100,00")
                            }
                            HStack {
                                Text("Mês 8")
                                Spacer()
                                Text("R$100,00")
                            }
                        }
                        .padding()
                    }
                    .frame(width: UIScreen.main.bounds.width*0.8, height: UIScreen.main.bounds.height*0.45)
                }
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(.blue)
                        VStack {
                            Text("Fazer nova simulação")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width*0.6, height: UIScreen.main.bounds.height*0.05)
                }
            }
        }
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView()
    }
}

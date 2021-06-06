//
//  ContentView.swift
//  Calculadora_Investimentos
//
//  Created by Marcelo Diefenbach on 24/05/21.
//

import SwiftUI

struct InputView: View {
    
    @State var initialInvestment: Double = 0
    @State var monthlyInvestment: Double = 0
    @State var anualFee: Double = 0
    @State var periodInvestment: Double = 0
    
    var body: some View {
        ZStack{
            Rectangle().foregroundColor(Color.init("BgBlack")).ignoresSafeArea()
            VStack{
                InitialInvestmentView(initialInvestment: $initialInvestment)
                MonthlyInvestmentView(monthlyInvestmentValue: $monthlyInvestment)
                SelectFeeView(feeInvestment: $anualFee)
                PeriodInvestmentView(periodInvestment: $periodInvestment)
                HStack{
                    NavigationLink(destination: ResultsView(initialInvestment: initialInvestment, monthlyInvestment: monthlyInvestment, anualFee: anualFee, periodInvestment: periodInvestment)) {
                        ZStack{
                            RoundedRectangle(cornerRadius: UIScreen.main.bounds.height*0.015)
                                .foregroundColor(.blue)
                                .frame(width: UIScreen.main.bounds.width*0.9, height: UIScreen.main.bounds.height*0.05, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            Text("Resultado completo")
                                .foregroundColor(.white)
                                .font(Font.custom("Poppins-Regular", size: UIScreen.main.bounds.height*0.015))
                        }
                    }
                }
                .padding(.bottom, UIScreen.main.bounds.height*0.006)
                Spacer()
            }.padding(.top, UIScreen.main.bounds.height*0.01)
        }.navigationTitle("Calcular")
        //.navigationBarHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        //ver aqui pra nao ficar o texto no meio da proxima tela
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView()
    }
}

func formatar(valor: Double, tipo: Bool) -> String {
    let formatter = NumberFormatter()
    formatter.locale = Locale.current // Change this to another locale if you want to force a specific locale, otherwise this is redundant as the current locale is the default already
    formatter.numberStyle = .currency
    if(tipo){
        formatter.maximumFractionDigits = 0
        formatter.currencySymbol = "R$"
    }else{
        formatter.maximumFractionDigits = 0
        formatter.currencySymbol = ""
    }
    
    if let formattedTipAmount = formatter.string(from: valor as NSNumber) {
        return "\(formattedTipAmount)"
    }
    return ""
}

func calculaRendimento(tempo: Int, dinheiroInicial: Double, dinheiroMensal: Double, porcentagemAnual: Double) -> Double {
    
    let porcentagemMensal: Double = pow(1+porcentagemAnual/100, 1/12)-1

    var resultado: Double = dinheiroInicial
    for _ in (0...tempo) {
        resultado = ((porcentagemMensal+1) * resultado) + dinheiroMensal
    }
    return resultado
}

func calculaMeses(tempo: Int, dinheiroInicial: Double, dinheiroMensal: Double, porcentagemAnual: Double) -> [Double] {
    
    var resultado: [Double] = []
    let porcentagemMensal: Double = pow(1+porcentagemAnual/100, 1/12) - 1
    
    var total: Double = dinheiroInicial
    for _ in (0...tempo) {
        total = ((porcentagemMensal+1) * total) + dinheiroMensal
        resultado.append(total)
    }

    return resultado
}

func calculaPorcentagemAnualParaMensal(of value: Double,  at n: Double) -> Double {
    let multipleOf2 = abs(n.truncatingRemainder(dividingBy: 2)) == 1
    return value < 0 && multipleOf2 ? -pow(-value, 1/n) : pow(value, 1/n)
}

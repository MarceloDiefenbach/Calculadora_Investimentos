//
//  MoneyPickerView.swift
//  Calculadora_Investimentos
//
//  Created by Marcelo Diefenbach on 27/05/21.
//

import SwiftUI

struct MoneyPickerView: View {
    @State private var selectedFlavor = String()

    var body: some View {
        ZStack{
            VStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 12).foregroundColor(Color.init("BgBlack")).frame(width: UIScreen.main.bounds.width*0.9, height: UIScreen.main.bounds.height*0.2, alignment: .center)
                    Picker("Flavor", selection: $selectedFlavor) {
                        Text("US ($)").tag("1")
                        Text("BRL (R$)").tag("2")
                        Text("Outro").tag("3")
                    }.colorScheme(.dark)
                }.frame(width: UIScreen.main.bounds.width*0.9, alignment: .center)
                ZStack{
                    RoundedRectangle(cornerRadius: 12).foregroundColor(Color.blue).frame(width: UIScreen.main.bounds.width*0.9, height: UIScreen.main.bounds.height*0.06, alignment: .center)
                    Text("Confirmar")
                        .foregroundColor(.white)
                        .font(Font.custom("Poppins-Bold", size: UIScreen.main.bounds.height*0.02))
                        
                }.padding(.top, -20)
            }
        }
    }
}

struct MoneyPickerView_Previews: PreviewProvider {
    static var previews: some View {
        MoneyPickerView()
    }
}

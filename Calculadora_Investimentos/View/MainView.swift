//
//  MainView.swift
//  Calculadora_Investimentos
//
//  Created by João Brentano on 24/05/21.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

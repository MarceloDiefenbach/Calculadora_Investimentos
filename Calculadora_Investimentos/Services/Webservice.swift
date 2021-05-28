//
//  Webservice.swift
//  Calculadora_Investimentos
//
//  Created by João Brentano on 28/05/21.
//

import Foundation

class Webservice {
    
    func getQuotes(completion: @escaping ([String:Quote]?) -> ()) {
        
        guard let url = URL(string: "https://economia.awesomeapi.com.br/last/USD-BRL") else {
            fatalError("Invalid URL")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            let payload: String? = String(data: data, encoding: .utf8)
            print(payload)
            
//            let xyz: [String:Quote]
            let quotes = try? JSONDecoder().decode([String:Quote].self, from: data)
            
            print(quotes)
            
            DispatchQueue.main.async {
                completion(quotes)
            }
            
        }.resume()
        
    }
    
}

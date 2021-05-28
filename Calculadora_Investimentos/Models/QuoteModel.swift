//
//  QuoteModel.swift
//  Calculadora_Investimentos
//
//  Created by João Brentano on 28/05/21.
//

import Foundation

class QuoteListViewModel: ObservableObject {
    @Published var quotes = [QuoteViewModel]()
    
    init() {
        
        Webservice().getQuotes { quotes in
            
            if let quotes = quotes {
                self.quotes = quotes.map({ Tuple in
                    return QuoteViewModel(quote: Tuple.value)
                })
            }
        }
        
    }
    
}

struct QuoteViewModel {
    
    var quote: Quote
    
    init(quote: Quote) {
        self.quote = quote
    }
    
    var code: String {
        return self.quote.code
    }
    
    var codein: String {
        return self.quote.codein
    }
    
    var name: String {
        return self.quote.name
    }
    
    var high: String {
        return self.quote.high
    }
    
    var low: String {
        return self.quote.low
    }
    
    var varBid: String {
        return self.quote.varBid
    }
    
    var pctChange: String {
        return self.quote.pctChange
    }
    
    var bid: Double? {
        return Double.init(self.quote.bid)
    }
    
    var ask: String {
        return self.quote.ask
    }
    
    var timestamp: String {
        return self.quote.timestamp
    }
    
    var create_date: String {
        return self.quote.create_date
    }
    
}

struct Quote: Codable {
    let code: String
    let codein: String
    let name: String
    let high: String
    let low: String
    let varBid: String
    let pctChange: String
    let bid: String
    let ask: String
    let timestamp: String
    let create_date: String
}

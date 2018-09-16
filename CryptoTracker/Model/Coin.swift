//
//  Coin.swift
//  CryptoTracker
//
//  Created by Valeria on 15.09.2018.
//  Copyright © 2018 Valeria. All rights reserved.
//

import Foundation

struct Coin {
    var symbol : String
    var price : String
    
    init?(_ json : [String : Any]) {
        
        guard
            let price = json["price"] as? String,
            let symbol = json["symbol"] as? String
            else { return nil }
        
        self.price = price
        self.symbol = symbol
    }
    
    static func getCoins(from array : Any) -> [Coin]? {
        
        guard let result = array as? [[String: Any]] else { return nil}
        var coins : [Coin] = []
        
        for item in result {
            if let coin = Coin(item){
                coins.append(coin)
            }
        }
        
        return coins
    }
}

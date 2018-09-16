//
//  CoinListViewController.swift
//  CryptoTracker
//
//  Created by Valeria on 16.09.2018.
//  Copyright © 2018 Valeria. All rights reserved.
//

import UIKit
import Alamofire

class CoinListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    //MARK: - Properties
    
    let BASE_ENDPOINT = "https://api.binance.com"
    var coins : [Coin] = []
    
    //MARK: - Outlets
    
    @IBOutlet weak var coinTableView: UITableView!
    
    //MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        coinTableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "coinCell")
        coinTableView.delegate = self
        coinTableView.dataSource = self
        
        loadCoins()
    }
    
    //MARK: - UITableViewDataSource Methods

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return coins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "coinCell", for: indexPath) as? TableViewCell
            else { fatalError("dequeueReusableCell Error") }
        
        let coin = coins[indexPath.row]
        
        cell.coinTitle.text = coin.symbol
        cell.coinValue.text = coin.price
        
        return cell
    }
    
    //MARK: - UITableViewDelegate Methods
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(coins[indexPath.row])
    }
    
    //MARK: - Request Methods

    func loadCoins(){
        request(BASE_ENDPOINT + "/api/v3/ticker/price").validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                
                if let coins = Coin.getCoins(from: value){
                    self.coins = coins
                    self.coinTableView.reloadData()
                }
                
            case .failure(let error) : print(error)
            }
        }
    }
    
}

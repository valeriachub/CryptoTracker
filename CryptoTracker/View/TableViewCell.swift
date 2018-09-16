//
//  TableViewCell.swift
//  CryptoTracker
//
//  Created by Valeria on 15.09.2018.
//  Copyright © 2018 Valeria. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    
    @IBOutlet weak var coinTitle: UILabel!
    @IBOutlet weak var coinValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

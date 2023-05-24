//
//  ServiceCustomCell.swift
//  MyClient
//
//  Created by Leonid Fedorov on 16.05.2023.
//

import UIKit

class ServiceCustomCell: UITableViewCell {

    @IBOutlet var serviceNameLabel: UILabel!
    
    @IBOutlet var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setup(text: String){
        serviceNameLabel.text = text
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

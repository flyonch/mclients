//
//  MasterCustomCell.swift
//  MyClient
//
//  Created by Leonid Fedorov on 16.05.2023.
//

import UIKit

class MasterCustomCell: UITableViewCell {

    @IBOutlet var textsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

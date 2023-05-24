//
//  CustomTimeItemCell.swift
//  MyClient
//
//  Created by Leonid Fedorov on 17.05.2023.
//

import UIKit

class CustomTimeItemCell: UICollectionViewCell {

    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var mainView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.layer.cornerRadius = 20
    }

}

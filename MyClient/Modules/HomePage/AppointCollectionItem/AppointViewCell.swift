//
//  AppointViewCell.swift
//  MyClient
//
//  Created by Leonid Fedorov on 12.05.2023.
//

import UIKit

class AppointViewCell: UICollectionViewCell {

    @IBOutlet var mainView: UIView!
    @IBOutlet var avatarMaster: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }
    
    func setupUI() {
        mainView.layer.cornerRadius = 7
//        mainView.layer.borderWidth = 1
//        mainView.layer.borderColor = UIColor.gray.cgColor
        avatarMaster.layer.cornerRadius = 30
    }
    

}

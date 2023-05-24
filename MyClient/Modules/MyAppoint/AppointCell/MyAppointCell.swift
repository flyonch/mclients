//
//  MyAppointCell.swift
//  MyClient
//
//  Created by Leonid Fedorov on 19.05.2023.
//

import UIKit

class MyAppointCell: UITableViewCell {
    weak var delegate: MyAppointCellDelegate?

    
    @IBOutlet var labelName: UILabel!
    @IBOutlet var labelServiceType: UILabel!
    @IBOutlet var labelPrice: UILabel!
    @IBOutlet var labelDate: UILabel!
    @IBOutlet var cancelAppoint: UIButton!
    
    let data: showAppointModel? = nil

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    
    @IBAction func cancelAppointBtnAction(_ sender: Any) {
        delegate?.didSelectActionInCell()
    }
}

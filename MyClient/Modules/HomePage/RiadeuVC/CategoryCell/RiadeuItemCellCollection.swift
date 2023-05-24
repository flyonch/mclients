//
//  RiadeuItemCellCollection.swift
//  MyClient
//
//  Created by Leonid Fedorov on 12.05.2023.
//

import UIKit
import Alamofire

class RiadeuItemCellCollection: UICollectionViewCell {

    @IBOutlet var mainView: UIView!
    @IBOutlet var logoCategory: UIImageView!
    @IBOutlet var labelNameService: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        mainView.layer.borderColor = UIColor.black.cgColor
        mainView.layer.borderWidth = 1
        mainView.layer.cornerRadius = 12
    }
    
    func setImageFromURL(_ urlString: String) {
            guard let url = URL(string: urlString) else {
                return
            }
            
            AF.request(url).responseData { [weak self] response in
                switch response.result {
                case .success(let data):
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        self?.logoCategory.image = image
                    }
                case .failure(let error):
                    print("Ошибка загрузки изображения: \(error)")
                }
            }
        }}

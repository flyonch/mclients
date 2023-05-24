//
//  RiadeuVC.swift
//  MyClient
//
//  Created by Leonid Fedorov on 12.05.2023.
//

import UIKit
import Rideau

class RiadeuVC: UIViewController {

    @IBOutlet var riadeuCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        riadeuCollection.register(UINib(nibName: "RiadeuItemCellCollection", bundle: nil), forCellWithReuseIdentifier: "RiadeuItemCellCollection")

        riadeuCollection.dataSource = self
        riadeuCollection.delegate = self
        
        if let flowLayout = riadeuCollection?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
        riadeuCollection.isPagingEnabled = true
        
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 1 // расстояние между ячейками по горизонтали
        layout.minimumLineSpacing = 1 // расстояние между рядами ячеек по вертикали
        let itemWidth = (riadeuCollection.bounds.width - layout.minimumInteritemSpacing)/2
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        riadeuCollection.collectionViewLayout = layout
        
        getAllService()
    }
    
    
    var dataService: [ServiceModel] = []
    var apiDatasource = ServiceApiDatasource()
    
    func getAllService() {
        let tokenObservable = apiDatasource.getAllService()
        
        tokenObservable.subscribe(onNext: { [self] data in
            dataService = data
            print("Data Complite😼")
            riadeuCollection.reloadData()
            
        }, onError: { error in
            print("Error occurred: \(error.localizedDescription)")
        })
    }
    
}

extension RiadeuVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataService.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RiadeuItemCellCollection", for: indexPath) as! RiadeuItemCellCollection
        cell.labelNameService.text = dataService[indexPath.row].type_service_name
        cell.setImageFromURL(dataService[indexPath.row].url_image!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = CreateAppointVC()
        vc.config(data: dataService, typeServiceId: indexPath.row)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}


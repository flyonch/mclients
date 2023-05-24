//
//  SelectServiceVC.swift
//  MyClient
//
//  Created by Leonid Fedorov on 16.05.2023.
//

import UIKit

class SelectServiceVC: UIViewController {
    weak var delegate: SelectServiceDelegate?


    @IBOutlet var mainTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainTable.dataSource = self
        mainTable.delegate = self
        mainTable.register(UINib(nibName: "ServiceCustomCell", bundle: nil), forCellReuseIdentifier: "ServiceCustomCell")
        
        getAllService()
    }
    
    var apiDatasource = ServiceApiDatasource()
    var dataService: [PodServiceModel] = []
    var typeServiceId: Int?
    
    func getAllService() {
        let observable = apiDatasource.getAllPodService(type_service: typeServiceId!)
        
        observable.subscribe(onNext: { [self] data in
            dataService = data
            print("Data PodService Complite😼")
            mainTable.reloadData()
            
        }, onError: { error in
            print("Error occurred: \(error.localizedDescription)")
            CustomAlert.showAlert(withTitle: "Ошибка", message: error.localizedDescription , actionTitle: "OK", cancelTitle: "Отмена")
        })
    }

}

extension SelectServiceVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataService.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ServiceCustomCell", for: indexPath) as! ServiceCustomCell
        cell.serviceNameLabel.text = dataService[indexPath.row].name_service
        cell.priceLabel.text = dataService[indexPath.row].price
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data: PodServiceModel = dataService[indexPath.row]
        
        delegate?.didSelectService(service: data)
        dismiss(animated: true, completion: nil)
    }
    
    
}




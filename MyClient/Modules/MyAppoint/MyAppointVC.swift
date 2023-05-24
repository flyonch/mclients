//
//  MyAppointVC.swift
//  MyClient
//
//  Created by Leonid Fedorov on 19.05.2023.
//

import UIKit

class MyAppointVC: UIViewController, MyAppointCellDelegate {
    var dataSource: [showAppointModel] = []
    
    
    @IBOutlet var mainTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        getAllAppoint()
        
        mainTable.dataSource = self
        mainTable.delegate = self
        mainTable.register(UINib(nibName: "MyAppointCell", bundle: nil), forCellReuseIdentifier: "MyAppointCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getAllAppoint()
    }
    
    func setupUI(){
        title = "Мои заявки"
    }
    
    func getAllAppoint() {
        let apiDatasource = ServiceApiDatasource()
        let user_id = UserManager.getUserId().userId
        let observable = apiDatasource.getShowAppoint(user_id: user_id!)
        
        observable.subscribe(onNext: { [self] data in
            dataSource = data
            print("Data showAppoint Complite😼")
            mainTable.reloadData()
        }, onError: { error in
            print("Error occurred: \(error.localizedDescription)")
            CustomAlert.showAlert(withTitle: "Ошибка", message: error.localizedDescription , actionTitle: "OK", cancelTitle: "Отмена")
        })
    }
    
    func didSelectActionInCell() {
       
    }
}

extension MyAppointVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyAppointCell", for: indexPath) as! MyAppointCell
        cell.labelName.text = dataSource[indexPath.row].manager_name
        cell.delegate = self 
        return cell
    }
    
    
}

protocol MyAppointCellDelegate: class {
    func didSelectActionInCell()
}

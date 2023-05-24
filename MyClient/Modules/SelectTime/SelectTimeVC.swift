//
//  SelectTimeVC.swift
//  MyClient
//
//  Created by Leonid Fedorov on 16.05.2023.
//

import UIKit

class SelectTimeVC: UIViewController, SelectTimeViewProtocol {
    weak var delegate: SelectServiceDelegate?

    let dateFormatter = DateFormatter()
    var apiDatasource = ServiceApiDatasource()
    var selectManagerId: Int?


    var presenter: SelectTimePresenterProtocol?
    var navigation: UINavigationController?
    
    @IBOutlet var daatPiker: UIDatePicker!
    @IBOutlet var timeCollection: UICollectionView!
    
    @IBOutlet var acceptBtn: UIButton!
    
    var dataService: [freeTimeManagerModel] = []
    
    var availableDates: [Date] = []
    var availableTimes: [String] = []
    
    var selectDate: String?
    var selectTime: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        getAllService()
        

        timeCollection.register(UINib(nibName: "CustomTimeItemCell", bundle: nil), forCellWithReuseIdentifier: "CustomTimeItemCell")
        timeCollection.dataSource = self
        timeCollection.delegate = self
    }
    
    func setupUI() {
        title = "Выберите время"
        daatPiker.addTarget(self, action: #selector(handleTimePickerValueChanged), for: .valueChanged)
        acceptBtn.isHidden = true
    }
    
    @objc func handleTimePickerValueChanged(sender: UIDatePicker) {
        parceTime(date: sender.date)

        dateFormatter.dateFormat = "yyyy-MM-dd" //
        let dateString = dateFormatter.string(from: sender.date)
        selectDate = dateString
    }
    
    
    @IBAction func accptBtnAction(_ sender: Any) {
        guard let selectDate = selectDate else { return }
        guard let selectTime = selectTime else { return }

        delegate?.didSelectDate(date: selectDate, time: selectTime)
        dismiss(animated: true)
    }
    

    
    func parseDate() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        dataService.forEach { data in
            let date = dateFormatter.date(from: data.work_date!)
            availableDates.append(date!)
        }
        daatPiker.minimumDate = Calendar.current.startOfDay(for: Date())
    }
    
    func parceTime(date: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        availableTimes = []


        dataService.forEach { data in
            if let workDate = dateFormatter.date(from: data.work_date ?? "") {
                // Convert workDate to the same time zone as the selected date
                let calendar = Calendar.current
                let components = calendar.dateComponents(in: TimeZone.current, from: workDate)
                let convertedWorkDate = calendar.date(from: components)

                // Compare the converted work date with the selected date
                if let convertedWorkDate = convertedWorkDate, calendar.isDate(convertedWorkDate, inSameDayAs: date) {
                    let workHoursStart = data.work_hours_start ?? ""
                    availableTimes.append(workHoursStart)
                }
                timeCollection.reloadData()
            }
        }
    }

    func getAllService() {
        let observable = apiDatasource.getFreeTimeManager(user_id: selectManagerId!)
        
        observable.subscribe(onNext: { [self] data in
            dataService = data
            print("Data dataTime Complite😼")
            parseDate()
            
        }, onError: { error in
            print("Error occurred: \(error.localizedDescription)")
            CustomAlert.showAlert(withTitle: "Ошибка", message: error.localizedDescription , actionTitle: "OK", cancelTitle: "Отмена")
        })
    }
}


extension SelectTimeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return availableTimes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomTimeItemCell", for: indexPath) as! CustomTimeItemCell
        cell.timeLabel.text = availableTimes[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectTime =  availableTimes[indexPath.row]
        acceptBtn.isHidden = false
    }
}


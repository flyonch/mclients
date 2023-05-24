//
//  SuccseccVC.swift
//  MyClient
//
//  Created by Leonid Fedorov on 16.05.2023.
//

import UIKit

class SuccseccVC: UIViewController {

    @IBOutlet var viewGrBtn: UIView!
    
    @IBOutlet var goMyAppoint: UIButton!
    @IBOutlet var backBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewGrBtn.layer.cornerRadius = 12
        navigationController?.navigationBar.isHidden = true


    }
    @IBAction func goMyAppointAction(_ sender: Any) {
    }
    
    
    @IBAction func closeActionBtn(_ sender: Any) {
        dismiss(animated: true)
    }
}

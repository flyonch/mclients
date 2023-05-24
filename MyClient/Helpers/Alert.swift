//
//  Alert.swift
//  MyClient
//
//  Created by Leonid Fedorov on 23.05.2023.
//

import Foundation
import UIKit

class CustomAlert {
    static func showAlert(withTitle title: String, message: String, actionTitle: String, cancelTitle: String, actionHandler: (() -> Void)? = nil, cancelHandler: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: actionTitle, style: .default) { (_) in
            actionHandler?()
        }
        alertController.addAction(action)
        
        let cancelAction = UIAlertAction(title: cancelTitle, style: .cancel) { (_) in
            cancelHandler?()
        }
        alertController.addAction(cancelAction)
        
        if let topViewController = UIApplication.shared.keyWindow?.rootViewController {
            topViewController.present(alertController, animated: true, completion: nil)
        }
    }
}


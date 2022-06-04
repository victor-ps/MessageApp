//
//  Alert.swift
//  MessageApp
//
//  Created by Victor Andre de Paula e Silva on 31/5/2022.
//

import Foundation
import UIKit


class Alert: NSObject{
    var controller: UIViewController

    init (controller:UIViewController){
        self.controller = controller
    }


    func getAlert(title:String, message:String, completion:(()-> Void)? = nil){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

        let OK = UIAlertAction(title: "OK", style: .cancel) { acao in
            completion?()
        }
        alertController.addAction(OK)
        self.controller.present(alertController, animated: true, completion: nil)
        }
    





}

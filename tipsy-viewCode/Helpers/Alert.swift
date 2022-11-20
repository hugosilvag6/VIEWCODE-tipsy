//
//  Alert.swift
//  tipsy-viewCode
//
//  Created by Hugo Silva on 20/11/22.
//

import UIKit

class Alert: NSObject {
   
   var controller: UIViewController
   
   init(controller: UIViewController) {
      self.controller = controller
   }
   
   func getAlert (title: String, msg: String, completion: (() -> Void)? = nil) {
      let alertController = UIAlertController(title: title, message: msg, preferredStyle: .alert)
      let cancelar = UIAlertAction(title: "Ok", style: .cancel) { action in
         completion?()
      }
      alertController.addAction(cancelar)
      self.controller.present(alertController, animated: true, completion: nil)
   }

}

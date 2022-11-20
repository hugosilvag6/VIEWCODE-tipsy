//
//  ResultVC.swift
//  tipsy-viewCode
//
//  Created by Hugo Silva on 20/11/22.
//

import UIKit

class ResultVC: UIViewController {
   
   var screen: ResultView?
   var total: Double?
   var split: Int?
   var tip: Int?
   
   override func loadView() {
      self.screen = ResultView()
      self.view = self.screen
   }
   override func viewDidLoad() {
      super.viewDidLoad()
      self.configScreen()
   }
}

extension ResultVC {
   func configScreen () {
      self.screen?.valueLabel.text = String(format: "%.2f", total ?? 100)
      self.screen?.detailsLabel.text = "Split between \(split ?? 2) people, with \(tip ?? 0)% tip."
      self.screen?.recalculateButton.addTarget(self, action: #selector(recalculatePressed), for: .touchUpInside)
   }
   @objc func recalculatePressed () {
      self.dismiss(animated: true)
   }
}

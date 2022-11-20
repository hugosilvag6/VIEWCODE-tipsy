//
//  HomeVC.swift
//  tipsy-viewCode
//
//  Created by Hugo Silva on 20/11/22.
//

import UIKit

class HomeVC: UIViewController {
   
   var screen: HomeView?
   var alert: Alert?
   var currentTip = 10
   var currentSplit = 2
   
   override func loadView() {
      self.screen = HomeView()
      self.view = self.screen
   }
   override func viewDidLoad() {
      super.viewDidLoad()
      self.configActions()
      self.configTipButtons()
   }
}

extension HomeVC: UITextFieldDelegate {
   private func configActions () {
      self.screen?.valueTextfield.delegate = self
      self.screen?.tip0Button.addTarget(self, action: #selector(tipButtonPressed), for: .touchUpInside)
      self.screen?.tip10Button.addTarget(self, action: #selector(tipButtonPressed), for: .touchUpInside)
      self.screen?.tip20Button.addTarget(self, action: #selector(tipButtonPressed), for: .touchUpInside)
      self.screen?.calculateButton.addTarget(self, action: #selector(calculateButtonPressed), for: .touchUpInside)
      self.screen?.splitStepper.addTarget(self, action: #selector(splitStepperChanged), for: .valueChanged)
      self.alert = Alert(controller: self)
   }
   private func configTipButtons () {
      self.screen?.tip0Button.backgroundColor = .clear
      self.screen?.tip0Button.setTitleColor(UIColor(named: "ThemeDarkGreen"), for: .normal)
      self.screen?.tip10Button.backgroundColor = .clear
      self.screen?.tip10Button.setTitleColor(UIColor(named: "ThemeDarkGreen"), for: .normal)
      self.screen?.tip20Button.backgroundColor = .clear
      self.screen?.tip20Button.setTitleColor(UIColor(named: "ThemeDarkGreen"), for: .normal)
      if self.currentTip == 10 {
         self.screen?.tip10Button.backgroundColor = UIColor(named: "ThemeDarkGreen")
         self.screen?.tip10Button.setTitleColor(.white, for: .normal)
      } else if self.currentTip == 20 {
         self.screen?.tip20Button.backgroundColor = UIColor(named: "ThemeDarkGreen")
         self.screen?.tip20Button.setTitleColor(.white, for: .normal)
      } else {
         self.screen?.tip0Button.backgroundColor = UIColor(named: "ThemeDarkGreen")
         self.screen?.tip0Button.setTitleColor(.white, for: .normal)
      }
   }
}

extension HomeVC {
   @objc func tipButtonPressed (_ sender: UIButton) {
      switch sender.tag {
      case 20:
         self.currentTip = 20
      case 10:
         self.currentTip = 10
      default:
         self.currentTip = 0
      }
      self.configTipButtons()
   }
   @objc func splitStepperChanged (_ sender: UIStepper) {
      self.currentSplit = Int(sender.value)
      self.screen?.splitValueLabel.text = "\(currentSplit)"
   }
   @objc func calculateButtonPressed () {
      guard let value = self.screen?.valueTextfield.text else { return }
      // value + tip / split
      if value.count < 1 {
         self.alert?.getAlert(title: "Error", msg: "Please enter a valid value.")
      } else {
         let finalValue = Double(value) ?? 0
         let finalTip = 1 + (Double(self.currentTip) / 100)
         let resultVc = ResultVC()
         resultVc.total = finalValue * finalTip / Double(currentSplit)
         resultVc.split = self.currentSplit
         resultVc.tip = self.currentTip
         self.navigationController?.present(resultVc, animated: true)
      }
   }
}

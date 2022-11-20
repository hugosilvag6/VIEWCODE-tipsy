//
//  HomeView.swift
//  tipsy-viewCode
//
//  Created by Hugo Silva on 20/11/22.
//

import UIKit

class HomeView: UIView {
   
   lazy var valueLabel = {
      let lb = UILabel()
      lb.translatesAutoresizingMaskIntoConstraints = false
      lb.font = .systemFont(ofSize: 25)
      lb.textColor = .lightGray
      lb.text = "Enter bill total"
      return lb
   }()
   
   lazy var valueTextfield = {
      let tf = UITextField()
      tf.translatesAutoresizingMaskIntoConstraints = false
      tf.font = .systemFont(ofSize: 40)
      tf.placeholder = "e.g. 123.45"
      tf.textColor = .darkGray
      tf.textAlignment = .center
      return tf
   }()
   
   lazy var greenBackground = {
      let view = UIView()
      view.translatesAutoresizingMaskIntoConstraints = false
      view.backgroundColor = UIColor(named: "ThemeLightGreen")
      return view
   }()
   
   lazy var tipLabel = {
      let lb = UILabel()
      lb.translatesAutoresizingMaskIntoConstraints = false
      lb.font = .systemFont(ofSize: 25)
      lb.textColor = .lightGray
      lb.text = "Select tip"
      return lb
   }()
   
   lazy var tipStackView = {
      let st = UIStackView()
      st.translatesAutoresizingMaskIntoConstraints = false
      st.distribution = .fillEqually
      st.axis = .horizontal
      st.spacing = 10
      return st
   }()
   
   lazy var tip0Button = {
      let bt = UIButton()
      bt.translatesAutoresizingMaskIntoConstraints = false
      bt.setTitle("0%", for: .normal)
      bt.titleLabel?.font = .systemFont(ofSize: 35)
      bt.tag = 0
      bt.setTitleColor(UIColor(named: "ThemeDarkGreen"), for: .normal)
      return bt
   }()
   
   lazy var tip10Button = {
      let bt = UIButton()
      bt.translatesAutoresizingMaskIntoConstraints = false
      bt.setTitle("10%", for: .normal)
      bt.setTitleColor(.white, for: .normal)
      bt.titleLabel?.font = .systemFont(ofSize: 35)
      bt.tag = 10
      bt.backgroundColor = UIColor(named: "ThemeDarkGreen")
      return bt
   }()
   
   lazy var tip20Button = {
      let bt = UIButton()
      bt.translatesAutoresizingMaskIntoConstraints = false
      bt.setTitle("20%", for: .normal)
      bt.titleLabel?.font = .systemFont(ofSize: 35)
      bt.tag = 20
      bt.setTitleColor(UIColor(named: "ThemeDarkGreen"), for: .normal)
      return bt
   }()
   
   lazy var splitLabel = {
      let lb = UILabel()
      lb.translatesAutoresizingMaskIntoConstraints = false
      lb.font = .systemFont(ofSize: 25)
      lb.textColor = .lightGray
      lb.text = "Choose split"
      return lb
   }()
   
   lazy var splitStackView = {
      let st = UIStackView()
      st.translatesAutoresizingMaskIntoConstraints = false
      st.distribution = .equalCentering
      st.axis = .horizontal
      return st
   }()
   
   lazy var splitValueLabel = {
      let lb = UILabel()
      lb.translatesAutoresizingMaskIntoConstraints = false
      lb.font = .systemFont(ofSize: 35)
      lb.textColor = UIColor(named: "ThemeDarkGreen")
      lb.text = "2"
      return lb
   }()
   
   lazy var splitStepper = {
      let st = UIStepper()
      st.translatesAutoresizingMaskIntoConstraints = false
      st.minimumValue = 2
      st.value = 2
      st.maximumValue = 100
      st.stepValue = 1
      return st
   }()
   
   lazy var calculateButton = {
      let bt = UIButton()
      bt.translatesAutoresizingMaskIntoConstraints = false
      bt.setTitle("Calculate", for: .normal)
      bt.setTitleColor(.white, for: .normal)
      bt.backgroundColor = UIColor(named: "ThemeDarkGreen")
      bt.titleLabel?.font = .systemFont(ofSize: 35)
      return bt
   }()
   
   

   override init(frame: CGRect) {
      super.init(frame: frame)
      self.setBackground()
      self.setSubviews()
      self.setConstraints()
   }
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}

extension HomeView {
   private func setSubviews () {
      self.addSubview(self.valueLabel)
      self.addSubview(self.valueTextfield)
      self.addSubview(self.greenBackground)
      self.addSubview(self.tipLabel)
      self.addSubview(self.tipStackView)
      tipStackView.addArrangedSubview(self.tip0Button)
      tipStackView.addArrangedSubview(self.tip10Button)
      tipStackView.addArrangedSubview(self.tip20Button)
      self.addSubview(self.splitLabel)
      self.addSubview(self.splitStackView)
      splitStackView.addArrangedSubview(self.splitValueLabel)
      splitStackView.addArrangedSubview(self.splitStepper)
      self.addSubview(self.calculateButton)
   }
   private func setConstraints () {
      NSLayoutConstraint.activate([
         self.valueLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
         self.valueLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
         self.valueLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
         
         self.valueTextfield.topAnchor.constraint(equalTo: self.valueLabel.bottomAnchor, constant: 20),
         self.valueTextfield.leadingAnchor.constraint(equalTo: self.valueLabel.leadingAnchor),
         self.valueTextfield.trailingAnchor.constraint(equalTo: self.valueLabel.trailingAnchor),
         
         self.greenBackground.topAnchor.constraint(equalTo: self.valueTextfield.bottomAnchor, constant: 20),
         self.greenBackground.leadingAnchor.constraint(equalTo: self.leadingAnchor),
         self.greenBackground.trailingAnchor.constraint(equalTo: self.trailingAnchor),
         self.greenBackground.bottomAnchor.constraint(equalTo: self.bottomAnchor),
         
         self.tipLabel.topAnchor.constraint(equalTo: self.greenBackground.topAnchor, constant: 20),
         self.tipLabel.leadingAnchor.constraint(equalTo: self.valueLabel.leadingAnchor),
         self.tipLabel.trailingAnchor.constraint(equalTo: self.valueLabel.trailingAnchor),
         
         self.tipStackView.topAnchor.constraint(equalTo: self.tipLabel.bottomAnchor, constant: 20),
         self.tipStackView.leadingAnchor.constraint(equalTo: self.valueLabel.leadingAnchor),
         self.tipStackView.trailingAnchor.constraint(equalTo: self.valueLabel.trailingAnchor),
         
         self.splitLabel.topAnchor.constraint(equalTo: self.tipStackView.bottomAnchor, constant: 20),
         self.splitLabel.leadingAnchor.constraint(equalTo: self.valueLabel.leadingAnchor),
         self.splitLabel.trailingAnchor.constraint(equalTo: self.valueLabel.trailingAnchor),
         
         self.splitStackView.topAnchor.constraint(equalTo: self.splitLabel.bottomAnchor, constant: 20),
         self.splitStackView.leadingAnchor.constraint(equalTo: self.valueLabel.leadingAnchor),
         self.splitStackView.trailingAnchor.constraint(equalTo: self.valueLabel.trailingAnchor),
         
         self.calculateButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20),
         self.calculateButton.leadingAnchor.constraint(equalTo: self.valueLabel.leadingAnchor),
         self.calculateButton.trailingAnchor.constraint(equalTo: self.valueLabel.trailingAnchor),
         self.calculateButton.heightAnchor.constraint(equalToConstant: 60)
      ])
   }
   private func setBackground () {
      self.backgroundColor = .white
   }
}

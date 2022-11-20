//
//  ResultView.swift
//  tipsy-viewCode
//
//  Created by Hugo Silva on 20/11/22.
//

import UIKit

class ResultView: UIView {
   
   lazy var greenBackground = {
      let view = UIView()
      view.translatesAutoresizingMaskIntoConstraints = false
      view.backgroundColor = UIColor(named: "ThemeLightGreen")
      return view
   }()
   
   lazy var totalPerPersonLabel = {
      let lb = UILabel()
      lb.translatesAutoresizingMaskIntoConstraints = false
      lb.text = "Total per person"
      lb.font = .systemFont(ofSize: 30)
      lb.textColor = .gray
      lb.textAlignment = .center
      return lb
   }()
   
   lazy var valueLabel = {
      let lb = UILabel()
      lb.translatesAutoresizingMaskIntoConstraints = false
      lb.text = "100"
      lb.font = .systemFont(ofSize: 45, weight: .bold)
      lb.textColor = UIColor(named: "ThemeDarkGreen")
      lb.textAlignment = .center
      return lb
   }()
   
   lazy var detailsLabel = {
      let lb = UILabel()
      lb.translatesAutoresizingMaskIntoConstraints = false
      lb.text = "Details"
      lb.font = .systemFont(ofSize: 25)
      lb.textColor = .gray
      lb.textAlignment = .center
      lb.numberOfLines = 0
      return lb
   }()
   
   lazy var recalculateButton = {
      let bt = UIButton()
      bt.translatesAutoresizingMaskIntoConstraints = false
      bt.setTitle("Recalculate", for: .normal)
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

extension ResultView {
   private func setSubviews () {
      self.addSubview(self.greenBackground)
      self.addSubview(self.totalPerPersonLabel)
      self.addSubview(self.valueLabel)
      self.addSubview(self.detailsLabel)
      self.addSubview(self.recalculateButton)
   }
   private func setConstraints () {
      NSLayoutConstraint.activate([
         self.greenBackground.topAnchor.constraint(equalTo: self.topAnchor),
         self.greenBackground.leadingAnchor.constraint(equalTo: self.leadingAnchor),
         self.greenBackground.trailingAnchor.constraint(equalTo: self.trailingAnchor),
         self.greenBackground.heightAnchor.constraint(equalToConstant: 300),
         
         self.totalPerPersonLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 50),
         self.totalPerPersonLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
         self.totalPerPersonLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
         
         self.valueLabel.topAnchor.constraint(equalTo: self.totalPerPersonLabel.bottomAnchor, constant: 20),
         self.valueLabel.leadingAnchor.constraint(equalTo: self.totalPerPersonLabel.leadingAnchor),
         self.valueLabel.trailingAnchor.constraint(equalTo: self.totalPerPersonLabel.trailingAnchor),
         
         self.detailsLabel.topAnchor.constraint(equalTo: self.greenBackground.bottomAnchor, constant: 20),
         self.detailsLabel.leadingAnchor.constraint(equalTo: self.totalPerPersonLabel.leadingAnchor),
         self.detailsLabel.trailingAnchor.constraint(equalTo: self.totalPerPersonLabel.trailingAnchor),
         
         self.recalculateButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20),
         self.recalculateButton.leadingAnchor.constraint(equalTo: self.totalPerPersonLabel.leadingAnchor),
         self.recalculateButton.trailingAnchor.constraint(equalTo: self.totalPerPersonLabel.trailingAnchor)
      ])
   }
   private func setBackground () {
      self.backgroundColor = .white
   }
}

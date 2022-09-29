//
//  ViewController.swift
//  Floating
//
//  Created by Glenn Posadas on 9/23/22.
//

import UIKit

/**
 A custom view with a label that can animate in floating way.
 */
class FloatingView: UIView {
  
  // MARK: -
  // MARK: Properties
  
  private(set) var label: UILabel!
  
  // MARK: -
  // MARK: Functions
  
  private init() { super.init(frame: .zero) }
  
  init(text: String,
       textColor: UIColor,
       textFont: UIFont,
       bgColor: UIColor,
       data: Any? = nil,
       icon: UIImage? = nil) {
    super.init(frame: .zero)

    backgroundColor = bgColor
    label = UILabel()
    label.text = text
    label.textColor = textColor
    label.numberOfLines = 0
    label.textAlignment = .center
    
    self.layer.cornerRadius = 10
    self.layer.shadowColor = UIColor.gray.cgColor
    self.layer.shadowRadius = 10
    self.layer.shadowOpacity = 0.3
    self.layer.shadowOffset = .zero
    
    addSubview(label)
    label.translatesAutoresizingMaskIntoConstraints = false
    
    label.backgroundColor = .red
    NSLayoutConstraint.activate([
      label.topAnchor.constraint(equalTo: topAnchor, constant: 16),
      label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
      label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
      label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
    ])
    
    UIView.animate(withDuration: 0.8, delay: 0.1, options: [.autoreverse, .repeat], animations: {
      self.frame = CGRect(
        x: self.frame.origin.x,
        y: self.frame.origin.y - 5,
        width: self.frame.size.width,
        height: self.frame.size.height
      )
    },completion: nil )
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

class ViewController: UIViewController {

  @IBOutlet weak var v: UIView!
  
  private var fv = FloatingView(text: "This profile is unclaimed.  The more ideas and followers the better chance that changes.", textColor: .white, textFont: .systemFont(ofSize: 12), bgColor: UIColor(red: 0.498, green: 0.486, blue: 0.631, alpha: 1))
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    v.addSubview(fv)
    fv.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      fv.centerYAnchor.constraint(equalTo: v.centerYAnchor),
      fv.leadingAnchor.constraint(equalTo: v.leadingAnchor),
      fv.trailingAnchor.constraint(equalTo: v.trailingAnchor)
    ])

  }


}


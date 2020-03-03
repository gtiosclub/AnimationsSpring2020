//
//  TranslateViewController.swift
//  PresentAnimation
//
//  Created by Phil Zet (Zakharchenko) on 02/29/20.
//  Copyright © 2020 Phil Zet. All rights reserved.
//

import UIKit

class TranslateViewController: UIViewController {

    @IBOutlet weak var animatedView: UIView!
    @IBOutlet weak var centerYConstraint: NSLayoutConstraint!
    
    var const: CGFloat = 150 {
        didSet {
            UIView.animate(withDuration: 0.5, animations: {
                self.centerYConstraint.constant = self.const
                self.animatedView.backgroundColor = UIColor.random
                self.view.layoutIfNeeded()
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animatedView.layer.cornerRadius = 20.0
        animatedView.layer.cornerCurve = .continuous
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.const = -self.const
    }

}

extension UIColor {
    static var random: UIColor {
        return UIColor(
            red: CGFloat.random(in: 0...1),
            green: CGFloat.random(in: 0...1),
            blue: CGFloat.random(in: 0...1),
            alpha: 1
        )
    }
}

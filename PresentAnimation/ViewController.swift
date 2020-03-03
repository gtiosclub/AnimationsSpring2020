//
//  ViewController.swift
//  PresentAnimation
//
//  Created by Phil Zet (Zakharchenko) on 02/29/20.
//  Copyright © 2020 Phil Zet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var pinchView: UIView!
    @IBOutlet weak var start: UIButton!
    @IBOutlet weak var cancel: UIButton!
    @IBOutlet weak var effectView: UIVisualEffectView!
    
    var effect: UIVisualEffect!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.effectView.alpha = 0
        
        pinchView.layer.cornerRadius = 20.0
        pinchView.layer.cornerCurve = .continuous
        
        start.layer.cornerRadius = 12.0
        cancel.layer.cornerRadius = 12.0
        start.layer.borderWidth = 2.0
        cancel.layer.borderWidth = 2.0
        start.layer.borderColor = UIColor.systemGreen.cgColor
        cancel.layer.borderColor = UIColor.systemRed.cgColor
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(self.handlePinch(_:)))
        view.addGestureRecognizer(pinch)
    }

    @IBAction func handleCancel(_ sender: Any) {
        hideView()
    }
    
    func showView() {
        self.view.addSubview(pinchView)
        self.pinchView.center = self.view.center
        self.pinchView.alpha = 0
        UIView.animate(withDuration: 0.4, animations: {
            self.effectView.alpha = 1
            self.pinchView.alpha = 1
            self.pinchView.transform = CGAffineTransform.identity
        })
    }
    
    func hideView() {
        UIView.animate(withDuration: 0.4, animations: {
            self.pinchView.transform = CGAffineTransform(scaleX: 1.3,
                                                         y: 1.3)
            self.pinchView.alpha = 0
            self.effectView.alpha = 0
        }, completion: { _ in
            self.pinchView.removeFromSuperview()
        })
    }
    
    @objc func handlePinch(_ sender: UIPinchGestureRecognizer) {
        if sender.state == .began || sender.state == .changed {
            self.view.transform = self.view.transform.scaledBy(x: sender.scale,
                                                               y: sender.scale)
            
        } else if sender.state == .ended || sender.state == .cancelled {
            UIView.animate(withDuration: 0.4) {
                self.view.transform = CGAffineTransform.identity
            }
            if sender.velocity > 0.0 {
                self.showView()
            } else {
                self.hideView()
            }
        }
        sender.scale = 1.0
    }
    
}


//
//  FirstController.swift
//  TBC47 AnimatedViewcontrollers
//
//  Created by Sandroshvili on 6/23/20.
//  Copyright © 2020 Apple Inc. All rights reserved.
//

import UIKit

class FirstController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var textView: UIView!
    
    var image: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blurrView()
        imageView.image = UIImage(named: image!)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
    }

    
    func blurrView() {
        if !UIAccessibility.isReduceTransparencyEnabled {
            textView.backgroundColor = .clear
            let blurEffect = UIBlurEffect(style: .light)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.frame = CGRect(x:0, y: view.frame.height / 2, width: view.frame.width, height: view.frame.height / 2)
            blurEffectView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            blurEffectView.layer.cornerRadius = 100
            blurEffectView.alpha = 0.5
            
            view.insertSubview(blurEffectView, at: 1)
        } else {
            view.backgroundColor = .black
        }
    }
    
}

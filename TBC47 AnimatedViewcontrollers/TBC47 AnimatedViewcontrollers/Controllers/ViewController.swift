//
//  ViewController.swift
//  TBC47 AnimatedViewcontrollers
//
//  Created by Sandroshvili on 6/23/20.
//  Copyright © 2020 Apple Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIViewControllerTransitioningDelegate {

    @IBOutlet weak var firstImageView: UIImageView! {
        didSet {
            firstImageView.layer.cornerRadius = 15
        }
    }
    @IBOutlet weak var secondImageView: UIImageView! {
        didSet {
            secondImageView.layer.cornerRadius = 15
        }
    }
    @IBOutlet weak var thirdImageView: UIImageView! {
        didSet {
            thirdImageView.layer.cornerRadius = 15
        }
    }
    
    var selectedImageView: UIImageView?
    
    let animation = AnimationController()
    var image: String?
    let contents = ["image1","image2","image3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onFirst(_ sender: UITapGestureRecognizer) {
        performTransition(imageView: firstImageView, index: 0)
    }
    
    @IBAction func onSecond(_ sender: UITapGestureRecognizer) {
        performTransition(imageView: secondImageView, index: 1)
    }
    
    @IBAction func onThird(_ sender: UITapGestureRecognizer) {
        performTransition(imageView: thirdImageView, index: 2)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           let destinationVC = segue.destination as! FirstController
           destinationVC.transitioningDelegate = self
           destinationVC.modalPresentationStyle = .custom
        destinationVC.image = self.image
       }
    
    func performTransition(imageView: UIImageView, index: Int) {
        selectedImageView = imageView
        image = contents[index]
        performSegue(withIdentifier: "CustomShow", sender: nil)
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        animation.transitionMode = .present
        animation.startingPoint = CGPoint(x: selectedImageView!.center.x, y: view.bounds.maxY)
        
        return animation
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        animation.transitionMode = .dismiss
        animation.startingPoint = CGPoint(x: selectedImageView!.center.x, y: view.bounds.maxY)
       
        
        return animation
    }
}

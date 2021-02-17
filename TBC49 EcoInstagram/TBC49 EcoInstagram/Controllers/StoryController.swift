//
//  StoryController.swift
//  TBC49 EcoInstagram
//
//  Created by Sandroshvili on 6/26/20.
//  Copyright © 2020 Apple Inc. All rights reserved.
//

import UIKit

class StoryController: UIViewController {

    var stories = [StoryModel]()
    var selectedStory = 0
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var story = stories[selectedStory]
        
        imageView.image = UIImage(named: story.image)
        nameLabel.text = story.fullname
        
        storySeen()
        
    }
    @IBAction func onLeft(_ sender: UITapGestureRecognizer) {
        if selectedStory != 0 {
            selectedStory = selectedStory - 1
            showStory()
        }
    }
    @IBAction func onRight(_ sender: Any) {
        selectedStory = selectedStory + 1
        showStory()
    }
    
    @IBAction func onClose(_ sender: UIButton) {
        storySeen()
        self.dismiss(animated: true, completion: nil)
    }

    func showStory(){
        if selectedStory <= stories.count - 1 {
            storySeen()
            
            var story = stories[selectedStory]
            imageView.image = UIImage(named: story.image)
            nameLabel.text = story.fullname
            UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 15, initialSpringVelocity: 15, options: .transitionFlipFromTop, animations: {
                self.imageView.transform = .init(scaleX: 1.3, y: 1.3)
            }) { (f) in
                let rotation = CATransform3DMakeRotation(-0.5, 1, 0, 0)
                let translation = CATransform3DMakeTranslation(0, 100, 0)
                var australianTransform = CATransform3DConcat(translation, rotation)
//                australianView.layer.transform = australianTransform
                UIView.animate(withDuration: 0.5, animations: {
                    self.imageView.transform3D = australianTransform
                    self.imageView.alpha = 0.3
                    
                }) { (f) in
                    UIView.animate(withDuration: 0.5) {
                        self.imageView.transform = .identity
                        self.imageView.alpha = 1
                    }
                }
            }
            
        }else{
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func storySeen() {
        var story = stories[selectedStory]
        story.seen = true
        
        NotificationCenter.default.post(
        name: NSNotification.Name(rawValue: "StoryID"),
        object: nil,
        userInfo: ["index":selectedStory,
                   "story":story])
    }

}




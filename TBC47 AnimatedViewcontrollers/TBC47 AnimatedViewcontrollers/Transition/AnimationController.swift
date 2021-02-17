//
//  AnimationController.swift
//  TBC47 AnimatedViewcontrollers
//
//  Created by Sandroshvili on 6/23/20.
//  Copyright © 2020 Apple Inc. All rights reserved.
//

import UIKit

class AnimationController: NSObject {
    
    var toView = UIView()
    
    var startingPoint = CGPoint.zero {
        didSet {
            toView.center = startingPoint
        }
    }
    
    var circleColor = UIColor.white
    
    var duration = 0.8
    
    enum viewTransitionMode:Int {
        case present, pop, dismiss
    }
    
    var transitionMode:viewTransitionMode = .present
    
}

extension AnimationController:UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        
        if transitionMode == .present {
            if let presentedView = transitionContext.view(forKey: UITransitionContextViewKey.to) {
                let viewCenter = presentedView.center
                let viewSize = presentedView.frame.size
                
                toView = UIView()
                
                toView.frame = frameForCircle(withViewCenter: viewCenter, size: viewSize, startPoint: startingPoint)
                
                toView.layer.cornerRadius = toView.frame.size.height / 2
                toView.center = startingPoint
                toView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                containerView.addSubview(toView)
                
                
                presentedView.center = startingPoint
                presentedView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                presentedView.alpha = 0
                containerView.addSubview(presentedView)
                
                UIView.animate(withDuration: duration, animations: {
                    self.toView.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
                    presentedView.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
                    presentedView.alpha = 1
                    presentedView.center = viewCenter
                    
                }, completion: { (success:Bool) in
                    UIView.animate(withDuration: 0.2, animations: {
                        self.toView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                        presentedView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                    }) { (f) in
                        UIView.animate(withDuration: 0.2, animations: {
                            self.toView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
                            presentedView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
                        }) { (f) in
                            UIView.animate(withDuration: 0.2) {
                                self.toView.transform = CGAffineTransform.identity
                                presentedView.transform = CGAffineTransform.identity
                            }
                        }
                        
                    }
                    
                    
                    transitionContext.completeTransition(success)
                })
            }
            
        }
        else{
            let transitionModeKey = (transitionMode == .pop) ? UITransitionContextViewKey.to : UITransitionContextViewKey.from
            
            if let returningView = transitionContext.view(forKey: transitionModeKey) {
                let viewCenter = returningView.center
                let viewSize = returningView.frame.size
                
                
                toView.frame = frameForCircle(withViewCenter: viewCenter, size: viewSize, startPoint: startingPoint)
                
                toView.layer.cornerRadius = toView.frame.size.height / 2
                toView.center = startingPoint
                toView.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
                
                UIView.animate(withDuration: 0.4, animations: {
                    self.toView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                    returningView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)

                }, completion: { (success:Bool) in
                    UIView.animate(withDuration: 0.2, animations: {
                        self.toView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                        returningView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                    }) { (f) in
                        UIView.animate(withDuration: 0.2, animations: {
                            self.toView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                            returningView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                        }) { (f) in
                            UIView.animate(withDuration: 0.2, animations: {
                                self.toView.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
                                returningView.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
                            }) { (f) in
                                UIView.animate(withDuration: 0.2, animations: {
                                    self.toView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                                    returningView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                                }) { (f) in
                                    UIView.animate(withDuration: 0.1, animations: {
                                        returningView.center = self.startingPoint
                                        returningView.alpha = 0
                                        
                                        if self.transitionMode == .pop {
                                            containerView.insertSubview(returningView, belowSubview: returningView)
                                            containerView.insertSubview(self.toView, belowSubview: returningView)
                                        }
                                    }) { (success:Bool) in
                                    returningView.center = viewCenter
                                    returningView.removeFromSuperview()
                                    
                                    self.toView.removeFromSuperview()
                                    
                                    transitionContext.completeTransition(success)
                                    }
                                }
                            }

                        }
                        


                    }
                    
                    
                })
                
            }
            
            
        }
        
    }
    
    
    
    func frameForCircle (withViewCenter viewCenter:CGPoint, size viewSize:CGSize, startPoint:CGPoint) -> CGRect {
        let xLength = fmax(startPoint.x, viewSize.width - startPoint.x)
        let yLength = fmax(startPoint.y, viewSize.height - startPoint.y)
        
        let offestVector = sqrt(xLength * xLength + yLength * yLength) * 2
        let size = CGSize(width: offestVector, height: offestVector)
        
        return CGRect(origin: CGPoint.zero, size: size)
        
    }
}


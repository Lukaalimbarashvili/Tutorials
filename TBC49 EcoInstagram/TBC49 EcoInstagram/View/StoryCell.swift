//
//  StoryCell.swift
//  TBC49 EcoInstagram
//
//  Created by Sandroshvili on 6/26/20.
//  Copyright © 2020 Apple Inc. All rights reserved.
//

import UIKit
import CoreGraphics

class StoryCell: UICollectionViewCell {
    
    let layeruka = CAShapeLayer()
    let boundsuka = CGRect(x: 1, y: 1, width: 92, height: 92)
    let animation = CABasicAnimation(keyPath: "lineDashPhase")
    

    
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.cornerRadius = 85/2
        iv.backgroundColor = .black
        return iv
    }()
    
    let circleView: UIView = {
        let iv = UIView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.cornerRadius = 47
        iv.backgroundColor = .clear
        return iv
    }()
    
    let userLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = Font.SourceSansProRegular?.withSize(15)
        l.textColor = Colors.DarkGray
        l.text = "Full Name"
        return l
    }()
    
    public static let identifier = "StoryCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
    }
    
    private func setupLayout() {
        
        layeruka.path = UIBezierPath(roundedRect: boundsuka, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: 46, height: 46)).cgPath
        layeruka.strokeColor = UIColor.red.cgColor
        layeruka.lineWidth = 2.5
        layeruka.fillColor = nil
        layeruka.cornerRadius = 47
        layeruka.lineDashPattern = [10, 6]
        
        layeruka.lineDashPattern?.reduce(0) { $0 - $1.intValue } ?? 0
        
        
        animation.fromValue = 0
        animation.toValue = layeruka.lineDashPattern?.reduce(0) { $0 - $1.intValue } ?? 0
        animation.duration = 1
        animation.repeatCount = .infinity
        
        addSubview(circleView)
        addSubview(imageView)
        addSubview(userLabel)
        layeruka.add(animation, forKey: "line")
        circleView.layer.addSublayer(layeruka)
        
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 85),
            imageView.heightAnchor.constraint(equalToConstant: 85),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 4.5),
//            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            circleView.widthAnchor.constraint(equalToConstant: 94),
            circleView.heightAnchor.constraint(equalToConstant: 94),
            circleView.topAnchor.constraint(equalTo: topAnchor),
            circleView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            userLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
            userLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}

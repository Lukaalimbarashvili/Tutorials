//
//  SecondCollectionViewCell.swift
//  TBC Competition4
//
//  Created by Sandroshvili on 6/26/20.
//  Copyright © 2020 Apple Inc. All rights reserved.
//

import UIKit

class SecondCollectionViewCell: UICollectionViewCell {
     
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.layer.cornerRadius = 30
        }
    }
}

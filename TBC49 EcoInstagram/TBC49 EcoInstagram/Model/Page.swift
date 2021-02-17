//
//  Page.swift
//  TBC49 EcoInstagram
//
//  Created by Sandroshvili on 6/26/20.
//  Copyright © 2020 Apple Inc. All rights reserved.
//

import Foundation
import UIKit

struct Page {
    let imageString: String
    let title: String
    let description: String
    
    var image: UIImage? {
        return UIImage(named: imageString)
    }
}

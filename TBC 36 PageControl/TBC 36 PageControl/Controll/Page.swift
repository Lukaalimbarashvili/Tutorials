//
//  Page.swift
//  TBC 36 PageControl
//
//  Created by Sandroshvili on 6/8/20.
//  Copyright © 2020 Apple Inc. All rights reserved.
//

import Foundation
import UIKit

struct Page {
    let imageNamed: String
    let title: String
    let text: String
    
    var image: UIImage? {
        return UIImage(named: imageNamed)
    }
}

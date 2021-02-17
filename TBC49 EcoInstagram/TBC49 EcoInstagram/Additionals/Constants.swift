//
//  Constants.swift
//  TBC49 EcoInstagram
//
//  Created by Sandroshvili on 6/26/20.
//  Copyright © 2020 Apple Inc. All rights reserved.
//

import UIKit
typealias TableViewNeccessities = UITableViewDelegate & UITableViewDataSource
typealias CollectionViewNeccessities = UICollectionViewDelegate & UICollectionViewDataSource & UICollectionViewDelegateFlowLayout

struct Colors {
    public static let MossGreen = #colorLiteral(red: 0, green: 0.8, blue: 0.5137254902, alpha: 1)
    public static let Black     = #colorLiteral(red: 0.09803921569, green: 0.09803921569, blue: 0.09803921569, alpha: 1)
    public static let Gray      = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
    public static let LightGray = #colorLiteral(red: 0.9450980392, green: 0.9450980392, blue: 0.9450980392, alpha: 1)
    public static let DarkGray  = #colorLiteral(red: 0.4666666667, green: 0.4666666667, blue: 0.4666666667, alpha: 1)
    public static let green     = #colorLiteral(red: 0, green: 0.8, blue: 0.5137254902, alpha: 1)
}

struct Font {
    public static let SourceSansProBold     = UIFont(name: "SourceSansPro-Bold", size: 14)
    public static let SourceSansProRegular  = UIFont(name: "SourceSansPro-Regular", size: 14)
}

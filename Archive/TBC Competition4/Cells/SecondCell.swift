//
//  SecondCell.swift
//  TBC Competition4
//
//  Created by Sandroshvili on 6/26/20.
//  Copyright © 2020 Apple Inc. All rights reserved.
//

import UIKit

class SecondCell: UITableViewCell {

    @IBOutlet weak var immageView: UIImageView! {
        didSet {
            immageView.layer.cornerRadius = 30
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

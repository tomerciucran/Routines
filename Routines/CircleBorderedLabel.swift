//
//  CircleBorderedLabel.swift
//  Routines
//
//  Created by Tomer Ciucran on 12/10/16.
//  Copyright © 2016 tomercuicran. All rights reserved.
//

import UIKit

class CircleBorderedLabel: UILabel {
    
    override func layoutSubviews() {
        layer.cornerRadius = bounds.width / 2
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
    }

}

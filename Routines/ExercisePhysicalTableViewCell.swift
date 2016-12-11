//
//  ExercisePhysicalTableViewCell.swift
//  Routines
//
//  Created by Tomer Ciucran on 12/10/16.
//  Copyright © 2016 tomercuicran. All rights reserved.
//

import UIKit

class ExercisePhysicalTableViewCell: UITableViewCell {
    
    static let identifier = "ExercisePhysicalTableViewCell"
    static let height: CGFloat = 139
    
    @IBOutlet weak var exerciseImageView: UIImageView! {
        didSet {
            exerciseImageView.layer.cornerRadius = exerciseImageView.bounds.width / 2
            exerciseImageView.clipsToBounds = true
        }
    }
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    
    func configure(item: Exercise) {
        if let url = URL(string: item.imageUrl) {
            exerciseImageView.sd_setImage(with: url)
        }
        titleLabel.text = item.name
        subtitleLabel.text = item.subtitle
        if item.duration != "0" {
            durationLabel.text = item.duration.minutesString()
        } else {
            durationLabel.text = ""
        }
    }

}

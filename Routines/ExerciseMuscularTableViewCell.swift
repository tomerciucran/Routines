//
//  ExerciseMuscularTableViewCell.swift
//  Routines
//
//  Created by Tomer Ciucran on 12/10/16.
//  Copyright © 2016 tomercuicran. All rights reserved.
//

import UIKit
import SDWebImage

class ExerciseMuscularTableViewCell: UITableViewCell {
    
    static let identifier = "ExerciseMuscularTableViewCell"
    static let height: CGFloat = 139

    @IBOutlet weak var exerciseImageView: UIImageView! {
        didSet {
            exerciseImageView.layer.cornerRadius = exerciseImageView.bounds.width / 2
            exerciseImageView.clipsToBounds = true
        }
    }
    @IBOutlet weak var breakTimeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var repsLabel: CircleBorderedLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(item: Exercise) {
        if let url = URL(string: item.imageUrl) {
            exerciseImageView.sd_setImage(with: url)
        }
        titleLabel.text = item.name
        if let repeats = item.routineExercisesSet.repeats {
            repsLabel.text = "\(repeats)\nreps"
        }
        if let breakTime = item.routineExercisesSet.breaktime {
            breakTimeLabel.text = breakTime.minutesString()
        }
    }

}

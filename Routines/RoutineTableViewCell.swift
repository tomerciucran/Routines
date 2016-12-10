//
//  RoutineTableViewCell.swift
//  Routines
//
//  Created by Tomer Ciucran on 12/10/16.
//  Copyright © 2016 tomercuicran. All rights reserved.
//

import UIKit
import SDWebImage

class RoutineTableViewCell: UITableViewCell {
    
    static let identifier = "RoutineTableViewCell"

    @IBOutlet weak var routineImageView: UIImageView!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var goalLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(item: Routine) {
        if let url = URL(string: item.imageUrl) {
            routineImageView.sd_setImage(with: url)
        }
        if let size = item.sizeExercise {
            sizeLabel.text = "0/\(size)"
        } else {
            sizeLabel.text = ""
        }
        durationLabel.text = item.duration
        goalLabel.text = item.goal
        titleLabel.text = item.title
    }

}

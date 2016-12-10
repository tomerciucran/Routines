//
//  RoutineDetailTableViewController.swift
//  Routines
//
//  Created by Tomer Ciucran on 12/10/16.
//  Copyright © 2016 tomercuicran. All rights reserved.
//

import UIKit
import SDWebImage

class RoutineDetailTableViewController: UITableViewController {
    
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var focusAreaLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var bodyFocusLabel: UILabel!
    @IBOutlet weak var fitnessLevelLabel: UILabel!
    @IBOutlet weak var intensityLabel: UILabel!
    @IBOutlet weak var equipmentBodyWeightLabel: UILabel!
    @IBOutlet weak var equipmentBodyWeightIcon: UIImageView!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var bodyFocusStackView: UIStackView!
    @IBOutlet weak var fitnessLevelStackView: UIStackView!
    @IBOutlet weak var intensityStackView: UIStackView!
    
    var routine: Routine!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Top inset to make the table start after the navigation bar
        self.tableView.contentInset = UIEdgeInsetsMake(Constants.navigationBarHeight,0,0,0)
        
        //Give tableview y offset of the size of the navigation bar
        tableView.contentOffset = CGPoint(x: 0, y: -Constants.navigationBarHeight)
        
        if let url = URL(string: routine.imageUrl) {
            headerImageView.sd_setImage(with: url)
        }
        focusAreaLabel.text = routine.fitnessLevel
        titleLabel.text = routine.title
        durationLabel.text = routine.duration
        bodyFocusLabel.text = routine.focusArea
        fitnessLevelLabel.text = routine.fitnessLevel
        intensityLabel.text = routine.intensity
        descriptionLabel.text = routine.routineDescription
        detailsLabel.text = routine.improvementsInfo
        if let equipment = routine.equipment {
            equipmentBodyWeightLabel.text = equipment.name
        } else {
            equipmentBodyWeightLabel.text = "-"
            equipmentBodyWeightIcon.isHidden = true
        }
        
        if routine.fitnessLevel == nil {
            fitnessLevelStackView.isHidden = true
        }
        
        if routine.focusArea == nil {
            bodyFocusStackView.isHidden = true
        }
        
        if routine.intensity == nil {
            intensityStackView.isHidden = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return routine.exercises.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = routine.exercises[indexPath.row]
        if item.categoryType == ExerciseTypes.muscular {
            let cell = tableView.dequeueReusableCell(withIdentifier: ExerciseMuscularTableViewCell.identifier, for: indexPath) as! ExerciseMuscularTableViewCell
            cell.configure(item: item)
            return cell
        } else if item.categoryType == ExerciseTypes.physical {
            let cell = tableView.dequeueReusableCell(withIdentifier: ExercisePhysicalTableViewCell.identifier, for: indexPath) as! ExercisePhysicalTableViewCell
            cell.configure(item: item)
            return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item = routine.exercises[indexPath.row]
        if item.categoryType == ExerciseTypes.muscular {
            return ExerciseMuscularTableViewCell.height
        } else if item.categoryType == ExerciseTypes.physical {
            return ExercisePhysicalTableViewCell.height
        }
        return 0
    }
}

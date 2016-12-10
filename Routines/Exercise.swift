//
//  Exercise.swift
//  Routines
//
//  Created by Tomer Ciucran on 12/9/16.
//  Copyright © 2016 tomercuicran. All rights reserved.
//

import Foundation

struct Exercise {
    var id: String!
    var duration: String!
    var imageUrl: String!
    var name: String!
    var subtitle: String!
    var routineExerciseId: String!
    var routineExercisesSet: ExerciseSet!
    var categoryType: String!
    
    init(data: [String:AnyObject]) {
        if let exercise = data["exercise"] as? [String:AnyObject],
        let id = exercise["exerciseId"] as? String,
        let duration = exercise["duration"] as? String,
        let imageUrl = exercise["imageUrl"] as? String,
        let name = exercise["name"] as? String,
        let subtitle = exercise["subtitle"] as? String,
        let routineExerciseId = data["routineExerciseId"] as? String,
        let categoryType = exercise["exerciseCategoryTye"] as? String,
        let setArray = data["routineExercisesSet"] as? [[String:AnyObject]],
        let set = setArray.first {
            self.id = id
            self.duration = duration
            self.imageUrl = imageUrl
            self.name = name
            self.subtitle = subtitle
            self.routineExerciseId = routineExerciseId
            self.routineExercisesSet = ExerciseSet(data: set)
            self.categoryType = categoryType
        }
        
        
        
        
    }
}

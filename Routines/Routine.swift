//
//  Routine.swift
//  Routines
//
//  Created by Tomer Ciucran on 12/9/16.
//  Copyright © 2016 tomercuicran. All rights reserved.
//

import Foundation

struct Routine {
    var id: String!
    var title: String!
    var routineDescription: String!
    var duration: String!
    var equipment: Equipment!
    var fitnessLevel: String!
    var focusArea: String!
    var goal: String!
    var imageUrl: String!
    var intensity: String!
    var improvementsInfo: String!
    var exercises: [Exercise]!
    var variationTypeId: String!
    var sizeExercise: String!
    
    init(data: [String:AnyObject]) {
        if let id = data["id"] as? String,
        let title = data["title"] as? String,
        let routineDescription = data["description"] as? String,
        let duration = data["duration"] as? String,
        let equipmentsArray = data["equipmentsForRoutine"] as? [[String:AnyObject]],
        let focusArea = data["focusArea"] as? String,
        let goal = data["goal"] as? String,
        let imageUrl = data["imageUrl"] as? String,
        let exerciseArray = data["routineExercises"] as? [[String:AnyObject]],
        let variationTypeId = data["variationTypeId"] as? String,
        let improvementsInfo = data["improvementInfo"] as? String,
        let sizeExercise = data["sizeExercise"] as? String {
            self.id = id
            self.title = title
            self.routineDescription = routineDescription
            self.duration = duration
            self.focusArea = focusArea
            self.goal = goal
            self.imageUrl = imageUrl
            self.variationTypeId = variationTypeId
            self.sizeExercise = sizeExercise
            self.improvementsInfo = improvementsInfo
            
            if let intensity = data["intensity"] as? String {
                self.intensity = intensity
            }
            
            if let equipment = equipmentsArray.first {
                self.equipment = Equipment(data: equipment)
            }
            
            if let fitnessLevel = data["fitnessLevel"] as? String {
                self.fitnessLevel = fitnessLevel
            }
            
            self.exercises = [Exercise]()
            for exerciseData in exerciseArray {
                let exercise = Exercise(data: exerciseData)
                self.exercises.append(exercise)
            }
        }
    }
}

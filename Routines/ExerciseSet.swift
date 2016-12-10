//
//  ExerciseSet.swift
//  Routines
//
//  Created by Tomer Ciucran on 12/9/16.
//  Copyright © 2016 tomercuicran. All rights reserved.
//

import Foundation

struct ExerciseSet {
    var breaktime: String!
    var done: String!
    var repeats: String!
    var setNumber: String!
    
    init(data: [String:AnyObject]) {
        if let breaktime = data["breaktime"] as? String,
        let done = data["done"] as? String,
        let repeats = data["repeats"] as? String,
            let setNumber = data["setnumber"] as? String {
            self.breaktime = breaktime
            self.done = done
            self.repeats = repeats
            self.setNumber = setNumber
        }
    }
}

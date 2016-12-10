//
//  RoutinesListParser.swift
//  Routines
//
//  Created by Tomer Ciucran on 12/9/16.
//  Copyright © 2016 tomercuicran. All rights reserved.
//

import UIKit

class RoutinesListParser: NSObject {
    
    static func parse() -> [Routine]? {
        if let path = Bundle.main.path(forResource: Constants.routinesListFileName, ofType: Constants.routinesListFileExtension),
        let dict = NSDictionary(contentsOfFile: path),
        let routines = dict["listOfUserRoutine"] as? [[String:AnyObject]] {
            
            var items = [Routine]()
            for routineData in routines {
                if let routine = routineData["routine"] as? [String:AnyObject] {
                    let item = Routine(data: routine)
                    items.append(item)
                }
            }
            return items
        }
        return nil
    }

}

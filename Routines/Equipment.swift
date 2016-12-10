//
//  Equipment.swift
//  Routines
//
//  Created by Tomer Ciucran on 12/9/16.
//  Copyright © 2016 tomercuicran. All rights reserved.
//

import Foundation

struct Equipment {
    var id: String!
    var equipmentDescription: String!
    var name: String!
    
    init(data: [String:AnyObject]) {
        if let id = data["equipmentId"] as? String,
        let equipmentDescription = data["equipmentDescription"] as? String,
            let name = data["equipmentName"] as? String {
            self.id = id
            self.equipmentDescription = equipmentDescription
            self.name = name
        }
    }
}

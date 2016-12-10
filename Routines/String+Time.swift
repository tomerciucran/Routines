//
//  String+Time.swift
//  Routines
//
//  Created by Tomer Ciucran on 12/10/16.
//  Copyright © 2016 tomercuicran. All rights reserved.
//

import Foundation

extension String {
    func minutesString() -> String {
        guard let intSelf = Int(self) else {
            return "-"
        }
        
        if self == "60" {
            return "01:00"
        } else if intSelf < 60 {
            return "00:\(self)"
        }
        return "-"
    }
}

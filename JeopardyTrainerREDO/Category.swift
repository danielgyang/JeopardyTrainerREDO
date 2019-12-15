//
//  Category.swift
//  JeopardyTrainerREDO
//
//  Created by Daniel Yang on 12/14/19.
//  Copyright © 2019 Daniel Yang. All rights reserved.
//

import Foundation

class Category {
    var id: Int
    var title: String
    var cluesCount: Int
    
    init(id: Int, title: String, cluesCount: Int) {
        self.id = id
        self.title = title
        self.cluesCount = cluesCount
    }
}

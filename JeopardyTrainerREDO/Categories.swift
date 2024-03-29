//
//  Categories.swift
//  JeopardyTrainerREDO
//
//  Created by Daniel Yang on 12/14/19.
//  Copyright © 2019 Daniel Yang. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Categories {
    var apiURL = "http://jservice.io/api/categories/"
    var categoryCount = 5
    var categoryArray: [Category] = []
    
    func getData(completed: @escaping () -> ()) {
        let updatedURL = apiURL + "?count=\(categoryCount)"
        Alamofire.request(updatedURL).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let numberOfCategories = json.count
                for index in 0..<numberOfCategories {
                    let id = json[index]["id"].intValue
                    let title = json[index]["title"].stringValue
                    let cluesCount = json[index]["clues_count"].intValue
                    self.categoryArray.append(Category(id: id, title: title, cluesCount: cluesCount))
                }
            case .failure(let error):
                print("ERROR: \(error)")
            }
            completed()
        }
    }
}

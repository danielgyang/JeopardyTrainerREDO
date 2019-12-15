//
//  Clues.swift
//  JeopardyTrainerREDO
//
//  Created by Daniel Yang on 12/14/19.
//  Copyright © 2019 Daniel Yang. All rights reserved.
//

import Foundation

import SwiftyJSON
import Alamofire

class Clues {
    var id = 0
    var cluesCount = 0
    var clueArray: [Clue] = []
    var apiURL = "http://jservice.io/api/category/?id="
    
    func getData(completed: @escaping () -> ()) {
        Alamofire.request(apiURL + "\(id)").responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let numberOfClues = json["clues"].count
                for index in 0..<numberOfClues {
                    let clue = Clue()
                    clue.question = json["clues"][index]["question"].stringValue
                    clue.answer = json["clues"][index]["answer"].stringValue
                    clue.categoryID = json["clues"][index]["category_id"].intValue
                    clue.value = json["clues"][index]["value"].intValue
                    clue.clueID = json["clues"][index]["id"].intValue
                    self.clueArray.append(clue)
            }
            case .failure(let error):
                print("ERROR: \(error)")
            }
            completed()
        }
    }
}

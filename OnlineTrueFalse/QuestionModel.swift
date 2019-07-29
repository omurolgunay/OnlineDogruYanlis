//
//  QuestionModel.swift
//  OnlineTrueFalse
//
//  Created by omur olgunay on 29.07.2019.
//  Copyright © 2019 omur olgunay. All rights reserved.
//

import Foundation

struct QuestionModel: Codable {

    let ID: String
    let question: String
    let answer: String
    let bundle_id: String
    let category: String
    
    enum CodingKeys: String, CodingKey {
        case ID
        case question
        case answer
        case bundle_id
        case category
    }
}

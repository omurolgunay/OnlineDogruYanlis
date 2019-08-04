//
//  GameModel.swift
//  Online Doğru Yanlış
//
//  Created by omur olgunay on 23.07.2019.
//  Copyright © 2019 omur olgunay. All rights reserved.
//

import Foundation

struct GameModel: Codable {
    var userReady: Bool
    var questionOrder: Int
    var totalQuestionCount: Int
    var correctCount: Int
    
    static let encoder = JSONEncoder()
    static let decoder = JSONDecoder()
}

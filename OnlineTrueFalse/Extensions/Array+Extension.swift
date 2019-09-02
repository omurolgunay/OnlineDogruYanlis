//
//  Array+Extension.swift
//  OnlineTrueFalse
//
//  Created by omur olgunay on 30.08.2019.
//  Copyright © 2019 omur olgunay. All rights reserved.
//

import Foundation

extension Array where Element == Int {
    mutating func getRandomNumbers(maxNumber: Int, listSize: Int){
        var randomNumbers = Set<Int>()
        while randomNumbers.count < listSize {
            let randomNumber = Int(arc4random_uniform(UInt32(maxNumber+1)))
            randomNumbers.insert(randomNumber)
        }
        randomNumbers.map{self.append($0)}
    }
}

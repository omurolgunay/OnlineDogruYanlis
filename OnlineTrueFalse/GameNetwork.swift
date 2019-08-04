//
//  GameNetwork.swift
//  OnlineTrueFalse
//
//  Created by omur olgunay on 29.07.2019.
//  Copyright © 2019 omur olgunay. All rights reserved.
//

import Foundation
import Alamofire

class GameNetwork {
    
    var questions: [QuestionModel]?

    public init() { }

    public func getQuestionsWithId(_ id:Int) {
        Alamofire.request("https://\(domainName).com/wp-json/kph/v1&secretKey=\(secretKey)&appID=\(appID)/questions?id=\(id)").responseJSON { response in
            if let json = response.data{
                do{
                    let decoder = JSONDecoder()
                    let result = try decoder.decode([QuestionModel].self, from: json)
                    self.questions = result
                }catch{
                    print(error,"buradayııım")
                }
            }
        }
    }
}



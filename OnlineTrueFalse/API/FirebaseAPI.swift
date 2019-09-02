//
//  FirebaseAPI.swift
//  OnlineTrueFalse
//
//  Created by omur olgunay on 18.08.2019.
//  Copyright © 2019 omur olgunay. All rights reserved.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class FirebaseAPI {
    static let db:Firestore = Firestore.firestore()

    func getQuestions(){
        
        var randomNumberArray = [Int]()
        randomNumberArray.getRandomNumbers(maxNumber: 12, listSize: 10)
        print(randomNumberArray,"randomNumberArray")
        FirebaseAPI.db.collection("Questions").limit(to: 10)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                    }
                }
        }
    }
}

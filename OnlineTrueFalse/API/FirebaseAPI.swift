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

    func getQuestions(completion: @escaping () -> Void){
        FirebaseAPI.db.collection("Questions").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                }
                DispatchQueue.main.async {
                    completion()
                }
            }
        }

    }
}

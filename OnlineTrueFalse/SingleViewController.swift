//
//  SingleViewController.swift
//  Online Doğru Yanlış
//
//  Created by omur olgunay on 23.07.2019.
//  Copyright © 2019 omur olgunay. All rights reserved.
//

import UIKit
import GSMessages
import AVFoundation
import GameKit

class SingleViewController: UIViewController {

    //MARK: - Variables
    var currentMatch = GameCenterHelper.helper
    var gameData = GameModel(questionOrder: 2, totalQuestionCount: 10, correctCount: 1)
    //MARK: - IBActions

    @IBAction func sendData(_ sender: Any) {
        currentMatch.sendMatchData(gameData)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if let rivalName = currentMatch.currentMatch?.players.first?.displayName{
            self.showMessage("Eşleşme bulundu: \(rivalName)", type: .success, options: [.position(.bottom)])
        }
        print(currentMatch)
        NotificationCenter.default.addObserver(self, selector: #selector(reciveData(_:)), name: .reciveData, object: nil)
    }
    @objc func reciveData (_ notification: Notification) {

        print("Data Geldi \(notification.object) ")
  
    }
}

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
import Alamofire
import LGButton

class SingleViewController: UIViewController {

    //MARK: - Variables
    var currentMatch = GameCenterHelper.helper
    var gameData = GameModel(userReady: false, questionOrder: 1, totalQuestionCount: 10, correctCount: 0)
    var incomingData:GameModel?
    
    var service = GameNetwork()

    //MARK: - IBActions
    @IBOutlet weak var rivalStatus: LGButton!
    @IBOutlet weak var myStatus: LGButton!
    @IBAction func imReady(_ sender: Any) {
        gameData.userReady = true
        myStatus.rightIconString = "check"
        currentMatch.sendMatchData(gameData)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let rivalName = currentMatch.currentMatch?.players.first?.displayName{
            self.showMessage("Eşleşme bulundu: \(rivalName)", type: .success, options: [.position(.bottom)])
        }
        NotificationCenter.default.addObserver(self, selector: #selector(reciveData(_:)), name: .reciveData, object: nil)
    }

    @objc func reciveData (_ notification: Notification) {
        print("Data Geldi")
        incomingData = notification.object as? GameModel
        if let data = incomingData {
            if data.userReady{
                rivalStatus.rightIconString = "check"
            }
        }
    }
}

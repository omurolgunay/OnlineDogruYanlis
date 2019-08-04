//
//  GameCenterHelper.swift
//  Online Doğru Yanlış
//
//  Created by omur olgunay on 22.07.2019.
//  Copyright © 2019 omur olgunay. All rights reserved.
//

import GameKit
import GSMessages

final class GameCenterHelper: NSObject {
    
    static var helper = GameCenterHelper()
    var localAuth = false
    
    var viewController: UIViewController?
    var currentMatchmakerVC: GKMatchmakerViewController?
    var currentMatch:GKMatch?
    
    override init() {
        super.init()
        GKLocalPlayer.local.authenticateHandler = { gcAuthVC, error in
            
            NotificationCenter.default.post(name: .authenticationChanged, object: GKLocalPlayer.local.isAuthenticated)
            
            if GKLocalPlayer.local.isAuthenticated {
                print("Authenticated to Game Center!")
                self.localAuth = true
            } else if let vc = gcAuthVC {
                self.viewController?.present(vc, animated: true)
            } else {
                print("Error authentication to GameCenter: " +
                    "\(error?.localizedDescription ?? "none")")
            }
        }
    }
    
    // Create match request
    func matchMaking() {
        guard localAuth else {
            return
        }
        let matchRequest = GKMatchRequest()
        matchRequest.maxPlayers = 2
        matchRequest.minPlayers = 2
        matchRequest.inviteMessage = "Benimle Online doğru yanlış yarışına katılır mısın?"
        
        let vc = GKMatchmakerViewController(matchRequest: matchRequest)
        
        vc?.matchmakerDelegate = self
        currentMatchmakerVC = vc
        viewController?.present(vc!, animated: true)
    }
    
    //Sending data to other players
    func sendMatchData(_ sendingData:GameModel){
        do {
            guard let match = currentMatch else { return }
            try match.sendData(toAllPlayers: GameModel.encoder.encode(sendingData), with: .unreliable)
        }catch{
            print(error)
        }
    }
}

//When new match has been successfully created, this delegate called
extension GameCenterHelper: GKMatchmakerViewControllerDelegate {
    func matchmakerViewControllerWasCancelled(_ viewController: GKMatchmakerViewController) {
        viewController.dismiss(animated: true, completion: nil)
    }
    func matchmakerViewController(_ viewController: GKMatchmakerViewController, didFailWithError error: Error) {
        print("Match maker did fail with error: \(error)")
    }
    func matchmakerViewController(_ viewController: GKMatchmakerViewController, didFind match: GKMatch) {
        self.currentMatch = match
        match.delegate = self
        if match.expectedPlayerCount == 0 {
            
            viewController.dismiss(animated: true, completion: nil)
            NotificationCenter.default.post(name: .presentGame, object: match)
        }
    }
}

extension GameCenterHelper: GKMatchDelegate {
    //when receive data from other players
    func match(_ match: GKMatch, didReceive data: Data, fromRemotePlayer player: GKPlayer) {
        do{
            let gameData = try GameModel.decoder.decode(GameModel.self, from: data) //Decode receiving data
            NotificationCenter.default.post(name: .reciveData, object: gameData) //Inform Notification Center
        }catch{
            print(error)
        }
    }

}


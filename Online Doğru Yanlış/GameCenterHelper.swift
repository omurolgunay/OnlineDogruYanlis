//
//  GameCenterHelper.swift
//  Online Doğru Yanlış
//
//  Created by omur olgunay on 22.07.2019.
//  Copyright © 2019 omur olgunay. All rights reserved.
//

import GameKit

final class GameCenterHelper: NSObject {
    
    static let helper = GameCenterHelper()
    var localAuth = false
    
    var viewController: UIViewController?
    
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
        
        viewController?.present(vc!, animated: true)
        print("match making calıstı")
    }
}

//Extension for error handling and close button
extension GameCenterHelper: GKMatchmakerViewControllerDelegate {
    func matchmakerViewControllerWasCancelled(_ viewController: GKMatchmakerViewController) {
        viewController.dismiss(animated: true, completion: nil)
    }
    func matchmakerViewController(_ viewController: GKMatchmakerViewController, didFailWithError error: Error) {
        print("Match maker did fail with error: \(error)")
    }
}

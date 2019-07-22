//
//  ViewController.swift
//  Online Doğru Yanlış
//
//  Created by omur olgunay on 21.07.2019.
//  Copyright © 2019 omur olgunay. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    //MARK: - Variables
    
    //MARK: - IBOutlets
    @IBOutlet weak var findGame: UIButton!{
        didSet{
            findGame.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
            findGame.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
            findGame.clipsToBounds = true
            findGame.layer.cornerRadius = 5.0
            findGame.titleLabel?.font = UIFont().prefredFont(size: 20,for: .body)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

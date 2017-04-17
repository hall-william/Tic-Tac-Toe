//
//  GameViewController.swift
//  Tic-Tac-Toe
//
//  Created by William Hall on 4/17/17.
//  Copyright © 2017 William Hall. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    var activePlayer = 1 //X goes first
    var playerImage: UIImage = #imageLiteral(resourceName: "X")
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    
    @IBAction func action(_ sender: UIButton) {
     
        if(activePlayer == 1)
        {
            playerImage = #imageLiteral(resourceName: "X")
            sender.setImage(playerImage, for: UIControlState())
            activePlayer = 2
        }
        else
        {
            playerImage = #imageLiteral(resourceName: "O")
            sender.setImage(playerImage, for: UIControlState())
            activePlayer = 1
        }
    }
    
    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}

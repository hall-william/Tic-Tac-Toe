//
//  AIController.swift
//  Tic-Tac-Toe
//
//  Created by William Hall on 4/20/17.
//  Copyright © 2017 William Hall. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class AIController: UIViewController{
    var activePlayer = 1 //X goes first
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0] //array to hold each space on the board
    var activeGame = true
    
    //all of the winning combinations
    let winningCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    
    
    @IBOutlet weak var winningLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func action(_ sender: UIButton) {
        
        //if the space is empty
        if(gameState[sender.tag-1] == 0 && activeGame && activePlayer == 1)
        {
            //update the sapces
            gameState[sender.tag-1] = activePlayer
            
            if(activePlayer == 1)//player1
            {
                sender.setImage(#imageLiteral(resourceName: "X"), for: UIControlState())
                activePlayer = 2
            }
            else//player2
            {
                sender.setImage(#imageLiteral(resourceName: "O"), for: UIControlState())
                activePlayer = 1
            }
        }
        
        for combination in winningCombinations
        {
            if(gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]])
            {
                activeGame = false
                if (gameState[combination[0]] == 1) {
                    //X won
                    winningLabel.text = "Player 1 Wins!!!"
                }
                else
                {
                    //O Won
                    winningLabel.text = "Player 2 Wins!!!"
                }
                
                winningLabel.isHidden = false
                resetButton.isHidden = false
            }
            
            activeGame = false
            
            for i in gameState
            {
                if i == 0
                {
                    activeGame = true
                    break
                }
            }
            
            if(activeGame == false)
            {
                winningLabel.text = "It's a Draw!!!"
                winningLabel.isHidden = false
                resetButton.isHidden = false
            }
        }
    }
    
    
    @IBOutlet weak var resetButton: UIButton!
    
    @IBAction func reset(_ sender: UIButton) {
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        activeGame = true
        activePlayer = 1
        winningLabel.isHidden = true
        resetButton.isHidden = true
        
        for i in 1...9
        {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControlState())
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

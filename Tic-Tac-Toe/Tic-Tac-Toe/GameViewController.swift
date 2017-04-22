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


/// This class is responsible for the GameVsFriend UIViewController
class GameViewController: UIViewController {

    ///The active player
    var activePlayer = 1 //X goes first
    
    ///An array to hold the squares on the gameboard
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0] //array to hold each space on the board
    
    ///A boolean to hold if the game is currently ongoing
    var activeGame = true
    
    //all of the winning combinations
    let winningCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    
    ///An outlet for the label that displays the winner of the game.
    @IBOutlet weak var winningLabel: UILabel!
    
    ///Called after the view has loaded
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    /**
      This method is responsible for recieving all of the input from the buttons on the gameboard.
       - parameters:
           - sender: the button that was pressed.
     */
    @IBAction func action(_ sender: UIButton) {
     
        //if the space is empty
        if(gameState[sender.tag-1] == 0 && activeGame)
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
        
        //parse through the winning combinations
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
            
            //check each board space
            for i in gameState
            {
                //if there are still empty spaces
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
    
    ///An outlet for the reset button in the UI
    @IBOutlet weak var resetButton: UIButton!
    
    /// This method handles resetting the game.
    ///
    /// - Parameter sender: The reset button in the UI.
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

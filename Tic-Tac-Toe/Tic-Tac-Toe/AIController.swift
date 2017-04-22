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
        
        //if the space is empty and it is the user's turn
        if(gameState[sender.tag-1] == 0 && activeGame && activePlayer == 1)
        {
            //update the sapces
            gameState[sender.tag-1] = activePlayer
            
            //make sure it is the user's turn
            if(activePlayer == 1)//player1
            {
                //change image to X
                sender.setImage(#imageLiteral(resourceName: "X"), for: UIControlState())
                activePlayer = 2
            }
            
            print("\nPlayer 1 Turn")//delete this later
            for i in 0 ..< 9
            {
                print(i,": " , gameState[i])//delete this later
            }
        }
        
        //pasre array for winning combination
        for combination in winningCombinations
        {
            //check for 3 in a row
            if(gameState[combination[0]] == 1 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]])
            {
                activeGame = false
                if (gameState[combination[0]] == 1) {
                    //X won
                    winningLabel.text = "You Win!!!"
                }
                
                //allow for reset
                winningLabel.isHidden = false
                resetButton.isHidden = false
            }
            
            activeGame = false
            
            for i in gameState
            {
                //check to see if any blank squares
                if i == 0
                {
                    activeGame = true//keep playing
                    break
                }
            }
            
            //if no blank squares
            if(activeGame == false)
            {
                winningLabel.text = "It's a Draw!!!"
                winningLabel.isHidden = false
                resetButton.isHidden = false
            }
        }
        
        //Computer's Turn
        AITurn()
    }
    
    ///A function the is responsible for handling the AI's turn.
    func AITurn()
    {
        //Code for AI
        if(activeGame && activePlayer == 2)
        {
            //choose a random space that hasn't alread been selected
            var selection = Int(arc4random_uniform(9))+1
            while gameState[selection-1] != 0{
                selection = Int(arc4random_uniform(9))+1
            }
            
            //change gameState to reflect AI's choice
            gameState[selection-1] = 2
            
            //change square on gameboard to O
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
                // Put your code which should be executed with a delay here
                let tmpButton = self.view.viewWithTag(selection) as? UIButton
                tmpButton?.setImage(#imageLiteral(resourceName: "O"), for: UIControlState())
            })
            
            //pasre array for winning combination
            for combination in winningCombinations
            {
                //check for 3 in a row
                if(gameState[combination[0]] == 2 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]])
                {
                    activeGame = false
                    if (gameState[combination[0]] == 2) {
                        //O won
                        winningLabel.text = "You Lose :("
                    }
                    
                    //allow for reset
                    winningLabel.isHidden = false
                    resetButton.isHidden = false
                }
                
                activeGame = false
                
                for i in gameState
                {
                    //check to see if any blank squares
                    if i == 0
                    {
                        activeGame = true//keep playing
                        break
                    }
                }
                
                //if no blank squares
                if(activeGame == false)
                {
                    winningLabel.text = "It's a Draw!!!"
                    winningLabel.isHidden = false
                    resetButton.isHidden = false
                }
            }
            
            print("Player 2 Turn")//delete this later
            print(selection)
            for i in 0 ..< 9
            {
                print(i,": " ,gameState[i])//delete this later
            }
        }
        
        //change back to user's turn
        activePlayer = 1
    }
    
    
    /// An outlet for the reset button in the UI.
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

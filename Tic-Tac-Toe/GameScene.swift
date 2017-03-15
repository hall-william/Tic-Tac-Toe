//
//  GameScene.swift
//  Tic-Tac-Toe
//
//  Created by William Hall on 3/8/17.
//
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        let board = SKSpriteNode(imageNamed: "Board.png")
        board.position = CGPoint(x: size.width/2, y: size.height/2)
        board.size = self.frame.size
        addChild(board)
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
}

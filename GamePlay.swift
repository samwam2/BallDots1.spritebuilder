//
//  GamePlay.swift
//  BallDots
//
//  Created by Sam Showalter on 7/14/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation
class GamePlay: CCScene, CCPhysicsCollisionDelegate {
    //all vars here
    weak var dot: CCNode!
    weak var ball: CCNode!
    weak var Win: CCNodeColor!
    weak var gamePhysicsNode: CCPhysicsNode!
    var aGridArray:[[CGPoint]]?
    
    
    //all lets here
    

    func didLoadFromCCB() {
        //var grid = Grid(columns: 10, rows: 10, spacing: 10)
//        ball.physicsBody
        
        var grid = CCBReader.load("Grid") as! Grid
        aGridArray = grid.setAll(10, rows: 10, spacing: 50)
        for pointArray in aGridArray! {
            for point in pointArray {
                var temporaryDot = CCBReader.load("Dot")
                temporaryDot.position = point
                gamePhysicsNode.addChild(temporaryDot)
                //println("added dot at position \(temporaryDot.position)")
                
            }
        }
        //CCBReader.load("Dot")
        userInteractionEnabled = true
        //gamePhysicsNode.debugDraw = true
    
        gamePhysicsNode.collisionDelegate = self
        
    }

    func retry() {
        let gameplayScene = CCBReader.loadAsScene("GamePlay")
        CCDirector.sharedDirector().presentScene(gameplayScene)
        
    }

    func detectTouch(touch: CCTouch) {
        var currentTouch = convertToNodeSpace(touch.locationInWorld())
        
//        for dotGlobal in dots {
//            
//            var dots = convertToNodeSpace(dotGlobal.position)
//            
//        }
        
    }
    
    func Back() {
        let backscene = CCBReader.loadAsScene("MainScene")
        CCDirector.sharedDirector().presentScene(backscene)
    }
    
    
    //last closing bracket all new code ^
}
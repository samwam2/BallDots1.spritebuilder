//
//  levelThree.swift
//  BallDots
//
//  Created by Sam Showalter on 7/26/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class levelThree: CCNode, CCPhysicsCollisionDelegate {
    weak var gamePhysicsNode: CCPhysicsNode!
    weak var Ball: CCNode!
    
    func didLoadFromCCB() {
        userInteractionEnabled = true
        gamePhysicsNode.collisionDelegate = self
        //CMMotionManager
        
    }
    func winThing() {
        let winscreenwin = CCBReader.loadAsScene("winScreenB")
        CCDirector.sharedDirector().presentScene(winscreenwin)
    }
    
    
    
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, Ball: CCNode!, win: CCNode!) -> ObjCBool {
        winThing()
        return true
        
    }
    
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, Ball: CCNode!, lose: CCNodeColor!) -> ObjCBool {
        retry()
        return true
        
    }
    
    func back() {
        let backScene = CCBReader.loadAsScene("LevelScene")
        CCDirector.sharedDirector().presentScene(backScene)
    }
    
    func retry() {
        let retrylevelScene = CCBReader.loadAsScene("Levels/levelThree")
        CCDirector.sharedDirector().presentScene(retrylevelScene)
    }

}
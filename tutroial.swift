//
//  tutroial.swift
//  BallDots
//
//  Created by ShowalterS18 on 2/9/16.
//  Copyright © 2016 Sam Showalter. All rights reserved.
//

import Foundation
import Mixpanel

class tutroial: CCScene, CCPhysicsCollisionDelegate {
    
    //all vars
    weak var ballObj: CCNode!
    weak var basket: CCNode!
    weak var tutPhyNode: CCPhysicsNode!
    
    //rest of code
    
    func didLoadFromCCB() {
        userInteractionEnabled = true
        tutPhyNode.collisionDelegate = self
        mixpanel.track("Played tutroial")

        
    }
    
    func LoadWin() {
        let gameplayScene = CCBReader.loadAsScene("winScreenB")
        CCDirector.sharedDirector().presentScene(gameplayScene)
    }
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, ballThing: CCNode!, basket: CCNode!) -> ObjCBool {
        
        LoadWin()
        print("Good thing happend")
        return true
    }
    
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, ballThing: CCNode!, resetBall: CCNodeColor!) -> ObjCBool {
        
       // ballObj.position = CGPoint(x: 40.9, y: 38.4)
        ballObj.position = CGPoint(x: 161, y: 184) //375.9
        
        print("BAll thing failed")
        print("Ball postion:")
        print(ballObj.position)
        
        return true
    }
    //Mixpanel code below this
    let mixpanel = Mixpanel.sharedInstanceWithToken("78c883b9d8e9f8c5306e60c8b0b72833")
  
    
    
    
} //Last closing brace
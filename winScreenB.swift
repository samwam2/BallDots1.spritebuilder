//
//  winScreen.swift
//  BallDots
//
//  Created by Sam Showalter on 7/24/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation
import Mixpanel

class winScreenB: CCNode { // CCNode
    
//    var SceneGrid = CCBReader.load("GridScene") as! GridScene
    let mixpanel = Mixpanel.sharedInstanceWithToken("78c883b9d8e9f8c5306e60c8b0b72833")

    
    func didLoadFromCCB() {
        userInteractionEnabled = true
        mixpanel.track("Went to winScreenB ")
        
    }
    
    func Next() {
        let nextScene = CCBReader.loadAsScene("MainScene")
        CCDirector.sharedDirector().presentScene(nextScene)
    }
    

    
    

}

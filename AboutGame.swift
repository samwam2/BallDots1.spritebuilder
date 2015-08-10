//
//  AboutGame.swift
//  BallDots
//
//  Created by Sam Showalter on 7/22/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class AboutGame: CCNode {
    
    func didLoadFromCCB() {
        userInteractionEnabled = true
    }
    
    func MainMenu() {
        let mainmenuScene = CCBReader.loadAsScene("MainScene")
        CCDirector.sharedDirector().presentScene(mainmenuScene)
    }
    
    
   
}
//
//  GamePlay.swift
//  BallDots
//
//  Created by Sam Showalter on 7/14/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//
import Foundation
import UIKit
class MainScene: CCNode {
    //all vars here
    
    
    //all lets here
    
    
    func didLoadFromCCB() {
        userInteractionEnabled = true
    }
    func StartGame() {
        let gameplayScene = CCBReader.loadAsScene("GamePlay")
        CCDirector.sharedDirector().presentScene(gameplayScene)
    }
    
    func AboutTheGame() {
        let aboutthegameScene = CCBReader.loadAsScene("AboutGame")
        CCDirector.sharedDirector().presentScene(aboutthegameScene)
    }
    
    func LevelMenu() {
        let levelmenuScene = CCBReader.loadAsScene("LevelScene")
        CCDirector.sharedDirector().presentScene(levelmenuScene)
    }
    
    //last closing bracket all new code ^
}

//
//  LevelScene.swift
//  BallDots
//
//  Created by Sam Showalter on 7/23/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class LevelScene: CCNode {
    
    func MainMenu() {
        let mainmenuscene = CCBReader.loadAsScene("MainScene")
        CCDirector.sharedDirector().presentScene(mainmenuscene)
    }
    
    func Level1() {
        let level1Scene = CCBReader.loadAsScene("Levels/levelOne")
        CCDirector.sharedDirector().presentScene(level1Scene)
    }
    func Level2() {
        let level1Scene = CCBReader.loadAsScene("Levels/levelTWo")
        CCDirector.sharedDirector().presentScene(level1Scene)
    }
    func Level3() {
        let level1Scene = CCBReader.loadAsScene("Levels/levelOne")
        CCDirector.sharedDirector().presentScene(level1Scene)
    }
    func Level4() {
        let level1Scene = CCBReader.loadAsScene("Levels/levelOne")
        CCDirector.sharedDirector().presentScene(level1Scene)
    }
}


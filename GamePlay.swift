//
//  GamePlay.swift
//  BallDots
//
//  Created by Sam Showalter on 7/14/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class GamePlay: CCNode {
    //all vars here
    
    weak var Dot:CCNodeColor!

    
    
    
    //all lets here

    func didLoadFromCCB() {
        var grid = Grid(columns: 10, rows: 10, spacing: 10)
        
        setupGrid()
        
        userInteractionEnabled = true
    }
    func setupGrid() {
        userInteractionEnabled = true
        var dot = CCBReader.load("Dot")
        dot.position = ccp(100, 100)
        addChild(dot)
    }

    
    
    
    
    
    //last closing bracket all new code ^ 
}
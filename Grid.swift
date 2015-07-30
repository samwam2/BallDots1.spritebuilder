//
//  Grid.swift
//  BallDots
//
//  Created by Sam Showalter on 7/15/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class Grid: CCNode {
    //(JS) Made this a ccnode
    //all vars here


    var grid: [[CGPoint]] = [[CGPoint]]()
    var columns: Int = 0
    var rows: Int = 0
    var spacing: Int = 0
    // (JS) changed to vars
    
//    override init() {
//        super.init()
//    }

    
    
    func setAll(columns: Int, rows: Int, spacing: Int) -> [[CGPoint]] {
        self.columns = columns
        self.rows = rows
        self.spacing = spacing
        
        for row in 0..<self.rows {
            grid.append([])
            for column in 0..<self.columns{
                var point = CGPoint(x: CGFloat(row * spacing), y: CGFloat(column * spacing))
                grid[row].append(point)
            }
        }
        
        return grid

    }
    
    
    
    //last closing bracket all new code ^
}

////var grid = Grid(columns: 10, rows: 10, spacing: 10)
////        ball.physicsBody
//
//var grid = CCBReader.load("Grid") as! Grid
//aGridArray = grid.setAll(10, rows: 10, spacing: 50)
//for pointArray in aGridArray! {
//    for point in pointArray {
//        var temporaryDot = CCBReader.load("Dot")
//        temporaryDot.position = point
//        gamePhysicsNode.addChild(temporaryDot)
//        //println("added dot at position \(temporaryDot.position)")
//        
//    }
//}
////CCBReader.load("Dot")
//func detectTouch(touch: CCTouch) {
//    var currentTouch = convertToNodeSpace(touch.locationInWorld())

//        for dotGlobal in dots {
//
//            var dots = convertToNodeSpace(dotGlobal.position)
//
//        }
//var aGridArray:[[CGPoint]]?







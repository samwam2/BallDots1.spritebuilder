//
//  Grid.swift
//  BallDots
//
//  Created by Sam Showalter on 7/15/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class GridPoint {
    var isBlackDot = false
    var point: CGPoint?
    
    init(x: CGFloat, y: CGFloat, isBlackDot: Bool) {
        point = CGPoint(x: x, y: y)
        self.isBlackDot = isBlackDot
    }
    
    func isEqual(comparePoint: GridPoint) -> Bool {
        return self.point?.x == comparePoint.point?.x && self.point?.y == comparePoint.point?.y
    }
}

class Grid: CCNode {
    //(JS) Made this a ccnode
    //all vars here


    var grid = [[GridPoint]]()
    var columns: Int = 0
    var rows: Int = 0
    var spacing: Int = 0
    // (JS) changed to vars
    
//    override init() {
//        super.init()
//    }

    
    
    func setAll(columns: Int, rows: Int, spacing: Int) -> [[GridPoint]] { //GridPoint
        self.columns = columns
        self.rows = rows
        self.spacing = spacing
        
        for row in 0..<self.rows {
            grid.append([])
            for column in 0..<self.columns{
                let point = GridPoint(x: CGFloat(row * spacing), y: CGFloat(column * spacing), isBlackDot: false)
                grid[row].append(point)
            }
        }
        
        return grid //grid

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







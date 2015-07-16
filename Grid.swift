//
//  Grid.swift
//  BallDots
//
//  Created by Sam Showalter on 7/15/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class Grid {
    //all vars here


    var grid: [[CGPoint]] = [[CGPoint]]()
    let columns: Int
    let rows: Int
    let spacing: Int
    
    
    init(columns: Int, rows: Int, spacing: Int) {
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
    }
    
    
    
    //last closing bracket all new code ^
}






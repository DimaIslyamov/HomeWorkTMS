//
//  ChessBoardController+HittingFunc.swift
//  homeWorkLesson10
//
//  Created by Moobat on 25.11.21.
//

import UIKit

extension ChessBoardController {
    func forHittingCheckers() {
       saveBatch()
        
        let arrayOfCheckers = cellCheckers
        
        if current == .white {
            
            arrayOfCheckers.forEach { (checker) in
                
                if checker.tagChecker! < 12 {
                    if checker.queen == false {
                        arrayOfCheckers.forEach { (hittingChecker) in
                            
                            if hittingChecker.tagChecker! >= 12 && (hittingChecker.tagCell == checker.tagCell! + 9 || hittingChecker.tagCell == checker.tagCell! + 7 || hittingChecker.tagCell == checker.tagCell! - 9 || hittingChecker.tagCell == checker.tagCell! - 7) {
                                
                                chessboard.subviews.forEach { (cell) in
                                    
                                    if cell.subviews.isEmpty, cell.backgroundColor == .black, cell.tag == checker.tagCell! - 2 * (checker.tagCell! - hittingChecker.tagCell!) {
                                        
                                        cellsMove.append(cell)
                                        canFight = true
                                        mass.append((checker: checker.tagChecker!, cell: cell.tag, checkerBeaten: hittingChecker.tagChecker!))
                                    }
                                }
                            }
                        }
                    } else {
                        forHittingWhiteQueen(queenChecker: checker, arrayOfChecker: arrayOfCheckers)
                    }
                }
            }
        } else {
            
            arrayOfCheckers.forEach { (checker) in
                
                if checker.tagChecker! >= 12 {
                    if checker.queen == false {
                        arrayOfCheckers.forEach { (hittingChecker) in
                            
                            if hittingChecker.tagChecker! < 12 && (hittingChecker.tagCell == checker.tagCell! + 9 || hittingChecker.tagCell == checker.tagCell! + 7 || hittingChecker.tagCell == checker.tagCell! - 9 || hittingChecker.tagCell == checker.tagCell! - 7) {
                                
                                chessboard.subviews.forEach { (cell) in
                                    
                                    if cell.subviews.isEmpty, cell.backgroundColor == .black, cell.tag == checker.tagCell! - 2 * (checker.tagCell! - hittingChecker.tagCell!) {
                                        
                                        cellsMove.append(cell)
                                        canFight = true
                                        mass.append((checker: checker.tagChecker!, cell: cell.tag, checkerBeaten: hittingChecker.tagChecker!))
                                    }
                                }
                            }
                        }
                    } else {
                        forHittingBlackQueen(queenChecker: checker, arrayOfChecker: arrayOfCheckers)
                    }
                }
            }
        }
    }
    
    
    
    func forHittingWhiteQueen(queenChecker: CellCheckers, arrayOfChecker: [CellCheckers]) {
        var massTuplForQeen: [(qeen: Int, checkerForHitting: Int, cell: Int)] = []
        
        var diff1 = queenChecker.tagCell! - 9
        var diff2 = queenChecker.tagCell! - 7
        var diff3 = queenChecker.tagCell! + 7
        var diff4 = queenChecker.tagCell! + 9
        
        while diff1 > 0 || diff2 > 0 || diff3 < 63 || diff4 < 63 {
            arrayOfChecker.forEach { (hittingChecker) in
                
                if hittingChecker.tagChecker! >= 12 && (hittingChecker.tagCell! == diff1 || hittingChecker.tagCell! == diff2 || hittingChecker.tagCell! == diff3 || hittingChecker.tagCell! == diff4) {
                    
                    var steps: Int = 0
                    
                    if (queenChecker.tagCell! - hittingChecker.tagCell!) < 0,
                       (queenChecker.tagCell! - hittingChecker.tagCell!) % 7 == 0 {
                        steps = -7
                    }
                    if (queenChecker.tagCell! - hittingChecker.tagCell!) > 0,
                       (queenChecker.tagCell! - hittingChecker.tagCell!) % 7 == 0 {
                        steps = 7
                    }
                    if (queenChecker.tagCell! - hittingChecker.tagCell!) < 0,
                       (queenChecker.tagCell! - hittingChecker.tagCell!) % 9 == 0 {
                        steps = -9
                    }
                    if (queenChecker.tagCell! - hittingChecker.tagCell!) > 0,
                       (queenChecker.tagCell! - hittingChecker.tagCell!) % 9 == 0 {
                        steps = 9
                    }
                    
                    chessboard.subviews.forEach { (cell) in
                        if cell.subviews.isEmpty,
                           cell.backgroundColor == .black,
                           cell.tag == hittingChecker.tagCell! - steps {
                            
                            cellsMove.append(cell)
                            canFight = true
                            
                            mass.append((checker: queenChecker.tagChecker!, cell: cell.tag, checkerBeaten: hittingChecker.tagChecker!))
                            massTuplForQeen.append((qeen: queenChecker.tagChecker!, checkerForHitting: hittingChecker.tagChecker!, cell: cell.tag))
                            
                            var nextCell: Int = cell.tag - steps
                            
                            while nextCell > -1, nextCell < 64 {
                                
                                var findNextCell: Bool = false
                                
                                chessboard.subviews.forEach { cell in
                                    if cell.tag == nextCell, cell.subviews.isEmpty, cell.backgroundColor == .black {
                                        
                                        cellsMove.append(cell)
                                        
                                        mass.append((checker: queenChecker.tagChecker!, cell: cell.tag, checkerBeaten: hittingChecker.tagChecker!))
                                        massTuplForQeen.append((qeen: queenChecker.tagChecker!, checkerForHitting: hittingChecker.tagChecker!, cell: cell.tag))
                                        
                                        findNextCell = true
                                        nextCell = nextCell - steps
                                    }
                                }
                                if findNextCell == false {
                                    nextCell = 65
                                }
                            }
                        }
                    }
                }
            }
            diff1 -= 9
            diff2 -= 7
            diff3 += 7
            diff4 += 9
        }
    }
    
    
    
    func forHittingBlackQueen(queenChecker: CellCheckers, arrayOfChecker: [CellCheckers]) {
        var massTuplForQeen: [(qeen: Int, checkerForHitting: Int, cell: Int)] = []
        
        var diff1 = queenChecker.tagCell! - 9
        var diff2 = queenChecker.tagCell! - 7
        var diff3 = queenChecker.tagCell! + 7
        var diff4 = queenChecker.tagCell! + 9
        
        while diff1 > 0 || diff2 > 0 || diff3 < 63 || diff4 < 63 {
            arrayOfChecker.forEach { (hittingChecker) in
                
                if hittingChecker.tagChecker! < 12 && (hittingChecker.tagCell! == diff1 || hittingChecker.tagCell! == diff2 || hittingChecker.tagCell! == diff3 || hittingChecker.tagCell! == diff4) {
                    
                    var steps: Int = 0
                    
                    if (queenChecker.tagCell! - hittingChecker.tagCell!) < 0,
                       (queenChecker.tagCell! - hittingChecker.tagCell!) % 7 == 0 {
                        steps = -7
                    }
                    if (queenChecker.tagCell! - hittingChecker.tagCell!) > 0,
                       (queenChecker.tagCell! - hittingChecker.tagCell!) % 7 == 0 {
                        steps = 7
                    }
                    if (queenChecker.tagCell! - hittingChecker.tagCell!) < 0,
                       (queenChecker.tagCell! - hittingChecker.tagCell!) % 9 == 0 {
                        steps = -9
                    }
                    if (queenChecker.tagCell! - hittingChecker.tagCell!) > 0,
                       (queenChecker.tagCell! - hittingChecker.tagCell!) % 9 == 0 {
                        steps = 9
                    }
                    
                    chessboard.subviews.forEach { (cell) in
                        if cell.subviews.isEmpty,
                           cell.backgroundColor == .black,
                           cell.tag == hittingChecker.tagCell! - steps {
                            
                            cellsMove.append(cell)
                            canFight = true
                            
                            mass.append((checker: queenChecker.tagChecker!, cell: cell.tag, checkerBeaten: hittingChecker.tagChecker!))
                            massTuplForQeen.append((qeen: queenChecker.tagChecker!, checkerForHitting: hittingChecker.tagChecker!, cell: cell.tag))
                            
                            var nextCell: Int = cell.tag - steps
                            
                            while nextCell > -1, nextCell < 64 {
                                var findNextCell: Bool = false
                                
                                chessboard.subviews.forEach { cell in
                                    if cell.tag == nextCell, cell.subviews.isEmpty, cell.backgroundColor == .black {
                                        
                                        cellsMove.append(cell)
                                        
                                        mass.append((checker: queenChecker.tagChecker!, cell: cell.tag, checkerBeaten: hittingChecker.tagChecker!))
                                        massTuplForQeen.append((qeen: queenChecker.tagChecker!, checkerForHitting: hittingChecker.tagChecker!, cell: cell.tag))
                                        
                                        findNextCell = true
                                        nextCell = nextCell - steps
                                    }
                                }
                                if findNextCell == false {
                                    nextCell = 65
                                }
                            }
                        }
                    }
                }
            }
            diff1 -= 9
            diff2 -= 7
            diff3 += 7
            diff4 += 9
        }
    }
}

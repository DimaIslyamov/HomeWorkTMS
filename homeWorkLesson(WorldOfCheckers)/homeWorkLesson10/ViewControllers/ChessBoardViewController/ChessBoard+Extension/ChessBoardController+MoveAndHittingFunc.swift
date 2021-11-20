//
//  ChessBoardController+MoveAndHittingFunc.swift
//  homeWorkLesson10
//
//  Created by Moobat on 9.11.21.
//

import UIKit

extension ChessBoardController {
    // MARK: - Moving метод
    
    func forMovingCheckers(for checker: UIView) {
        let cell = checker.superview
        chessboard.subviews.forEach { cellForMove in
            guard cellForMove.subviews.isEmpty, cellForMove.backgroundColor == .black, let startCell = cell else { return }
            let diff1 = current == .white ? 7 : -7
            let diff2 = current == .white ? 9 : -9
            if cellForMove.tag == startCell.tag + diff1 || cellForMove.tag == startCell.tag + diff2 {
//                cellForMove.layer.borderColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
//                cellForMove.layer.borderWidth = 3
                cellsMove.append(cellForMove)
            }
        }
    }
    
    
    
    // MARK: - Hitting метод
    
    func forHittingCheckers() {
        saveBatch()
        
        let arrayOfChecker = cellCheckers
        var movingsCheckers: CellCheckers? = nil
        var hittingsCheckers: CellCheckers? = nil
        
        if current == .white {
            arrayOfChecker.forEach { (checker) in
                movingsCheckers = (checker.tagChecker! < 12) ? checker : nil
                arrayOfChecker.forEach { (hittingChecker) in
                    
                    guard let movingChecker = movingsCheckers else { return }
                    
                    if hittingChecker.tagChecker! >= 12 && (hittingChecker.tagCell == movingChecker.tagCell! + 9 || hittingChecker.tagCell == movingChecker.tagCell! + 7 || hittingChecker.tagCell == movingChecker.tagCell! - 9 || hittingChecker.tagCell == movingChecker.tagCell! - 7) {
                        
                        hittingsCheckers = hittingChecker
                        
                        chessboard.subviews.forEach { (cell) in
                            guard let checkerForHitting = hittingsCheckers else { return }
                            
                            if cell.subviews.isEmpty, cell.backgroundColor == .black, cell.tag == movingChecker.tagCell! - 2 * (movingChecker.tagCell! - hittingChecker.tagCell!) {
                                
                                cellsMove.append(cell)
                                canFight = true
                                mass.append((checker: movingChecker.tagChecker!, cell: cell.tag, checkerBeaten: checkerForHitting.tagChecker!))
                            }
                        }
                    }
                }
            }
            
        } else {
            arrayOfChecker.forEach { (checker) in
                movingsCheckers = (checker.tagChecker! >= 12) ? checker : nil
                arrayOfChecker.forEach { (hittingChecker) in
                    
                    guard let movingChecker = movingsCheckers else { return }
                    
                    if hittingChecker.tagChecker! < 12 && (hittingChecker.tagCell == movingChecker.tagCell! + 9 || hittingChecker.tagCell == movingChecker.tagCell! + 7 || hittingChecker.tagCell == movingChecker.tagCell! - 9 || hittingChecker.tagCell == movingChecker.tagCell! - 7) {
                        
                        hittingsCheckers = hittingChecker
                        
                        chessboard.subviews.forEach { (cell) in
                            guard let checkerForHitting = hittingsCheckers else { return }
                            
                            if cell.subviews.isEmpty, cell.backgroundColor == .black, cell.tag == movingChecker.tagCell! - 2 * (movingChecker.tagCell! - checkerForHitting.tagCell!) {
                                
                                cellsMove.append(cell)
                                canFight = true
                                mass.append((checker: movingChecker.tagChecker!, cell: cell.tag, checkerBeaten: checkerForHitting.tagChecker!))
                            }
                        }
                    }
                }
            }
        }
    }
    
    
    // MARK: - Func for Winner
    
    func forCheckerWinner() {
        saveBatch()
//        guard let vc = getViewController(from: "ChessBoard") as? ChessBoardController  else { return }
        let arrayOfCheckers = cellCheckers
        var playerWhiteCheckers: Int = 0
        var playerBlackCheckers: Int = 0
        var playerWhoIsAWinner: String = ""
        
        arrayOfCheckers.forEach { (checker) in
            guard let checkerTag = checker.tagChecker, checkerTag < 12 else { return playerBlackCheckers += 1 }
            playerWhiteCheckers += 1
        }
        
        playerWhoIsAWinner = ( playerWhiteCheckers == 0) ? "\(player1)" : ""
        playerWhoIsAWinner = ( playerBlackCheckers == 0) ? "\(player2)" : ""
        
        if playerWhoIsAWinner != "" {
            timer?.invalidate()
            timer = nil
            
            presentAlertController(with: "The Winner is \(playerWhoIsAWinner)",
                                   massage: "Match time: \(countMin)min \(countSec)sec ",
                                   actions: UIAlertAction(title: "Заново",
                                                          style: .default,
                                                          handler: { _ in
                                                            
                                                            
                                                          }),
                                   UIAlertAction(title: "Закончить",
                                                 style: .default,
                                                 handler: { _ in
                                                    try? self.fileManager.removeItem(at: self.documentDirectory.appendingPathComponent(Keys.cellAndChecker.rawValue))
                                                    self.removeDataFromUserDefaults()
                                                    self.navigationController?.popViewController(animated: true)
                                                 }))
        }
    }
}

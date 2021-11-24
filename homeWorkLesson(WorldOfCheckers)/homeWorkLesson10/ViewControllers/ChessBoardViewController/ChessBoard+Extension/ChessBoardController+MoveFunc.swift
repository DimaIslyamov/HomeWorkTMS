//
//  ChessBoardController+MoveFunc.swift
//  homeWorkLesson10
//
//  Created by Moobat on 9.11.21.
//

import UIKit

extension ChessBoardController {
    func forMovingCheckers(for checker: UIView) {
        let cell = checker.superview
        
        guard checker.subviews.isEmpty else { forMoveQueen(queen: checker)
            return }
        
        chessboard.subviews.forEach { cellForMove in
            guard cellForMove.subviews.isEmpty, cellForMove.backgroundColor == .black, let startCell = cell else { return }
            
            let diff1 = current == .white ? 7 : -7
            let diff2 = current == .white ? 9 : -9
            
            if cellForMove.tag == startCell.tag + diff1 || cellForMove.tag == startCell.tag + diff2 {
                cellsMove.append(cellForMove)
            }
        }
    }
    
    
    func forMoveQueen(queen: UIView) {
        let cell = queen.superview
        
        let step1: Int = -7
        let step2: Int = -9
        let step3: Int = 7
        let step4: Int = 9
        
        chessboard.subviews.forEach { cellMoove in
            guard cellMoove.subviews.isEmpty, cellMoove.backgroundColor == .black,  let startCell = cell else { return }
            
            if cellMoove.tag == startCell.tag - step1 || cellMoove.tag == startCell.tag - step2 || cellMoove.tag == startCell.tag - step3 || cellMoove.tag == startCell.tag - step4 {
                
                cellsMove.append(cellMoove)
                
                let step: Int = startCell.tag - cellMoove.tag
                var nextCell: Int = cellMoove.tag - step
                
                while nextCell > -1, nextCell < 64 {
                    var findNextCell: Bool = false
                    chessboard.subviews.forEach { cell in
                        if cell.tag == nextCell, cell.subviews.isEmpty, cell.backgroundColor == .black {
                            
                            cellsMove.append(cell)
                            
                            findNextCell = true
                            nextCell = nextCell - step
                        }
                    }
                    if findNextCell == false {
                        nextCell = 65
                    }
                }
            }
        }
    }
    
    
    func createQueenOfCheckers() {
        let arrayOfCheckers = saveBatch()
        var checkerTag: Int? = nil
        var checkerTagBlack: Int? = nil
        
        arrayOfCheckers.forEach { (checker) in
            guard checker.queen == false else { return }
            
            if (checker.tagChecker! < 12 && (checker.tagCell == 62 || checker.tagCell == 60 || checker.tagCell! == 58 || checker.tagCell == 56)) {
                checkerTagBlack = checker.tagCell
                
            } else if (checker.tagChecker! >= 12 && (checker.tagCell == 1 || checker.tagCell == 3 || checker.tagCell! == 5 || checker.tagCell == 7)) {
                checkerTag = checker.tagCell
            }
            
            if let cell = chessboard.subviews.first(where: {$0.tag == checkerTag}) {
                cell.subviews.forEach { (checker) in
                    let queen = UIImageView(frame: CGRect(x: 0, y: 0, width: checker.frame.width, height: checker.frame.height))
                    queen.image = UIImage(named: "Orda")
                    checker.addSubview(queen)
                }
            } else if let cell = chessboard.subviews.first(where: {$0.tag == checkerTagBlack}) {
                cell.subviews.forEach { (checker) in
                    let queen = UIImageView(frame: CGRect(x: 0, y: 0, width: checker.frame.width, height: checker.frame.height))
                    queen.image = UIImage(named: "Aliance")
                    checker.addSubview(queen)
                }
            }
        }
    }
    
    
    
    
    
    // MARK: - Func for Winner
    
//    func forCheckerWinner() {
//        //        saveBatch()
//        //        guard let vc = getViewController(from: "ChessBoard") as? ChessBoardController  else { return }
//        let arrayOfCheckers = cellCheckers
//        var playerWhiteCheckers: Int = 0
//        var playerBlackCheckers: Int = 0
//        var playerWhoIsAWinner: String = ""
//
//        arrayOfCheckers.forEach { (checker) in
//            guard let checkerTag = checker.tagChecker,
//                  checkerTag < 12 else { return playerWhiteCheckers += 1 }
//            playerBlackCheckers += 1
//        }
//
//        playerWhoIsAWinner = ( playerWhiteCheckers == 0) ? "\(player1)" : ""
//        playerWhoIsAWinner = ( playerBlackCheckers == 0) ? "\(player2)" : ""
//
//        if playerWhoIsAWinner != "" {
//            timer?.invalidate()
//            timer = nil
//
//            presentAlertController(with: "The Winner is \(playerWhoIsAWinner)",
//                                   massage: "Match time: \(countMin)min \(countSec)sec ",
//                                   actions: UIAlertAction(title: "Заново",
//                                                          style: .default,
//                                                          handler: { _ in
//
//                                                            // ????
//
//                                                          }),
//                                   UIAlertAction(title: "Закончить",
//                                                 style: .default,
//                                                 handler: { _ in
//                                                    try? self.fileManager.removeItem(at: self.documentDirectory.appendingPathComponent(Keys.cellAndChecker.rawValue))
//                                                    self.removeDataFromUserDefaults()
//                                                    self.navigationController?.popViewController(animated: true)
//                                                 }))
//        }
//    }
}

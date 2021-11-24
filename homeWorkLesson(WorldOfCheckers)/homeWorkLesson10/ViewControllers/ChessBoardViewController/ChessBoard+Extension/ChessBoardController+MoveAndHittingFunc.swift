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
    
    
    func forHittingChekers() {
        let arrayOfCheckers = saveBatch()
        
        if current == .white {
            forHittingWhiteCheckers(arrayOfCheckers)
        } else {
            forHittingBlackCheckers(arrayOfCheckers)
        }
    }
    
    // MARK: - Hitting метод
    
    func forHittingWhiteCheckers(_ arrayOfCheckers: [CellCheckers]) {
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
    }
    
    func forHittingBlackCheckers(_ arrayOfCheckers: [CellCheckers]) {
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
    
    
    func forMoveQueen(queen: UIView) {
        let cell = queen.superview
        
        let step1: Int = -7
        let step2: Int = -9
        let step3: Int = 7
        let step4: Int = 9
        
        chessboard.subviews.forEach { cellMoove in
            guard cellMoove.subviews.isEmpty, cellMoove.backgroundColor == .black,  let startCell = cell else { return }
            
            if cellMoove.tag == startCell.tag - step1 || cellMoove.tag == startCell.tag - step2 || cellMoove.tag == startCell.tag - step3 || cellMoove.tag == startCell.tag - step4 {
                cellMoove.layer.borderWidth = 3
                cellMoove.layer.borderColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
                cellsMove.append(cellMoove)
                
                let step: Int = startCell.tag - cellMoove.tag
                var nextCell: Int = cellMoove.tag - step
                
                while nextCell > 0, nextCell < 64 {
                    var findNextCell: Bool = false
                    chessboard.subviews.forEach { cell in
                        if cell.tag == nextCell, cell.subviews.isEmpty, cell.backgroundColor == .black {
                            cellMoove.layer.borderWidth = 3
                            cellMoove.layer.borderColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
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
                    if (queenChecker.tagCell! - hittingChecker.tagCell!) < 0,
                       (queenChecker.tagCell! - hittingChecker.tagCell!) % 7 == 0 {
                        steps = 7
                    }
                    if (queenChecker.tagCell! - hittingChecker.tagCell!) < 0,
                       (queenChecker.tagCell! - hittingChecker.tagCell!) % 9 == 0 {
                        steps = -9
                    }
                    if (queenChecker.tagCell! - hittingChecker.tagCell!) < 0,
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
                                        cell.layer.borderWidth = 3
                                        cell.layer.borderColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
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
                    if (queenChecker.tagCell! - hittingChecker.tagCell!) < 0,
                       (queenChecker.tagCell! - hittingChecker.tagCell!) % 7 == 0 {
                        steps = 7
                    }
                    if (queenChecker.tagCell! - hittingChecker.tagCell!) < 0,
                       (queenChecker.tagCell! - hittingChecker.tagCell!) % 9 == 0 {
                        steps = -9
                    }
                    if (queenChecker.tagCell! - hittingChecker.tagCell!) < 0,
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
                                        cell.layer.borderWidth = 3
                                        cell.layer.borderColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
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
    
//    func forHittingCheckers() {
//        saveBatch()
//
//        let arrayOfChecker = cellCheckers
//        var movingsCheckers: CellCheckers? = nil
//        var hittingsCheckers: CellCheckers? = nil
//
//        if current == .white {
//            arrayOfChecker.forEach { (checker) in
//                movingsCheckers = (checker.tagChecker! < 12) ? checker : nil
//                arrayOfChecker.forEach { (hittingChecker) in
//
//                    guard let movingChecker = movingsCheckers else { return }
//
//                    if hittingChecker.tagChecker! >= 12 && (hittingChecker.tagCell == movingChecker.tagCell! + 9 || hittingChecker.tagCell == movingChecker.tagCell! + 7 || hittingChecker.tagCell == movingChecker.tagCell! - 9 || hittingChecker.tagCell == movingChecker.tagCell! - 7) {
//
//                        hittingsCheckers = hittingChecker
//
//                        chessboard.subviews.forEach { (cell) in
//                            guard let checkerForHitting = hittingsCheckers else { return }
//
//                            if cell.subviews.isEmpty, cell.backgroundColor == .black, cell.tag == movingChecker.tagCell! - 2 * (movingChecker.tagCell! - hittingChecker.tagCell!) {
//
//                                cellsMove.append(cell)
//                                canFight = true
//                                mass.append((checker: movingChecker.tagChecker!, cell: cell.tag, checkerBeaten: checkerForHitting.tagChecker!))
//                            }
//                        }
//                    }
//                }
//            }
//
//        } else {
//            arrayOfChecker.forEach { (checker) in
//                movingsCheckers = (checker.tagChecker! >= 12) ? checker : nil
//                arrayOfChecker.forEach { (hittingChecker) in
//
//                    guard let movingChecker = movingsCheckers else { return }
//
//                    if hittingChecker.tagChecker! < 12 && (hittingChecker.tagCell == movingChecker.tagCell! + 9 || hittingChecker.tagCell == movingChecker.tagCell! + 7 || hittingChecker.tagCell == movingChecker.tagCell! - 9 || hittingChecker.tagCell == movingChecker.tagCell! - 7) {
//
//                        hittingsCheckers = hittingChecker
//
//                        chessboard.subviews.forEach { (cell) in
//                            guard let checkerForHitting = hittingsCheckers else { return }
//
//                            if cell.subviews.isEmpty, cell.backgroundColor == .black, cell.tag == movingChecker.tagCell! - 2 * (movingChecker.tagCell! - checkerForHitting.tagCell!) {
//
//                                cellsMove.append(cell)
//                                canFight = true
//                                mass.append((checker: movingChecker.tagChecker!, cell: cell.tag, checkerBeaten: checkerForHitting.tagChecker!))
//                            }
//                        }
//                    }
//                }
//            }
//        }
//    }
    
    
    // MARK: - Func for Winner
    
    func forCheckerWinner() {
        //        saveBatch()
        //        guard let vc = getViewController(from: "ChessBoard") as? ChessBoardController  else { return }
        let arrayOfCheckers = cellCheckers
        var playerWhiteCheckers: Int = 0
        var playerBlackCheckers: Int = 0
        var playerWhoIsAWinner: String = ""
        
        arrayOfCheckers.forEach { (checker) in
            guard let checkerTag = checker.tagChecker,
                  checkerTag < 12 else { return playerWhiteCheckers += 1 }
            playerBlackCheckers += 1
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
                                                            
                                                            // ????
                                                            
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

//
//  ChessBoardController+Chessboard.swift
//  homeWorkLesson10
//
//  Created by Moobat on 23.09.21.
//

import UIKit

extension ChessBoardController {
    
    // MARK: - Методы создания новой партии
    
    func createChessboard() {
        chessboardCostamization()
        let size = view.bounds.size.width - 32
        let sizeColumn = size / 8
        
        chessboard = UIImageView(frame: CGRect(origin: .zero,
                                               size: CGSize(width: size,
                                                            height: size)))
        chessboard.center = view.center
        view.addSubview(chessboard)
        
        var counterCell = 0
        var counterCheker = 0
        
        for i in 0..<8 {
            for j in 0..<8 {
                let column = UIView(frame: CGRect(x: sizeColumn * CGFloat(j),
                                                  y: sizeColumn * CGFloat(i),
                                                  width: sizeColumn,
                                                  height: sizeColumn))
                column.backgroundColor = ((j + i) % 2) == 0 ? .clear : .black
                column.tag = counterCell
                
                chessboard.addSubview(column)
                counterCell += 1
                
                guard i < 3 || i > 4, column.backgroundColor == .black else { continue }
                
                checkerImage = UIImageView(frame: CGRect(x: 5, y: 5, width: sizeColumn - 10, height: sizeColumn - 10))
                checkerImage.isUserInteractionEnabled = true
                checkerImage.image = UIImage(named: i < 3 ? (SettingManager.shared.saveWhiteChecker) ?? "" : (SettingManager.shared.saveBlackChecker) ?? "")
                checkerImage.tag = i < 3 ? Chekers.white.rawValue : Chekers.black.rawValue
                checkerImage.tag = counterCheker
                counterCheker += 1
                column.addSubview(checkerImage)
                
                let tapGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPressGesture(_:)))
                let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGesture(_:)))
                tapGesture.delegate = self
                panGesture.delegate = self
                checkerImage.addGestureRecognizer(tapGesture)
                checkerImage.addGestureRecognizer(panGesture)
            }
        }
        chessboard.image = UIImage(named: "ice7")
        chessboard.isUserInteractionEnabled = true
    }
    
    
    
    // MARK: - Метод создания save партии
    
    func createSaveChessboard() {
        chessboardCostamization()
        let size = view.bounds.size.width - 32
        let sizeColumn = size / 8
        
        chessboard = UIImageView(frame: CGRect(origin: .zero,
                                               size: CGSize(width: size,
                                                            height: size)))
        chessboard.center = view.center
        view.addSubview(chessboard)
        
        var counterCell = 0
        var counterCheker = 0
        
        for i in 0..<8 {
            for j in 0..<8 {
                let column = UIView(frame: CGRect(x: sizeColumn * CGFloat(j),
                                                  y: sizeColumn * CGFloat(i),
                                                  width: sizeColumn,
                                                  height: sizeColumn))
                column.backgroundColor = ((j + i) % 2) == 0 ? .clear : .black
                column.tag = counterCell
                chessboard.addSubview(column)
                counterCell += 1
                
                
                for value in cellCheckers {
                    if column.tag == value.cellTag {
                        checkerImage = UIImageView(frame: CGRect(x: 5, y: 5, width: sizeColumn - 10, height: sizeColumn - 10))
                        checkerImage.isUserInteractionEnabled = true
                        checkerImage.image = UIImage(named: value.checkerTag == 1 ? (SettingManager.shared.saveWhiteChecker) ?? "" : (SettingManager.shared.saveBlackChecker) ?? "")
                        checkerImage.tag = value.checkerTag == 1 ? Chekers.white.rawValue : Chekers.black.rawValue
                        checkerImage.tag = counterCheker
                        counterCheker += 1
                        column.addSubview(checkerImage)
                        
                        let tapGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPressGesture(_:)))
                        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGesture(_:)))
                        tapGesture.delegate = self
                        panGesture.delegate = self
                        checkerImage.addGestureRecognizer(tapGesture)
                        checkerImage.addGestureRecognizer(panGesture)
                    }
                }
                
                if let checker = cellCheckers.first(where: {$0.cellTag == column.tag}) {
                    checkerImage.image = UIImage(named: (checker.checkerTag ?? 0 < 12 ? (SettingManager.shared.saveWhiteChecker) : (SettingManager.shared.saveBlackChecker)) ?? "")
                    checkerImage.tag = checker.checkerTag ?? 0
                    column.addSubview(checkerImage)
                }
            }
        }
        chessboard.image = UIImage(named: "ice7")
        chessboard.isUserInteractionEnabled = true
    }
}

//
//  ChessBoardController+CoreKit.swift
//  homeWorkLesson10
//
//  Created by Moobat on 16.08.21.
//

import UIKit

extension ChessBoardController {
    func chessboardCostamization() {
        // констрэйнты для доски
        chessboard.translatesAutoresizingMaskIntoConstraints = false
        chessboard.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        chessboard.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        chessboard.widthAnchor.constraint(equalToConstant: 320).isActive = true
        chessboard.heightAnchor.constraint(equalToConstant: 320).isActive = true
        
        // тени для доски
        chessboard.layer.shadowColor = UIColor.black.cgColor
        chessboard.layer.shadowRadius = 7
        chessboard.layer.shadowOpacity = 0.9
        chessboard.layer.shadowOffset = CGSize(width: 10, height: 10)
    }
    
    func backButtonFuncCostamize() {
        backButtonOutlet.layer.borderWidth = 2
        backButtonOutlet.layer.borderColor = UIColor.black.cgColor
        backButtonOutlet.layer.cornerRadius = 12
        
        viewOutlet.layer.cornerRadius = 12
        viewOutlet.layer.shadowColor = UIColor.black.cgColor
        viewOutlet.layer.shadowRadius = 4
        viewOutlet.layer.shadowOpacity = 0.9
        viewOutlet.layer.shadowOffset = CGSize(width: 5, height: 5)
        
        lableForBackground.layer.shadowColor = UIColor.black.cgColor
        lableForBackground.layer.shadowRadius = 5
        lableForBackground.layer.shadowOpacity = 0.7
        lableForBackground.layer.shadowOffset = CGSize(width: 5, height: 5)
    }
    
    
    // MARK: - Get Save Batch
    
    
    func saveBatch() {
        chessboard.subviews.forEach { cell in
            if !cell.subviews.isEmpty {
                let position: CellCheckers = CellCheckers()
                position.cellTag = cell.tag
                cell.subviews.forEach { checker in
                    position.checkerTag = checker.tag
                }
                cellCheckers.append(position)
            }
        }
        let data = try? NSKeyedArchiver.archivedData(withRootObject: cellCheckers, requiringSecureCoding: true)
        let fileURL = documentDirectory.appendingPathComponent(Keys.cellAndChecker.rawValue)
        try? data?.write(to: fileURL)
    }
    
    
    
    func getLastBatch() {
        let fileURL = documentDirectory.appendingPathComponent(Keys.cellAndChecker.rawValue)
        guard let data = FileManager.default.contents(atPath: fileURL.absoluteString.replacingOccurrences(of: "file://", with: "")) else { return }
        let newArray = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [CellCheckers]
        self.cellCheckers = newArray ?? []
    }
    
    
    func createSaveChessboard() {
        chessboardCostamization()
        
        for i in 0..<8 {
            for j in 0..<8 {
                let column = UIView(frame: CGRect(x: 40 * i, y: 40 * j, width: 40, height: 40))
                column.backgroundColor = ((i + j) % 2) == 0 ? .clear : .black
                column.tag = ((i + j) % 2) == 0 ? 0 : tagCell
                if ((i + j) % 2) == 1 {
                    tagCell += 1
                    column.tag = tagCell
                }
                chessboard.addSubview(column)
                
                for value in cellCheckers {
                    if column.tag == value.cellTag {
                        let checker = UIImageView(frame: CGRect(x: 5, y: 5, width: 30, height: 30))
                        checker.isUserInteractionEnabled = true
                        checker.image = UIImage(named: j < 3 ? UserDefaults.standard.string(forKey: Keys.checkerImageBlack.rawValue)! : UserDefaults.standard.string(forKey: Keys.checkerImageWhite.rawValue)!)
                        checker.tag = value.checkerTag == 1 ? Chekers.black.rawValue : Chekers.white.rawValue
                        column.addSubview(checker)
                        
                        let tapGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPressGesture(_:)))
                        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGesture(_:)))
                        tapGesture.delegate = self
                        panGesture.delegate = self
                        checker.addGestureRecognizer(tapGesture)
                        checker.addGestureRecognizer(panGesture)
                    }
                }
            }
        }
        chessboard.image = UIImage(named: "ice7")
        chessboard.isUserInteractionEnabled = true
        view.addSubview(chessboard)
    }
    
    
    func getBackground() {
        // доделать: _сделать функию и выбор по default!!
        guard let data = FileManager.default.contents(atPath: URL.getBackgroundURL().absoluteString.replacingOccurrences(of: "file://", with: "")),
              let object = try? NSKeyedUnarchiver.unarchivedObject(ofClass: UIImage.self, from: data) else { return }
        
        let image = object
        backgraoundImage.image = image
        backgraoundImage.contentMode = .scaleAspectFill
        
    }
    
    
    func saveDataToUserDefaults() {
        userDef.setValue(countSec, forKey: Keys.timerSec.rawValue)
        userDef.setValue(countMin, forKey: Keys.timerMin.rawValue)
    }
    
    func removeDataFromUserDefaults() {
        userDef.removeObject(forKey: Keys.timerSec.rawValue)
        userDef.removeObject(forKey: Keys.timerMin.rawValue)
    }
    
    func setDataFromUserDefaults() {
        self.countSec = userDef.integer(forKey: Keys.timerSec.rawValue)
        self.countMin = userDef.integer(forKey: Keys.timerMin.rawValue)
    }
    
    
    // MARK: - Moving
    
    func moving(for checker: UIView) {
        let cell = checker.superview
        chessboard.subviews.forEach { cellMove in
            guard cellMove.subviews.isEmpty, let startCell = cell else { return }
            let diff1 = current == .white ? 7 : -7
            let diff2 = current == .white ? 9 : -9
            if cellMove.tag == startCell.tag + diff1 || cellMove.tag == startCell.tag + diff2 {
                cellsMove.append(cellMove)
            }
        }
    }
}





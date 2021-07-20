//
//  ChessBoardController.swift
//  homeWorkLesson10
//
//  Created by Moobat on 13.07.21.
//

import UIKit

// 1: добавить на этот экран вверху label, который показывает время с начала партии! «тут нужен таймер»

class ChessBoardController: UIViewController {
    // код мастера
    
    var chessboard: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllerBackground()
        view.backgroundColor = .cyan
        createChessboard()
    }
    
    func createChessboard() {
        chessboard = UIImageView(frame: CGRect(origin: .zero, size: CGSize(width: 320, height: 320)))
        
        for i in 0..<8 {
            for j in 0..<8 {
                let column = UIView(frame: CGRect(x: 40 * i, y: 40 * j, width: 40, height: 40))
                column.backgroundColor = ((i + j) % 2) == 0 ? .clear : .black
                chessboard.addSubview(column)
                
                guard j < 3 || j > 4, column.backgroundColor == .black else { continue }
                
                let checker = UIImageView(frame: CGRect(x: 5, y: 5, width: 30, height: 30))
                checker.isUserInteractionEnabled = true
                checker.image = j < 3 ? UIImage(named: "chessBlack") : UIImage(named: "chessWhite")
//                checker.backgroundColor = j < 3 ? .white : .lightGray
//                checker.layer.cornerRadius = checker.bounds.size.width / 2.0
                column.addSubview(checker)
                
                let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGesture(_:)))
                checker.addGestureRecognizer(panGesture)
            }
        }
        
        chessboard.image = UIImage(named: "chessDesk")
        chessboard.isUserInteractionEnabled = true
        
        view.addSubview(chessboard)
        chessboard.center = view.center
    }
    
    
    
    @objc func panGesture(_ sender: UIPanGestureRecognizer) {
        let location = sender.location(in: chessboard)
        let translation = sender.translation(in: chessboard)

        switch sender.state {
        case .changed:
            guard let column = sender.view?.superview, let cellOrigin = sender.view?.frame.origin else { return }
            chessboard.bringSubviewToFront(column)
            sender.view?.frame.origin = CGPoint(x: cellOrigin.x + translation.x,
                                                y: cellOrigin.y + translation.y)
            
            sender.setTranslation(.zero, in: chessboard)
        case .ended:
            let currentCell = chessboard.subviews.first(where: {$0.frame.contains(location) && $0.backgroundColor == .black })
            
            sender.view?.frame.origin = CGPoint(x: 5, y: 5)
            guard let newCell = currentCell, newCell.subviews.isEmpty, let cell = sender.view else {
                return
            }
            
            currentCell?.addSubview(cell)
        default: break
        }
    }
    

}


// MARK: - Extension

extension ChessBoardController {
    func viewControllerBackground() {
        let rootViewColor = UIColor(displayP3Red: 20/255,
                                    green: 100/255,
                                    blue: 100/255,
                                    alpha: 1).cgColor
        let rootViwColorTwo = UIColor(displayP3Red: 20/255,
                                      green: 160/255,
                                      blue: 160/255,
                                      alpha: 1).cgColor
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [rootViewColor, rootViwColorTwo]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1.0)
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
}


    /* Мой код
 
 var chessMove: UIView? = nil
 var defaultOrigin: CGPoint = .zero
 
 var blackCells: [UIView] = []
 var whiteCells: [UIView] = []
 var arrayOfChess: [UIView] = []
 
 var count: Int = 0
 
 override func viewDidLoad() {
     super.viewDidLoad()
     viewControllerBackground()
    createCellAndChess()
 }
 
 func createCellAndChess() {
     let board = UIView(frame: CGRect(x: 30, y: 200, width: 320, height: 320))
     let rows = 8
     let columns = 8
     
     view.addSubview(board)
     
     for row in 0...rows - 1 {
         for column in 0...columns - 1  {
             let cells = UIView(frame: CGRect(x: (row * 40) + 30,
                                                   y: (column * 40) + 200,
                                                   width: 40,
                                                   height: 40))
             view.addSubview(cells)
             
             let chess = UIView(frame: CGRect(x: (row * 40) + 40 ,
                                              y: (column * 40) + 210,
                                              width: 20,
                                              height: 20))
             chess.layer.cornerRadius = 10
             
             if (row + column) % 2 == 0 {
                 cells.backgroundColor = .black
                 blackCells.append(cells)
                 /* что то вроде эттого посмотреть в разборе дз
                  if colum > 3 && colum < 4 {
                  chess.backgroundColor = chess > 4 ? .brown : .systemGray
                  view.addSubview(chess)
                  arrayOfChess.append(chess)
                  panGesture(chess)
                  }
                  */
                 switch column {
                 case 0,1,2 :
                     chess.backgroundColor = .brown
                     view.addSubview(chess)
                     arrayOfChess.append(chess)
                     panGesture(chess)
                 case 7,6,5 :
                     chess.backgroundColor = .systemGray
                     view.addSubview(chess)
                     arrayOfChess.append(chess)
                     panGesture(chess)
                 default:
                     break
                 }
             } else {
                 cells.backgroundColor = .white
                 whiteCells.append(cells)
             }
         }
     }
 }
 
 
 
 func panGesture(_ chess: UIView) {
     let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureRecognizer(_ :)))
     chess.addGestureRecognizer(panGesture)
 }

 
 
 @objc func panGestureRecognizer (_ sender: UIPanGestureRecognizer) {
     let translation = sender.translation(in: view)
     
     switch sender.state {
     
     case .began:
         guard let senderView = sender.view else { return }
         chessMove = senderView
         defaultOrigin = senderView.frame.origin
         
     case .changed:
         guard chessMove != nil else { return}
         chessMove?.frame.origin = CGPoint(x: defaultOrigin.x + translation.x ,
                                           y:  defaultOrigin.y + translation.y)
         view.bringSubviewToFront(chessMove!)
         
     case .ended:
         for blackChess in blackCells {
             if blackChess.frame.contains(chessMove!.frame.origin) {
                 chessMove!.center.x = blackChess.center.x
                 chessMove!.center.y = blackChess.center.y
                 count = 0
                 arrayOfChess.forEach { value in
                     if chessMove!.frame == value.frame {
                         count += 1
                     } else if count == 2 {
                         chessMove!.frame.origin = defaultOrigin
                     }
                 }
             }
             whiteCells.forEach { whiteChess in
                 if whiteChess.frame.contains(chessMove!.frame.origin) {
                     chessMove!.frame.origin = defaultOrigin
                 }
             }
         }
         chessMove = nil
     default:
         break
     }
 }
}
 */

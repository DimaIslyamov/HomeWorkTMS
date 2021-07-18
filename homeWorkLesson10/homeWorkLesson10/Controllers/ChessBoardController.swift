//
//  ChessBoardController.swift
//  homeWorkLesson10
//
//  Created by Moobat on 13.07.21.
//

import UIKit

class ChessBoardController: UIViewController {
    
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

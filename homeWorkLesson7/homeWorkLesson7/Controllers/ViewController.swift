//
//  ViewController.swift
//  homeWorkLesson7
//
//  Created by Moobat on 2.07.21.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - Task 1
        let dancer = Dancer(name: "Jastin", surName: "Timberlake")
        let singer = Singer(name: "Oliver", surName: "Sykes")
        let actor = Actor(name: "Johnny", surName: "Depp")
        let painter = Painter(painterArtisticName: "Banksy", name: nil, surName: nil)
        
        let mass: [Artist] = [dancer, singer, actor, painter]
        for value in mass {
            print("\(value.performance())")
        }
        
        
        
    }


}


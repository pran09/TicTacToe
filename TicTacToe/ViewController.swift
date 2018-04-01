//
//  ViewController.swift
//  TicTacToe
//
//  Created by CSSE Department on 3/15/18.
//  Copyright © 2018 Praneet CSSE484. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var gameButtons : [UIButton]!
    @IBOutlet weak var gameStateLabel: UILabel!
    @IBOutlet weak var gameStateNavBar: UINavigationBar!
    @IBOutlet weak var gameBoardImageView: UIImageView!
    
    var game = TicTacToeGame()
    
    @IBAction func pressedNewGame(_ sender: AnyObject) {
        game = TicTacToeGame()
        updateView()
    }
    
    @IBAction func pressedGameButton(_ sender: AnyObject) {
        let gameBoardButton = sender as! UIButton
        print(gameBoardButton.tag)
        game.pressedSquare(gameBoardButton.tag)
        updateView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameStateNavBar.titleTextAttributes = [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 34)]
        if (traitCollection.horizontalSizeClass == UIUserInterfaceSizeClass.compact) {
            print("Using iPhone board")
            gameBoardImageView.image = #imageLiteral(resourceName: "iPhone_board")
        } else {
            print("Using iPad board")
            gameBoardImageView.image = #imageLiteral(resourceName: "iPad_board")
        }
    }
    
    func updateView() {
        var xImage: UIImage
        var oImage: UIImage
        if (traitCollection.horizontalSizeClass == UIUserInterfaceSizeClass.compact) {
            gameStateLabel.text = game.gameState.rawValue
            xImage = #imageLiteral(resourceName: "iPhone_X")
            oImage = #imageLiteral(resourceName: "iPhone_O")
        } else {
            gameStateNavBar.topItem?.title = game.gameState.rawValue
            xImage = #imageLiteral(resourceName: "iPad_X")
            oImage = #imageLiteral(resourceName: "iPad_O")
        }
        
        for i in 0..<9 {
            let button = gameButtons[i]
            switch (game.gameBoard[i]) {
            case .x:
                button.setImage(xImage, for: UIControlState.normal)
            case .o:
                button.setImage(oImage, for: UIControlState.normal)
            case .none:
                button.setImage(nil, for: UIControlState.normal)
            }
        }
    }
}


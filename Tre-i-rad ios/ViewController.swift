//
//  ViewController.swift
//  Tre-i-rad ios
//
//  Created by Ismenia Brandao
//

import UIKit

class ViewController: UIViewController {

    

    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var label: UILabel!
    var count = 1
    var activePlayer = 1 //Cross
    var gameState = [0,0,0,0,0,0,0,0,0]
    var gameIsActive = true
    let winningCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
   

    @IBAction func action(_ sender: AnyObject) {
    
    count = 1;
    if (gameState[sender.tag-1] == 0 && gameIsActive == true) {
            
    if (activePlayer == 1) {
        gameState[sender.tag-1] = activePlayer
        sender.setImage(UIImage(named: "cross.png"), for: UIControl.State())
        activePlayer = 2
            
    } else {
            
        sender.setImage(UIImage(named: "nought.png"), for: UIControl.State())
        gameState[sender.tag-1] = activePlayer
        activePlayer = 1
        
      }
    }
              
    for combination in winningCombinations {
    if gameState[combination[0]] != 0 && gameState[combination[0]] ==
        gameState[combination[1]] && gameState[combination[1]] ==
        gameState[combination[2]]{
        gameIsActive = false
    
    if gameState[combination[0]] == 1 {
        label.text = "Crosses Win!"
    } else {
        label.text = "Circles Win!"
    }
        playAgainButton.isHidden = false
        label.isHidden = false
    }
        
}//End Winning Combos
   
    if gameIsActive == true{
        for i in gameState{
            count = i * count
        }
        if count != 0{
            label.text = "DRAW!"
        playAgainButton.isHidden = false
        label.isHidden = false
        }
    }

 }//End actionButton
    
    
    @IBAction func playAgain(_ sender: Any) {
        
    gameState = [0,0,0,0,0,0,0,0,0]
        gameIsActive = true
        activePlayer = 1
        playAgainButton.isHidden = true
        label.isHidden = true

    for i in 1...9
    {
        let button = view.viewWithTag(i) as! UIButton
        button.setImage(nil, for: UIControl.State())
    }
        
}//End playAgain
    
    override func viewDidLoad() {
    super.viewDidLoad()
    playAgainButton.isHidden = true
        label.isHidden = true
    }


}//End ViewController


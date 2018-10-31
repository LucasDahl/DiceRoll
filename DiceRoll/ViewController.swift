//
//  ViewController.swift
//  DiceRoll
//
//  Created by Lucas Dahl on 10/30/18.
//  Copyright © 2018 Lucas Dahl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var leftDice: UIImageView!
    @IBOutlet weak var rightDice: UIImageView!
    @IBOutlet weak var playerScoreLabel: UILabel!
    @IBOutlet weak var cpuScoreLabel: UILabel!
    
    // Properties
    var diceList = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    var rightScore = 0
    var leftScore = 0
    var rightDiceIndex = 0
    var leftDiceIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func rollTapped(_ sender: UIButton) {
        
        updateDice()
        
    }
    
    // This updates the dice and score per roll
    func updateDice() {
        
        leftDiceIndex = Int(arc4random_uniform(6))
        rightDiceIndex = Int(arc4random_uniform(6))
        
        leftDice.image = UIImage(named: diceList[leftDiceIndex])
        rightDice.image = UIImage(named: diceList[rightDiceIndex])
        
        if rightDiceIndex > leftDiceIndex {
            
            // Up date the score
            rightScore += 1
            cpuScoreLabel.text = String(rightScore)
            
        } else if leftDiceIndex > rightDiceIndex {
            
            // Update the score
            leftScore += 1
            playerScoreLabel.text = String(leftScore)
            
        } else {
            
            leftScore += 1
            rightScore += 1
        }
        
    }
    
    // This is for the shake gesture
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        
        let rightRandomNumber = arc4random_uniform(5) + 1
        let leftRandomNumber = arc4random_uniform(5) + 1
        
        leftDice.image = UIImage(named: "dice\(leftRandomNumber)")
        rightDice.image = UIImage(named: "dice\(rightRandomNumber)")
        
        if rightRandomNumber > leftRandomNumber {
            
            // Up date the score
            rightScore += 1
            cpuScoreLabel.text = String(rightScore)
            
        } else if leftRandomNumber > rightRandomNumber {
            
            // Update the score
            leftScore += 1
            playerScoreLabel.text = String(leftScore)
            
        } else {
            
            // Something went wrong
            print("Draw")
            
        }
        
    }
    
}// End class


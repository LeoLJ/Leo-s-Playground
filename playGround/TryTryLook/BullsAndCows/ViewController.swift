//
//  ViewController.swift
//  BullsAndCows
//
//  Created by Brian Hu on 5/19/16.
//  Copyright © 2016 Brian. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var guessTextField: UITextField!
    @IBOutlet weak var guessButton: UIButton!
    @IBOutlet weak var remainingTimeLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var answearLabel: UILabel!
    var remainingTime: UInt8! {
        didSet {
            remainingTimeLabel.text = "Remaining:\(remainingTime) times"
            if remainingTime == 0 {
                guessButton.enabled = false
            } else {
                guessButton.enabled = true
            }
        }
    }
    
    var hintArray = [(guess: String, hint: String)]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    // TODO: 1. decide the data type you want to use to store the answear
        var answearA = [String]()
        let answearB = GameLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGame()
    }

    func setGame() {        
        answearA = answearB.generateAnswearFrom(0, to: 9, digi: 4)
        remainingTime = 9
        hintArray.removeAll()
        answearLabel.text = nil
        guessTextField.text = nil
        remainingTimeLabel.textColor = UIColor.blackColor()
        print(answearA)
    }
    
    
    @IBAction func guess(sender: AnyObject) {
        let guessString = guessTextField.text
        let guessInt = GameLogic().containsDuplicate(guessString!.characters.flatMap{Int(String($0))})
        
        guard guessInt == false else {
            let alert = UIAlertController(title: "you should input 4 digits without any duplicate!", message: nil, preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            return
        }
        
        guard guessString?.characters.count == 4 else {
            let alert = UIAlertController(title: "you should input 4 digits to guess!", message: nil, preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            return
        }
      
        // TODO: 3. convert guessString to the data type you want to use and judge the guess
        var guessArray = guessString!.characters.flatMap{String($0)}
        
        var charA = 0
        var charB = 0                       
        for i in 0...3 {
            if guessArray[i] == answearA[i]{
                charA += 1
            }else if guessArray.contains(answearA[i]){
                charB += 1
                }
            }
        
         guessTextField.text = ""
        
        // TODO: 4. update the hint
        let hint = "\(charA)A,\(charB)B"
        
        hintArray.append((guessString!, hint))
        
        // TODO: 5. update the constant "correct" if the guess is correct
        var correct = false    //var correct = charA ==4
        if charA == 4 {
            correct = true
        }
        if correct {
            let alert = UIAlertController(title: "Wow! You are awesome!", message: nil, preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            guessButton.enabled = false
        } else {
            remainingTime! -= 1
            switch remainingTime {
            case 4...6:
                remainingTimeLabel.textColor = UIColor.yellowColor()
            case 0...3:
                remainingTimeLabel.textColor = UIColor.redColor()
            case 0:
                remainingTimeLabel.textColor = UIColor.grayColor()
            default:
                remainingTimeLabel.textColor = UIColor.blackColor()
                
            }
        }
    }
    @IBAction func showAnswear(sender: AnyObject) {
        // TODO: 6. convert your answear to string(if it's necessary) and display it
        answearLabel.text = "\(answearA[0])\(answearA[1])\(answearA[2])\(answearA[3])"
    }
    
    @IBAction func playAgain(sender: AnyObject) {
        setGame()
    }
    
    // MARK: TableView
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hintArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Hint Cell", forIndexPath: indexPath)
        let (guess, hint) = hintArray[indexPath.row]
        cell.textLabel?.text = "\(guess) => \(hint)"
        return cell
    }
}


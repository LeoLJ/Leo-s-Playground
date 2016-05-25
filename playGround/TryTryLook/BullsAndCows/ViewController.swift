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
    var answear = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGame()
    }

    func setGame() {
        generateAnswear()
        remainingTime = 9
        hintArray.removeAll()
        answearLabel.text = nil
        guessTextField.text = nil
        remainingTimeLabel.textColor = UIColor.blackColor()
    }
    
    func generateAnswear() {
        // TODO: 2. generate your answear here
        // You need to generate 4 random and non-repeating digits.
        // Some hints: http://stackoverflow.com/q/24007129/938380
        answear.removeAll()
        var indexA = ["0","1","2","3","4","5","6","7","8","9"]
        for i in 0...3{
            let arrayIndex = Int(arc4random_uniform(10-UInt32(i)))
            let arrayNum = indexA[arrayIndex]
            answear.append(arrayNum)
            indexA.removeAtIndex(arrayIndex)
        }
    }
    
    @IBAction func guess(sender: AnyObject) {
        let guessString = guessTextField.text
        let guessInt = guessString!.characters.flatMap{Int(String($0))}
        func containsDuplicate(nums: [Int]) -> Bool {
            var counts = [Int: Int]()
            var result = false
            for num in nums {
                if counts[num] == nil {
                    counts[num] = 1
                }
                else {
                    counts[num] = counts[num]! + 1
                }
            }
            for count in counts.values {
                if count >= 2 {
                    result = true
                    return result
                }
            }
            return result
        }
        guard containsDuplicate(guessInt) == false else {
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
            if guessArray[i] == answear[i]{
                charA += 1
            }else {
                for num in guessArray{
                    if num == answear[i]{
                        charB += 1
                    }
                }
            }
        }
         guessTextField.text = ""
        
        // TODO: 4. update the hint
        let hint = "\(charA)A,\(charB)B"
        
        hintArray.append((guessString!, hint))
        
        // TODO: 5. update the constant "correct" if the guess is correct
        var correct = false
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
        answearLabel.text = "\(answear[0])\(answear[1])\(answear[2])\(answear[3])"
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


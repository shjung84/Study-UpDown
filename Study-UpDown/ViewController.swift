//
//  ViewController.swift
//  UpDown
//
//  Created by SH.Jung on 2021/03/23.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK:- Properies
    // MARK: IBOutlets
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var turnCountLabel: UILabel!
    @IBOutlet var inputField: UITextField!
    
    // MARK: Stored Properties
    var randomNumber: UInt32 = 0
    var turnCount: Int = 0
        
    // MARK:- Methods
    @IBAction func touchUpSubmitButton(_ sender: UIButton) {
        
        guard let inputText = self.inputField.text, inputText.isEmpty == false else {
            print("입력값 없음")
            return
        }

        guard let inputNumber: UInt32 = UInt32(inputText) else {
            print("입력값이 잘못 되었음")
            return
        }
        
        turnCount += 1
        self.turnCountLabel.text = "\(turnCount)"
        
        if inputNumber > randomNumber {
            self.resultLabel.text = "UP!!"
        } else if inputNumber < randomNumber {
            self.resultLabel.text = "DOWN!!"
        } else {
            self.resultLabel.text = "정답입니다!"
        }
    }
    
    @IBAction func touchUpResetButton(_ sender: UIButton) {
        print("touch up reset button")
    }
    @IBAction func tapBackground(_ sender: UITapGestureRecognizer) {
//        self.view.endEditing(true)
//        self.inputField.resignFirstResponder()
        self.inputField.endEditing(true)

        print("tap background view")
    }
    
    // MARK: Custom Methods
    func initializeGame() {
        self .randomNumber = arc4random() % 25
        self.turnCount = 0
        
        self.resultLabel.text = "Start!"
        self.turnCountLabel.text = "\(turnCount)"
        self.inputField.text = nil
        
        print("임의의 숫자 \(self.randomNumber)")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.initializeGame()
    }


}


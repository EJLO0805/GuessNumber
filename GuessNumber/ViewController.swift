//
//  ViewController.swift
//  GuessNumber
//
//  Created by 羅以捷 on 2022/7/27.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        showResultLabel.text = "請在 0 ~ 1000 猜一個數字"
        showIIndexLabel.text = "你有 10 次機會"
    }
    var theAnswer = Int.random(in: 0...1000)
    var indexForGuess: Int = 10
    var upNumber = 1000
    var downNumber = 0
    @IBOutlet weak var showResultLabel: UILabel!
    @IBOutlet weak var enterTheNumberText: UITextField!
    @IBOutlet weak var showIIndexLabel: UILabel!
    @IBAction func enterTheNumber(_ sender: Any) {
        indexForGuess = indexForGuess - 1
        if indexForGuess <= 0 {
            showResultLabel.text = "好可惜，答案是\(theAnswer)\n請按Replay重新開始玩"
            showIIndexLabel.text = "你沒有機會了！"
        } else {
            showIIndexLabel.text = "你還有\(indexForGuess) 次機會"
            if let enterTheNumberText = Int(enterTheNumberText.text!) {
                if enterTheNumberText == theAnswer {
                    showResultLabel.text = "好棒喔，你猜對了\n請按Replay重新開始玩"
                }else if enterTheNumberText > upNumber || enterTheNumberText < downNumber {
                    showResultLabel.text = "請在範圍內選擇數字，範圍\(downNumber)~\(upNumber)"
                }else if enterTheNumberText > theAnswer {
                    upNumber = enterTheNumberText
                    showResultLabel.text = "沒猜中，範圍\(downNumber)~\(upNumber)"
                }else if enterTheNumberText < theAnswer {
                    downNumber = enterTheNumberText
                    showResultLabel.text = "沒猜中，範圍\(downNumber)~\(upNumber)"
                }
            } else {
                showResultLabel.text = "請輸入數字，數字範圍\(downNumber)~\(upNumber)之間"
            }
        }
        view.endEditing(true)
        enterTheNumberText.text = ""
    }
    @IBAction func replay(_ sender: Any) {
        theAnswer = Int.random(in: 0...1000)
        showResultLabel.text = "重新開始，請在 0 ~ 1000 猜一個數字"
        showIIndexLabel.text = "你有10次機會"
        indexForGuess = 10
        upNumber = 1000
        downNumber = 0
    }
    
}


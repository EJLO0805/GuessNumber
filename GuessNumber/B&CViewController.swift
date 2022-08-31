//
//  B&CViewController.swift
//  GuessNumber
//
//  Created by 羅以捷 on 2022/8/31.
//

import UIKit

class B_CViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0...3{
            theAnwsers.append(question[i])
        }
        showResultLabel.layer.masksToBounds = true
        showResultLabel.layer.cornerRadius = 20
        for inputLabel in inputNumberLabel {
            inputLabel.layer.masksToBounds = true
            inputLabel.layer.cornerRadius = 35
        }
        indexLabel.text = "\(countIndex)"
        indexLabel.layer.masksToBounds = true
        indexLabel.layer.cornerRadius = 35
        // Do any additional setup after loading the view.
    }
    var question = GuessNumber().numbers.shuffled()
    var theAnwsers = GuessNumber().theAnwsers
    var inputNumbers = GuessNumber().inputNumbers
    var inputNumbersString : [String] = []
    var numberIndex: Int = 0
    var countIndex: Int = 6
    var a = 0
    var b = 0
    
    func clearInformation(){
        a = 0
        b = 0
        numberIndex = 0
        inputNumbers.removeAll()
        inputNumberLabel.map { $0.text = "" }
    }
    
    
    @IBOutlet weak var showResultLabel: UILabel!
    
    @IBOutlet var inputNumberLabel: [UILabel]!
    
    @IBOutlet weak var indexLabel: UILabel!
    
    @IBOutlet var numberBottom: [UIButton]!
    
    
    @IBAction func enterNumberBottom(_ sender: UIButton) {
        if numberIndex < 4 {
            inputNumbers.append(sender.tag)
            inputNumberLabel[numberIndex].text! = "\(sender.tag)"
            sender.isEnabled = false
            sender.backgroundColor = UIColor.lightGray
            numberIndex += 1
        }
    }
    
    @IBAction func enterTheAnwser(_ sender: Any) {
        if countIndex <= 0 || a == 4 {
            showResultLabel.text = "請按 Replay 重新開始玩"
            inputNumberLabel.map { $0.text = "" }
        } else if countIndex > 0 {
            countIndex -= 1
            for index in 0...3 {
                a = inputNumbers[index] == theAnwsers[index] ? a + 1 : a
                b = (inputNumbers[index] != theAnwsers[index]) && (theAnwsers.contains(inputNumbers[index])) ? b + 1 : b
            }
            inputNumbersString.append("\(inputNumbers.map{"\($0)"}.joined(separator: "")) \(a)A\(b)B")
            switch a {
                case 4 where countIndex >= 0:
                    showResultLabel.text = "好棒棒🎉，你猜對了🥳\n答案就是 \(theAnwsers.map{"\($0)"}.joined(separator: ""))"
                    inputNumberLabel.map { $0.text = "" }
                    bottomLock(numberBottom, false)
                case ..<4 where countIndex > 0 :
                    showResultLabel.text = "\(inputNumbersString.joined(separator: "\n"))"
                    clearInformation()
                    bottomLock(numberBottom, true)
                case ..<4 where inputNumbers.count < 4 :
                    showResultLabel.text = "請輸入四個數字"
                default :
                    showResultLabel.text = "好可惜，答案是\(theAnwsers.map{"\($0)"}.joined(separator: ""))\n請按 Replay 重新開始"
                    inputNumberLabel.map { $0.text = "" }
                    bottomLock(numberBottom, false)
            }
        }
        indexLabel.text = "\(countIndex)"
    }
    
    @IBAction func deleteNumber(_ sender: UIButton) {
        if numberIndex > 0 {
            numberIndex -= 1
            numberBottom.filter { $0.tag == Int(inputNumberLabel[numberIndex].text!) }.first!.isEnabled = true
            inputNumberLabel[numberIndex].text = ""
            inputNumbers.remove(at: numberIndex)
        }
    }
    
    @IBAction func replay(_ sender: Any) {
        theAnwsers.removeAll()
        inputNumbersString.removeAll()
        countIndex = 6
        indexLabel.text = "\(countIndex)"
        clearInformation()
        bottomLock(numberBottom, true)
        question = question.shuffled()
        for i in 0...3{ theAnwsers.append(question[i]) }
        showResultLabel.text = "新的一局"
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

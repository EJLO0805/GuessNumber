//
//  GuessNumberStruct.swift
//  GuessNumber
//
//  Created by 羅以捷 on 2022/8/31.
//

import Foundation
import UIKit

struct GuessNumber {
    let numbers : [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    var inputNumbers : [Int] = []
    var theAnwsers : [Int] = []
}

public func bottomLock (_ buttoms:[UIButton], _ isOpen : Bool) {
    for bottom in buttoms{
        bottom.isEnabled = isOpen
    }
}


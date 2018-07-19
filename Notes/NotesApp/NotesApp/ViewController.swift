//
//  ViewController.swift
//  NotesApp
//
//  Created by Vasant Hugar on 16/07/18.
//  Copyright © 2018 Vasant Hugar. All rights reserved.
//

import UIKit

import NotesShared
import SwiftyJSON
import GapstaffShared

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let text = NotesShared().text
        print("Notes shared text: \(text)")
        
        let result = Add.twoNumbers(num1: 1, num2: 3)
        print("Result: \(result)")
        
        let group = GSGroup()
        print(group.dayAssignments.first?.assignments.first?.status == .NONE)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

public struct Add {

    public static func twoNumbers(num1: Int, num2: Int) -> Int {
        return num1 + num2 + 10
    }
}



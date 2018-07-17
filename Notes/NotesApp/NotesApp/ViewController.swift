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
        
        let assignment = GSGroup()
        print(assignment.dayAssignments.first?.assignments)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



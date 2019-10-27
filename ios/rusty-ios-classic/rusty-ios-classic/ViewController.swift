//
//  ViewController.swift
//  rusty-ios-classic
//
//  Created by Roberto Huertas Muyo on 27/10/2019.
//  Copyright © 2019 robertohuertas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let result = hello("Rob")
        let s_result = String(cString: result!)
        // IMPORTANT: once we get the result we have to release the pointer.
        hello_release(UnsafeMutablePointer(mutating: result))
        print(s_result)
    }
}

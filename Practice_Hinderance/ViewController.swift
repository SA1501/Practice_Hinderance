//
//  ViewController.swift
//  Practice_Hinderance
//
//  Created by Syed Arisha on 08/11/2019.
//  Copyright © 2019 Syed Arisha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        let URL = NSURL(fileURLWithPath: ("showHome://" as String?)!)
        UIApplication.shared.open(URL as URL) { (Bool) in
            print("yes")
        }
    }

}


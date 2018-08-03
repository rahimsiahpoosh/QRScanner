//
//  ViewController.swift
//  QRScanner
//
//  Created by Rahim Siahpoosh on 2018-08-02.
//  Copyright © 2018 Rahim Siahpoosh. All rights reserved.
//

import UIKit

class QrVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func unwindToStartView(segue: UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
    }

}


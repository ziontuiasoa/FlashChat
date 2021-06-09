//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Zion Tuiasoa on 3/8/21.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: CLTypingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = K.appName
    }
}

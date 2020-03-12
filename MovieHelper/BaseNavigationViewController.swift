//
//  BaseNavigationViewController.swift
//  MovieHelper
//
//  Created by Mehmet Eroğlu on 27.03.2017.
//  Copyright © 2017 Mehmet Eroğlu. All rights reserved.
//

import Foundation
import UIKit
import SWRevealViewController

class BaseNavigationViewController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.barTintColor = UIColor.red //Colors.shared.bgBarColor
        self.navigationBar.tintColor = UIColor.white
        revealViewController().panGestureRecognizer().isEnabled = true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

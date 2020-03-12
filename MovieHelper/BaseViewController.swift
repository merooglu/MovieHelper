//
//  BaseViewController.swift
//  MovieHelper
//
//  Created by Mehmet Eroğlu on 27.03.2017.
//  Copyright © 2017 Mehmet Eroğlu. All rights reserved.
//

import Foundation
import UIKit
import SWRevealViewController
import MBProgressHUD

class BaseViewController : UIViewController,UIAlertViewDelegate {
    
    var leftBarButton : UIBarButtonItem!
    var progressHud : MBProgressHUD!
    var alertController: UIAlertController!
    var okAction: UIAlertAction!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setupView () {
        revealViewController().rearViewRevealWidth = self.view.frame.width*0.80
        revealViewController().panGestureRecognizer().isEnabled = true
        leftBarButton = UIBarButtonItem(image: UIImage(named: "icon_ustbar_menu"), style: UIBarButtonItem.Style.plain, target: self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)))
        self.navigationItem.leftBarButtonItem = leftBarButton
        self.definesPresentationContext = true
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
    
    func showHud() {
        self.progressHud = MBProgressHUD.showAdded(to: self.view, animated: true)
        self.progressHud.bezelView.color = UIColor.lightGray.withAlphaComponent(0.75)
        self.progressHud.label.text = "Please Wait!"
    }
    
    func hideHud () {
       self.progressHud.isHidden = true
    }
    
    func showAlertDialog(title: String, message: String, btnText: String, complete: @escaping () -> Void) {
        alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // Create the actions
        okAction = UIAlertAction(title: btnText, style: UIAlertAction.Style.default) {
            UIAlertAction in
            complete()
        }
        // Add the actions
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

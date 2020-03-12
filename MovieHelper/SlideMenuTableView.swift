//
//  SlideMenuTableView.swift
//  MovieHelper
//
//  Created by Mehmet Eroğlu on 27.03.2017.
//  Copyright © 2017 Mehmet Eroğlu. All rights reserved.
//

import Foundation
import UIKit
import SWRevealViewController

class SlideMenuTableView: NSObject, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var slideMenuViewController : SlideMenuViewController!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return slideMenuViewController.leftMenuItemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SlideMenuCell", for: indexPath) as! SlideMenuCell
        cell.slideMenuItem = slideMenuViewController.leftMenuItemList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! SlideMenuCell
        let revealController = self.slideMenuViewController.revealViewController()
        let baseNC = revealController?.frontViewController as! BaseNavigationViewController
        if baseNC.topViewController as? HomePageViewController != nil
        {
            let homeVC = baseNC.topViewController as! HomePageViewController
            if cell.slideMenuItem.id == 2 {
                homeVC.performSegue(withIdentifier: "goPopular", sender: cell.slideMenuItem.id)
                revealController?.setFrontViewPosition(FrontViewPosition.left, animated: true)
            }else if cell.slideMenuItem.id == 3 {
                homeVC.performSegue(withIdentifier: "goTopRated", sender: cell.slideMenuItem.id)
                revealController?.setFrontViewPosition(FrontViewPosition.left, animated: true)
            }else if cell.slideMenuItem.id == 4 {
                homeVC.performSegue(withIdentifier: "goUpcoming", sender: nil)
                revealController?.setFrontViewPosition(FrontViewPosition.left, animated: true)
            }else if cell.slideMenuItem.id == 11 {
                homeVC.performSegue(withIdentifier: "goAbout", sender: nil)
                revealController?.setFrontViewPosition(FrontViewPosition.left, animated: true)
            }else if cell.slideMenuItem.id == 12 {
                homeVC.performSegue(withIdentifier: "goLogin", sender: nil)
                revealController?.setFrontViewPosition(FrontViewPosition.left, animated: true)
                
            }else if cell.slideMenuItem.id == 13 {
                UserDefaults.standard.set("", forKey: "token")
                // UserDefaults.standard.object(forKey: "token") as! String
                print("token değeri: \(UserDefaults.standard.set("", forKey: "token"))")
                slideMenuViewController.setupLeftMenuItem()
            }
        } else {
        
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}

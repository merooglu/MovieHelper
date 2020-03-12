//
//  SlideMenuViewController.swift
//  MovieHelper
//
//  Created by Mehmet Eroğlu on 27.03.2017.
//  Copyright © 2017 Mehmet Eroğlu. All rights reserved.
//

import Foundation
import UIKit

class SlideMenuViewController: UIViewController {
    
    @IBOutlet var slideMenuTableView: SlideMenuTableView!
    
    var leftMenuItemList = [SlideMenuItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slideMenuTableView.slideMenuViewController = self
        
        TokenCheck.instance.checkToken()
        setupLeftMenuItem()
        
//        NotificationCenter.default.addObserver(self, selector: #selector(setupLeftMenuItem), name: NSNotification.Name(rawValue: "callSetupMenuItem"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(SlideMenuViewController.setupLeftMenuItem), name: Notification.Name("callSetupMenuItem"), object: nil)
        

    }
    
    

    @objc func setupLeftMenuItem() {
        leftMenuItemList.removeAll()
        let home = SlideMenuItem()
        home.title = "Home"
        home.icon = #imageLiteral(resourceName: "slideHomeImg")
        home.id = 5
        
        let movies = SlideMenuItem()
        movies.title = "Movies"
        movies.icon = #imageLiteral(resourceName: "slideMoviesImg")
        movies.id = 6
        
        let tvSeries = SlideMenuItem()
        tvSeries.title = "TV Series"
        tvSeries.icon = #imageLiteral(resourceName: "slideTvImg")
        tvSeries.id = 7
        
        let watched = SlideMenuItem()
        watched.title = "Watched"
        watched.icon = #imageLiteral(resourceName: "izlenecekImg")
        watched.id = 8
        
        let cast = SlideMenuItem()
        cast.title = "Movie Cast"
        cast.icon = #imageLiteral(resourceName: "castImg")
        cast.id = 9
        
        let share = SlideMenuItem()
        share.title = "Share"
        share.icon = #imageLiteral(resourceName: "slideShareImg")
        share.id = 10
        
        let about = SlideMenuItem()
        about.title = "About Us"
        about.icon = #imageLiteral(resourceName: "aboutUs")
        about.id = 11
        
        let login = SlideMenuItem()
        login.title = "Login"
        login.icon = #imageLiteral(resourceName: "icon_cat_basketbol")
        login.id = 12
        
        let logout = SlideMenuItem()
        logout.title = "logout"
        logout.icon = #imageLiteral(resourceName: "icon_cat_basketbol")
        logout.id = 13
        
        let now_playing = SlideMenuItem()
        now_playing.title = "Now Playing"
        now_playing.icon = #imageLiteral(resourceName: "slideMoviesImg")
        now_playing.id = 1
        
        let popular = SlideMenuItem()
        popular.title = "Popular"
        popular.icon = #imageLiteral(resourceName: "slideMoviesImg")
        popular.id = 2
        
        let top_rated = SlideMenuItem()
        top_rated.title = "Top Rated"
        top_rated.icon = #imageLiteral(resourceName: "slideMoviesImg")
        top_rated.id = 3
        
        let upcoming = SlideMenuItem()
        upcoming.title = "Upcoming"
        upcoming.icon = #imageLiteral(resourceName: "slideMoviesImg")
        upcoming.id = 4
        
        
        
       
//        if UserDefaults.standard.object(forKey: "token") as! String == "" {
//            leftMenuItemList.append(login)
//        } else {
//            leftMenuItemList.append(logout)
//        }
        
        leftMenuItemList.append(home)
        //leftMenuItemList.append(movies)
        //leftMenuItemList.append(tvSeries)
        //leftMenuItemList.append(watched)
        //leftMenuItemList.append(cast)
        //leftMenuItemList.append(now_playing)
        leftMenuItemList.append(popular)
        leftMenuItemList.append(top_rated)
        leftMenuItemList.append(upcoming)
        //leftMenuItemList.append(share)
        leftMenuItemList.append(about)
        slideMenuTableView.tableView.reloadData()
        
       // NotificationCenter.default.post(name: Notification.Name("onTargetDropped"), object: nil)
      
    }
    
    
    
}

//
//  UpcomingViewController.swift
//  MovieHelper
//
//  Created by Mehmet Eroğlu on 31.03.2017.
//  Copyright © 2017 Mehmet Eroğlu. All rights reserved.
//

import Foundation
import UIKit
import SVPullToRefresh

class UpcomingViewController : BaseViewController, UIScrollViewDelegate {
    
    @IBOutlet var upcomingCollectionView: UpcomingCollectionView!
    
    var upcoming : Films?
    var count:Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
       getContent()
        //setupView()
        upcomingCollectionView.upcomingViewController = self
        upcomingCollectionView.collectionView.addInfiniteScrolling {
            if self.upcomingCollectionView != nil {
                self.getNextArray()
            } else {
                self.upcomingCollectionView.collectionView.infiniteScrollingView.stopAnimating()
            }
        }
        upcomingCollectionView.collectionView.infiniteScrollingView.stopAnimating()

    }
    
    func getContent () {
        self.showHud()
        WebService.request(uri: "movie/upcoming?api_key=c8663b3a5e6e1d41ab253805b21e4d6e&language=en-US&page=1", methot: .get, parameters: nil, success: { (response : Films) in
            self.hideHud()
            self.upcoming = response
            self.upcomingCollectionView.collectionView.reloadData()
            print("Başarılı")
            
        }) { (error : Error) in
            print("Başarısız")
            self.hideHud()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "upcomingContent" {
            let newVC = segue.destination as! ContentViewController
            newVC.content = sender as? Results
        }
    }
    
    func getNextArray(){
        
        count += 1
        self.showHud()
        WebService.request(uri: "movie/upcoming?api_key=c8663b3a5e6e1d41ab253805b21e4d6e&language=en-US&page=\(count)", methot: .get, parameters: nil, success: { (response : Films) in
            self.upcoming?.results += response.results
            self.upcomingCollectionView.collectionView.reloadData()
            self.upcomingCollectionView.collectionView.infiniteScrollingView.stopAnimating()
            print("Başarılı")
            self.hideHud()
        }) { (error : Error) in
            print("Başarısız")
            self.hideHud()
        }
        
    }
    
}

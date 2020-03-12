//
//  HomePageViewController.swift
//  MovieHelper
//
//  Created by Mehmet Eroğlu on 27.03.2017.
//  Copyright © 2017 Mehmet Eroğlu. All rights reserved.
//

import Foundation
import UIKit
import SVPullToRefresh

class HomePageViewController: BaseViewController {
    
    @IBOutlet var homePageCollectionView: HomePageCollectionView!
    
    var filmler : Films?
    var count : Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getContent()
        setupView()
        homePageCollectionView.homePageViewController = self
        homePageCollectionView.collectionView.addInfiniteScrolling { 
            if self.homePageCollectionView != nil {
                self.getNextArray()
            }else {
                self.homePageCollectionView.collectionView.infiniteScrollingView.stopAnimating()
            }
        }
        homePageCollectionView.collectionView.infiniteScrollingView.stopAnimating()
    }
    
    func getContent (){
        self.showHud()
        WebService.request(uri: "movie/now_playing?api_key=c8663b3a5e6e1d41ab253805b21e4d6e&language=en-US&page=1", methot: .get, parameters: nil, success: { (response : Films) in
            self.filmler = response
            print("başarılı")
            self.homePageCollectionView.collectionView.reloadData()
           self.hideHud()
        }) { (error: Error) in
            
            print("başarısız")
           self.hideHud()
        }
    }
    
    
    func getNextArray() {
        count += 1
        self.showHud()
        WebService.request(uri: "movie/now_playing?api_key=c8663b3a5e6e1d41ab253805b21e4d6e&language=en-US&page=\(count)", methot: .get, parameters: nil, success: { (response : Films) in
            self.filmler?.results += response.results
            self.homePageCollectionView.collectionView.reloadData()
            self.homePageCollectionView.collectionView.infiniteScrollingView.stopAnimating()
            print("good for you")
            self.hideHud()
        }) { (error : Error) in
            print("başarısız ")
            self.hideHud()
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goContent" {
            let newVC = segue.destination as! ContentViewController
            newVC.content = sender as? Results
            
        }
        
    }
}

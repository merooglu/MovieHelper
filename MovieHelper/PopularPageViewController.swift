//
//  PopularPageViewController.swift
//  MovieHelper
//
//  Created by Mehmet Eroğlu on 30.03.2017.
//  Copyright © 2017 Mehmet Eroğlu. All rights reserved.
//

import Foundation
import UIKit
import SWRevealViewController
import SVPullToRefresh

class PopularPageViewController : BaseViewController {

    
    @IBOutlet var popularPageCollectionView: PopularPageCollectionView!
    
    var popular : Films?
    var count : Int = 1
    override func viewDidLoad() {
        super.viewDidLoad()

        getContent()
        //setupView()
        popularPageCollectionView.popularPageViewController = self
        
        popularPageCollectionView.collectionView.addInfiniteScrolling { 
            if self.popularPageCollectionView != nil {
                self.getNextPopularContent()
            }else {
                self.popularPageCollectionView.collectionView.infiniteScrollingView.stopAnimating()
            }
        }
        popularPageCollectionView.collectionView.infiniteScrollingView.stopAnimating()
    }
    
    func getContent () {
        self.showHud()
        WebService.request(uri: "movie/popular?api_key=c8663b3a5e6e1d41ab253805b21e4d6e&language=en-US&page=1", methot: .get, parameters: nil, success: { (response : Films) in
            self.popular = response
            self.popularPageCollectionView.collectionView.reloadData()
            print("başarılı")
            self.hideHud()
        }) { (error : Error) in
            print("başarısız")
            self.hideHud()
        }
    }
    
    func getNextPopularContent() {
        
        count += 1
        
        self.showHud()
        WebService.request(uri: "movie/popular?api_key=c8663b3a5e6e1d41ab253805b21e4d6e&language=en-US&page=\(count)", methot: .get, parameters: nil, success: { (response : Films) in
            self.popular?.results += response.results
            self.popularPageCollectionView.collectionView.reloadData()
            self.popularPageCollectionView.collectionView.infiniteScrollingView.stopAnimating()
            self.hideHud()
        }) { (error : Error) in
            print("bad news")
            self.hideHud()
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "popularContent" {
            let newVC = segue.destination as! ContentViewController
            newVC.content = sender as? Results
        }
    }
}

//
//  TopRatedViewController.swift
//  MovieHelper
//
//  Created by Mehmet Eroğlu on 31.03.2017.
//  Copyright © 2017 Mehmet Eroğlu. All rights reserved.
//

import Foundation
import UIKit
import SVPullToRefresh

class TopRatedViewController : BaseViewController {
    
    @IBOutlet var topRatedCollectionView: TopRatedCollectionView!
    
    var topRated : Films?
    var count : Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setupView()
        getContent()
        topRatedCollectionView.topRatedViewController = self
        topRatedCollectionView.collectionView.addInfiniteScrolling { 
            if self.topRatedCollectionView != nil {
                self.getNextTopratedContent()
            }else {
                self.topRatedCollectionView.collectionView.infiniteScrollingView.stopAnimating()
            }
        }
        topRatedCollectionView.collectionView.infiniteScrollingView.stopAnimating()
    }
    
    func getContent () {
        self.showHud()
        WebService.request(uri: "movie/top_rated?api_key=c8663b3a5e6e1d41ab253805b21e4d6e&language=en-US&page=1", methot: .get, parameters: nil, success: { (response : Films) in
            self.topRated = response
            self.topRatedCollectionView.collectionView.reloadData()
            print("Başarılı")
            self.hideHud()
        }) { (error : Error) in
            print("Başarısız")
            self.hideHud()
        }
    }
    
    func getNextTopratedContent() {
        count += 1
        self.showHud()
        WebService.request(uri: "movie/top_rated?api_key=c8663b3a5e6e1d41ab253805b21e4d6e&language=en-US&page=\(count)", methot: .get, parameters: nil, success: { (response : Films) in
            self.topRated?.results += response.results
            self.topRatedCollectionView.collectionView.reloadData()
            self.topRatedCollectionView.collectionView.infiniteScrollingView.stopAnimating()
            print("Başarılı")
            self.hideHud()
        }) { (error : Error) in
            print("Başarısız")
            self.hideHud()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "topratedContent" {
            let newVC = segue.destination as! ContentViewController
            newVC.content = sender as? Results
        }
    }
}

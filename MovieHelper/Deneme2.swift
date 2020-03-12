//
//  Deneme2.swift
//  MovieHelper
//
//  Created by Mehmet Eroğlu on 6.04.2017.
//  Copyright © 2017 Mehmet Eroğlu. All rights reserved.
//

import Foundation
import UIKit

class Deneme2 : UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var viewLeftConstant: NSLayoutConstraint!
 
    @IBOutlet weak var view2Leading: NSLayoutConstraint!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var scroller: UIScrollView!
    
    @IBOutlet var deneme2CollectionView: Deneme2CollectionView!
   
    @IBOutlet var deneme2TableView: Deneme2TableView!
    
    var deneme : Films?
    var series : Tvs?
    
    var time : Int = 5
    var timer : Timer!
    var row:Int = 0
    
    let WIDTH : CGFloat = 375
    let HEIGHT : CGFloat = 667
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        deneme2CollectionView.deneme2 = self
        deneme2TableView.deneme2 = self
        scroller.delegate = self
        getIcerik()
        getSeries()
        close()
    }
    
    func close () {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(Deneme2.dondurFunc), userInfo: nil, repeats: true)
    }
    
    @objc func dondurFunc() {
        if deneme?.results.count != nil {
            var maxRow = deneme?.results.count
        time -= 1
        if time == 0 {
            timer.invalidate()
            time = 5
            let returnleft = IndexPath(row: row, section: 0)
            self.deneme2CollectionView.collectionView.scrollToItem(at: returnleft, at: UICollectionView.ScrollPosition.left, animated: true)
            row += 1
            if maxRow == row {
                row = 0
            }
            close()
          }
        }
    }
    
    func getSeries () {
        WebService.request(uri: "tv/popular?api_key=c8663b3a5e6e1d41ab253805b21e4d6e&language=en-US&page", methot: .get, parameters: nil, success: { (response : Tvs) in
            self.series = response
            self.deneme2TableView.tableView.reloadData()
            print("good")
        }) { (error : Error) in
            print("bad")
        }
    }
    
    func getIcerik() {
        WebService.request(uri: "movie/now_playing?api_key=c8663b3a5e6e1d41ab253805b21e4d6e&language=en-US&", methot: .get, parameters: nil, success: { (response : Films) in
            self.deneme = response
            self.deneme2CollectionView.collectionView.reloadData()
            print("Başarılı")
        }) { (error : Error) in
            print("Başarısız")
        }
    }

    
    @IBAction func button1Clicked(_ sender: Any) {
        viewLeftConstant.constant = 5
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
        
        scroller.contentOffset.x = 0
        scroller.contentSize = CGSize(width: self.view.frame.size.width*2, height: self.view.frame.size.height)
        
    }
    @IBAction func button2Clicked(_ sender: Any) {
        viewLeftConstant.constant = view.frame.size.width/2+2
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
        
        scroller.contentOffset.x = self.view.frame.size.width
        scroller.contentSize = CGSize(width: self.view.frame.size.width*2, height: self.view.frame.size.height)
        
//        scroller.addSubview(view2)
//        view2.frame.contains(CGRect(x: -WIDTH + (WIDTH*CGFloat(2)), y: 200, width: WIDTH, height: HEIGHT))
//            
//        scroller.contentSize = CGSize(width: WIDTH*2, height: scroller.frame.size.height)
//        
        
    }
    
   
}

//
//  DenemeCollectionView.swift
//  MovieHelper
//
//  Created by Mehmet Eroğlu on 14.04.2017.
//  Copyright © 2017 Mehmet Eroğlu. All rights reserved.
//

import Foundation
import UIKit

class DenemeCollectionView: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    
    @IBOutlet weak var collectionView : UICollectionView!
    
    var deneme2ViewController: Deneme2!
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{
            if deneme2ViewController.filmler != nil {
                return (deneme2ViewController.filmler?.results.count)!
            }else {
                return 0
            }
        }else if section == 1 {
            if deneme2ViewController.filmler2 != nil {
                return (deneme2ViewController.filmler2?.results.count)!
            }
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DenemeCell", for: indexPath) as? DenemeCell
            cell?.result = deneme2ViewController.filmler?.results[indexPath.row]
            
            return cell!
        }
        if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DenemeCell2", for: indexPath) as? DenemeCell2
            cell?.result = deneme2ViewController.filmler2?.results[indexPath.row]
            
            return cell!
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 0 {
            return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        }else if section == 1 {
            return UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 0)
        }
        return UIEdgeInsets()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.collectionView.frame.size.width/2)-5, height: 170)
    } 
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = self.collectionView.frame.size.width
        let page = (self.collectionView.contentOffset.x + pageWidth / 2) / pageWidth
        if ( scrollView != self.collectionView) {
            return
        }
        
        let offSetX = self.collectionView.frame.width * self.collectionView.contentOffset.x / (self.collectionView.contentSize.width - pageWidth)
      //  self.scrollView.setContentOffset(CGPoint(x: offSetX, y: 0), animated: true)
        scrollView.showsHorizontalScrollIndicator = false
    }
    
}

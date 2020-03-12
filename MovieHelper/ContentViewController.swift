//
//  ContentViewController.swift
//  MovieHelper
//
//  Created by Mehmet Eroğlu on 28.03.2017.
//  Copyright © 2017 Mehmet Eroğlu. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher
import youtube_ios_player_helper

class ContentViewController : BaseViewController {
    
    var content : Results?
    var youtubeVid : Videolar?
    var oyuncu : Oyuncular?
    var simMovies : Films?

    
    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet var similarCollectionView: SimilarCollectionView!
    @IBOutlet var contentCollectionView: ContentCollectionView!
    @IBOutlet weak var youPlayer: YTPlayerView!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var starBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentCollectionView.contentViewController = self
        similarCollectionView.contentViewController = self
        
        getSimilarMovies(deger: content!.id!)
        getVideo(deger: content!.id!)
        getOyuncu(deger: content!.id!)
       
        let url = URL(string: "https://image.tmdb.org/t/p/w500\(content!.poster_path!)")
        backgroundImage.kf.setImage(with: url)
        
        mainImage.kf.setImage(with: url)
        mainImage.layer.borderWidth = 1
        mainImage.layer.borderColor = UIColor.red.cgColor
        mainImage.layer.cornerRadius = 10
        mainImage.layer.masksToBounds = true
        
        youPlayer.layer.borderWidth = 1
        youPlayer.layer.borderColor = UIColor.red.cgColor
        youPlayer.layer.cornerRadius = 10
        youPlayer.layer.masksToBounds = true
        
        titleLabel.text = content?.original_title
        contentLabel.text = content?.overview
        
        
    }
    
    
    func getVideo(deger: Int) {
        WebService.request(uri: "movie/\(deger)/videos?api_key=c8663b3a5e6e1d41ab253805b21e4d6e&language=en-US", methot: .get, parameters: nil, success: {(response: Videolar) in
            self.youtubeVid = response
            if response.videoResult.count != 0 {
                self.youPlayer.load(withVideoId: String(response.videoResult[0].key!))
            }
        }) {(error) in
            print("başarısız")
            
        }
    }
    
    func getOyuncu(deger : Int) {
        self.showHud()
        WebService.request(uri: "movie/\(deger)/credits?api_key=c8663b3a5e6e1d41ab253805b21e4d6e", methot: .get, parameters: nil, success: { (response : Oyuncular) in
            self.oyuncu = response
            self.contentCollectionView.collectionView.reloadData()
            print("Başarılı")
            self.hideHud()
        }) { (error : Error) in
            print("Başarısız")
            self.hideHud()
        }
    }
    
    func getSimilarMovies (deger: Int){
        
        WebService.request(uri: "movie/\(deger)/similar?api_key=c8663b3a5e6e1d41ab253805b21e4d6e", methot: .get, parameters: nil, success: { (response : Films) in
            self.simMovies = response
            self.similarCollectionView.collectionView.reloadData()
            print("Başarılı")
            
        }) { (error : Error) in
            print("Başarısız")
            
        }
    }

    func reloadSimilarMovie(count:Int){
        
        starBtn.isSelected = false
        
        let returnleft = IndexPath(row: 0, section: 0)
        self.similarCollectionView.collectionView.scrollToItem(at: returnleft, at: UICollectionView.ScrollPosition.left, animated: true)
        self.contentCollectionView.collectionView.scrollToItem(at: returnleft, at: UICollectionView.ScrollPosition.left, animated: true)
        scrollview.scrollToTopp()
        
        
        self.titleLabel.text = simMovies?.results[count].original_title!
        self.contentLabel.text = simMovies?.results[count].overview
        let url = URL(string: "https://image.tmdb.org/t/p/w500\( simMovies!.results[count].poster_path!)")
        self.backgroundImage.kf.setImage(with: url)
        self.mainImage.kf.setImage(with: url)
        if let id = simMovies?.results[count].id {
            getVideo(deger: id)
            getOyuncu(deger: id)
            getSimilarMovies(deger: id)
        }
        
    }
    
    @IBAction func starBtnPressed(_ sender: UIButton) {
        if starBtn.isSelected == true {
            starBtn.isSelected = false
        } else {
            starBtn.isSelected = true
        }
    }
    
}

extension UIScrollView {
    func scrollToTopp() {
        let desiredOffset = CGPoint(x: 0, y: 0)
        setContentOffset(desiredOffset, animated: true)
    }
}












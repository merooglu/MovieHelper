//
//  ButtonView.swift
//  MovieHelper
//
//  Created by Mehmet Eroğlu on 19.04.2017.
//  Copyright © 2017 Mehmet Eroğlu. All rights reserved.
//

import Foundation
import UIKit

class ButtonView: UIButton {
    
    @IBInspectable var defaultColor: UIColor!
    @IBInspectable var highlightedColor: UIColor!
    
    var firstLayer: CALayer!
    var secondLayer: CALayer!
    
    override var isHighlighted: Bool {
        didSet{
            if (self.isHighlighted) {
                self.firstLayer!.backgroundColor = self.defaultColor?.cgColor
            } else {
                self.firstLayer!.backgroundColor = self.highlightedColor?.cgColor
            }
        }
    }
    
    override func awakeFromNib() {
        self.layer.cornerRadius = 3
        self.layer.masksToBounds = true;
    }
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        // First Layer
        if (self.firstLayer == nil) {
            self.firstLayer = CALayer()
            self.firstLayer.frame = CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: self.frame.size.width, height: self.frame.size.height))
            self.firstLayer.backgroundColor = self.highlightedColor.cgColor
            self.firstLayer.cornerRadius = 3
            self.layer.insertSublayer(self.firstLayer!, at: 0)
        }
        
        //Second Layer
        if (self.secondLayer == nil) {
            self.secondLayer = CALayer()
            self.secondLayer.frame = CGRect(origin: CGPoint(x: 0, y:0), size: CGSize(width: self.frame.size.width, height: self.frame.size.height - 3) )
            self.secondLayer.backgroundColor = self.defaultColor.cgColor
            self.secondLayer.cornerRadius = 3
            self.layer.insertSublayer(self.secondLayer! , above: self.firstLayer)
        }
        
        self.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 3, right: 0)
        
    }
    
    override func prepareForInterfaceBuilder() {
        self.layer.cornerRadius = 3
        self.layer.masksToBounds = true
    }
    
}

//
//  AALabel.swift
//  AquaApp
//
//  Created by Alan on 31/07/2016.
//  Copyright © 2016 Alan Glasby. All rights reserved.
//

import UIKit

class AALabel: UILabel {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    func commonInit() {
        let textFont = UIFont(name: "Helvetica Neue", size: 14.0)
        let textColor = UIColor.black()
        let textAlpha: CGFloat = 0.87
        
        self.font = textFont
        self.textColor = textColor
        self.alpha = textAlpha
        self.textAlignment = NSTextAlignment.left

    }
}

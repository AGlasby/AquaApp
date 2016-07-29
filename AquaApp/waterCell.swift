//
//  waterCell.swift
//  AquaApp
//
//  Created by Alan Glasby on 27/07/2016.
//  Copyright © 2016 Alan Glasby. All rights reserved.
//

import Foundation

import UIKit

class WaterCell: UICollectionViewCell {

    @IBOutlet weak var testImg: UIImageView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
        
    }

    func configureCell(test: String) {

        testImg.image = UIImage(named: "\(test).png")

    }
}

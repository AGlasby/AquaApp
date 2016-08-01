//
//  AATextField.swift
//  AquaApp
//
//  Created by Alan on 01/08/2016.
//  Copyright © 2016 Alan Glasby. All rights reserved.
//

import UIKit


/** extension to UIColor to allow setting the color
 value by hex value */
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        /** Verify that we have valid values */
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    /** Initializes and sets color by hex value */
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
    
}



class AATextField: UITextField {

    
    
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
        let textBackground = UIColor(colorLiteralRed: 230.0, green: 230.0, blue: 230.0, alpha: 0.87)

        
        self.font = textFont
        self.textColor = textColor
        self.alpha = textAlpha
        self.backgroundColor = textBackground
    }
    
    
    // Placeholder text
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 0)
    }
    
    // Editable text
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 0)
    }

}

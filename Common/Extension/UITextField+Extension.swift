//
//  UITextField+Extension.swift
//  Swift.Extension
//
//  Created by YuanGu on 2018/1/18.
//  Copyright © 2018年 YuanGu. All rights reserved.
//

import UIKit

/// init method
extension UITextField {
    
    /// quick way to create a label
    convenience init (placeholder: String,
                      placeholderColor: UIColor,
                      placeholderFontSize: CGFloat,
                      textColor: UIColor,
                      textFontSize: CGFloat,
                      keyboardType: UIKeyboardType = .default,
                      clearButtonMode: UITextFieldViewMode = .whileEditing) {
        
        self.init()
        
        let rangeDict = [RANGE_LOCATION: "0", RANGE_LENGTH: "\(placeholder.length())"] as [String : Any]
        
        let attrPlaceholder = placeholder.attributedString(rangeArray: [rangeDict],
                                                           fontArray: [.systemFont(ofSize: placeholderFontSize)],
                                                           colorArray: [placeholderColor])
        attributedPlaceholder = attrPlaceholder
        self.textColor = textColor
        self.font = UIFont.systemFont(ofSize: textFontSize)
        self.tintColor = placeholderColor
        self.keyboardType = keyboardType
        self.clearButtonMode = clearButtonMode
    }
}

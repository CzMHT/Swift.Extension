//
//  UILabel+Extension.swift
//  Swift.Extension
//
//  Created by YuanGu on 2018/1/18.
//  Copyright © 2018年 YuanGu. All rights reserved.
//

import UIKit

// MARK: - init method
extension UILabel {
    
    /// quick way to create a label
    convenience init (title: String,
                      fontSize: CGFloat,
                      color: UIColor,
                      alignment: NSTextAlignment = .left,
                      isBold: Bool = false) {
        
        self.init()
        
        self.text = title
        self.font = isBold ? UIFont.boldSystemFont(ofSize: fontSize) : UIFont.systemFont(ofSize: fontSize)
        self.textColor = color
        self.textAlignment = alignment
    }
}

// MARK: - instance method
extension UILabel {
    
    func set(title: String,
             fontSize: CGFloat,
             color: UIColor,
             alignment: NSTextAlignment = .left,
             isBold: Bool = false ) {
        
        self.text = title
        self.font = isBold ? UIFont.boldSystemFont(ofSize: fontSize) : UIFont.systemFont(ofSize: fontSize)
        self.textColor = color
        self.textAlignment = alignment
    }
}

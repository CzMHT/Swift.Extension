//
//  UIButton+Extension.swift
//  Swift.Extension
//
//  Created by YuanGu on 2018/1/18.
//  Copyright © 2018年 YuanGu. All rights reserved.
//

import UIKit

extension UIButton {
    
    // quick way to create a button with image and background image
    convenience init(normalImage: UIImage? = nil ,
                     selectImage: UIImage? = nil ,
                     backgroundImage: UIImage? = nil) {
        self.init()
        
        setImage(normalImage, for: .normal)
        setImage(selectImage, for: .selected)
        setBackgroundImage(backgroundImage, for: .normal)
    }
    
    // create a button with title/fontSize/TitleColor/bgColor
    convenience init(title: String ,
                     fontSize: CGFloat ,
                     titleColor: UIColor ,
                     selectTitleColor: UIColor ,
                     bgColor: UIColor = .clear,
                     isBold: Bool = false){
        self.init()
        
        titleLabel?.font = isBold ? .boldSystemFont(ofSize: fontSize) : .systemFont(ofSize: fontSize)
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        setTitleColor(selectTitleColor, for: .selected)
        backgroundColor = bgColor
    }
}

// MARK: - instance method
extension UIButton {
    
    public func setUp(title: String ,
                      selectTitle: String ,
                      fontSize: CGFloat ,
                      isBold: Bool = false ,
                      bgColor: UIColor = UIColor.clear ,
                      titleOffset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)){
        
        setTitle(title, for: .normal)
        setTitle(selectTitle, for: .selected)
        titleLabel?.font = isBold ? UIFont.boldSystemFont(ofSize: fontSize) : UIFont.systemFont(ofSize: fontSize)
        backgroundColor = bgColor
        titleEdgeInsets = titleOffset
    }
}







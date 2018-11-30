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


public enum LayoutImageStyle {
    case top ,left ,bottom ,right
}

//设置 图片与文字的位置
extension UIButton {
    public func layoutStyle(style: LayoutImageStyle ,space: CGFloat) {
        
        let imageWidth: CGFloat = (imageView?.frame.size.width)!
        let imageHeight: CGFloat = (imageView?.frame.size.height)!
        var labelWidth: CGFloat = 0
        var labelHeight: CGFloat = 0
        
        if #available (iOS 8.0, *) {
            labelWidth = (titleLabel?.intrinsicContentSize.width)!
            labelHeight = (titleLabel?.intrinsicContentSize.height)!
        }else{
            labelWidth = (titleLabel?.frame.size.width)!
            labelHeight = (titleLabel?.frame.size.height)!
        }
        
        var imageInset: UIEdgeInsets = .zero
        var titleInset: UIEdgeInsets = .zero
        
        switch style {
        case .top:
            imageInset = UIEdgeInsets(top: -labelHeight-space/2.0, left: 0, bottom: 0, right: -labelWidth)
            titleInset = UIEdgeInsets(top: 0, left: -imageWidth, bottom: -imageHeight-space/2.0, right: 0)
        case .bottom:
            imageInset = UIEdgeInsets(top: 0, left: 0, bottom: -labelHeight-space/2.0, right: -labelWidth)
            titleInset = UIEdgeInsets(top: -imageHeight-space/2.0, left: -imageWidth, bottom: 0, right: 0)
        case .left:
            imageInset = UIEdgeInsets(top: 0, left: -space/2.0, bottom: 0, right: space/2.0)
            titleInset = UIEdgeInsets(top: 0, left: -space/2.0, bottom: 0, right: -space/2.0)
        case .right:
            imageInset = UIEdgeInsets(top: 0, left: labelWidth+space/2.0, bottom: 0, right: -labelWidth-space/2.0)
            titleInset = UIEdgeInsets(top: 0, left: -imageWidth-space/2.0, bottom: 0, right: imageWidth+space/2.0)
        }
        
        imageEdgeInsets = imageInset
        titleEdgeInsets = titleInset
    }
}







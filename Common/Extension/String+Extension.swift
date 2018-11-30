//
//  String+Extension.swift
//  Swift.Extension
//
//  Created by YuanGu on 2018/1/18.
//  Copyright © 2018年 YuanGu. All rights reserved.
//

import UIKit

// MARK - attribute string
extension String {
    
    func attributedString(rangeArray: Array<Dictionary<String, Any>>,
                          fontArray: Array<UIFont>,
                          colorArray: Array<UIColor>,
                          lineSpacing: CGFloat = 0) -> NSMutableAttributedString {
        
        // 如果range数组为空，直接返回自己
        if rangeArray.count == 0 {
            return NSMutableAttributedString(string: self)
        }
        
        // 如果数组元素个数不一致，直接把返回自己
        if (rangeArray.count != fontArray.count) || (rangeArray.count != colorArray.count) {
            return NSMutableAttributedString(string: self)
        }
        
        // 带属性字符串
        let attrContent = NSMutableAttributedString(string: self)
        
        for index in 0..<rangeArray.count {
            
            // 获取range
            let dict = rangeArray[index];
            let location:String = dict[RANGE_LOCATION] as! String;
            let length:String = dict[RANGE_LENGTH] as! String;
            
            // range
            let range = NSMakeRange(Int(location)!, Int(length)!);
            
            // 字体大小
            attrContent.addAttribute(NSAttributedStringKey.font, value: fontArray[index], range: range)
            
            // 字体颜色
            attrContent.addAttribute(NSAttributedStringKey.foregroundColor, value: colorArray[index], range: range)
        }
        
        // 内容行间距
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing;
        
        attrContent.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, length()))
        
        return attrContent;
    }
    
    /// 获取字符串长度
    ///
    /// - Returns: 长度
    func length() -> Int {
        return lengthOfBytes(using: String.Encoding.utf8)
    }
    
    //获取手机型号
    func iphoneType() ->String {
        
        var systemInfo = utsname()
        uname(&systemInfo)
        
        let platform = withUnsafePointer(to: &systemInfo.machine.0) { ptr in
            return String(cString: ptr)
        }
        
        if platform == "iPhone1,1" { return "iPhone 2G"}
        if platform == "iPhone1,2" { return "iPhone 3G"}
        if platform == "iPhone2,1" { return "iPhone 3GS"}
        if platform == "iPhone3,1" { return "iPhone 4"}
        if platform == "iPhone3,2" { return "iPhone 4"}
        if platform == "iPhone3,3" { return "iPhone 4"}
        if platform == "iPhone4,1" { return "iPhone 4S"}
        if platform == "iPhone5,1" { return "iPhone 5"}
        if platform == "iPhone5,2" { return "iPhone 5"}
        if platform == "iPhone5,3" { return "iPhone 5C"}
        if platform == "iPhone5,4" { return "iPhone 5C"}
        if platform == "iPhone6,1" { return "iPhone 5S"}
        if platform == "iPhone6,2" { return "iPhone 5S"}
        if platform == "iPhone7,1" { return "iPhone 6 Plus"}
        if platform == "iPhone7,2" { return "iPhone 6"}
        if platform == "iPhone8,1" { return "iPhone 6S"}
        if platform == "iPhone8,2" { return "iPhone 6S Plus"}
        if platform == "iPhone8,4" { return "iPhone SE"}
        if platform == "iPhone9,1" { return "iPhone 7"}
        if platform == "iPhone9,2" { return "iPhone 7 Plus"}
        if platform == "iPhone10,1" { return "iPhone 8"}
        if platform == "iPhone10,2" { return "iPhone 8 Plus"}
        if platform == "iPhone10,3" { return "iPhone X"}
        if platform == "iPhone10,4" { return "iPhone 8"}
        if platform == "iPhone10,5" { return "iPhone 8 Plus"}
        if platform == "iPhone10,6" { return "iPhone X"}
        
        if platform == "iPod1,1" { return "iPod Touch 1G"}
        if platform == "iPod2,1" { return "iPod Touch 2G"}
        if platform == "iPod3,1" { return "iPod Touch 3G"}
        if platform == "iPod4,1" { return "iPod Touch 4G"}
        if platform == "iPod5,1" { return "iPod Touch 5G"}
        
        if platform == "iPad1,1" { return "iPad 1"}
        if platform == "iPad2,1" { return "iPad 2"}
        if platform == "iPad2,2" { return "iPad 2"}
        if platform == "iPad2,3" { return "iPad 2"}
        if platform == "iPad2,4" { return "iPad 2"}
        if platform == "iPad2,5" { return "iPad Mini 1"}
        if platform == "iPad2,6" { return "iPad Mini 1"}
        if platform == "iPad2,7" { return "iPad Mini 1"}
        if platform == "iPad3,1" { return "iPad 3"}
        if platform == "iPad3,2" { return "iPad 3"}
        if platform == "iPad3,3" { return "iPad 3"}
        if platform == "iPad3,4" { return "iPad 4"}
        if platform == "iPad3,5" { return "iPad 4"}
        if platform == "iPad3,6" { return "iPad 4"}
        if platform == "iPad4,1" { return "iPad Air"}
        if platform == "iPad4,2" { return "iPad Air"}
        if platform == "iPad4,3" { return "iPad Air"}
        if platform == "iPad4,4" { return "iPad Mini 2"}
        if platform == "iPad4,5" { return "iPad Mini 2"}
        if platform == "iPad4,6" { return "iPad Mini 2"}
        if platform == "iPad4,7" { return "iPad Mini 3"}
        if platform == "iPad4,8" { return "iPad Mini 3"}
        if platform == "iPad4,9" { return "iPad Mini 3"}
        if platform == "iPad5,1" { return "iPad Mini 4"}
        if platform == "iPad5,2" { return "iPad Mini 4"}
        if platform == "iPad5,3" { return "iPad Air 2"}
        if platform == "iPad5,4" { return "iPad Air 2"}
        if platform == "iPad6,3" { return "iPad Pro 9.7"}
        if platform == "iPad6,4" { return "iPad Pro 9.7"}
        if platform == "iPad6,7" { return "iPad Pro 12.9"}
        if platform == "iPad6,8" { return "iPad Pro 12.9"}
        
        if platform == "i386"   { return "iPhone Simulator"}
        if platform == "x86_64" { return "iPhone Simulator"}
        
        return platform
    }
}

extension String {
    //TODO: judge chinese character
    func includeChinese() -> Bool {
        let lists = Array(self).map({ "\($0)" })
        print(lists)
        for list in lists {
            if "\u{4E00}" <= list, list <= "\u{9FA5}" {
                return true
            }
        }
        return false
    }
    //TODO: get numbers string
    func numbers() -> String {
        guard self.count > 0 else {
            return ""
        }
        return self.components(separatedBy: CharacterSet(charactersIn: "0123456789").inverted).joined(separator: "")
    }
}

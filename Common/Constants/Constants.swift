//
//  Constants.swift
//  Swift.Extension
//
//  Created by YuanGu on 2018/1/18.
//  Copyright © 2018年 YuanGu. All rights reserved.
//

import UIKit

// color
let WHITE_COLOR = UIColor.white // white color #ffffff
let BLACK_COLOR = UIColor.black // black color #000000

// 字符串
let RANGE_LOCATION = "rangeLocation"           // range 位置
let RANGE_LENGTH   = "rangeLength"             // range 长度

let ScreenWidths: CGFloat = UIScreen.main.bounds.size.width
let ScreenHeight: CGFloat = UIScreen.main.bounds.size.height

// 判断 iPhone5s
let iPhone5 = UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 960, height: 1336).equalTo((UIScreen.main.currentMode?.size)!) : false
// 判断 iPhone6s
let iPhone6s = UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 750, height: 1334).equalTo((UIScreen.main.currentMode?.size)!) : false
// 判断 iPhone6p
let iPhone6p = UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 1242, height: 2208).equalTo((UIScreen.main.currentMode?.size)!) : false
//适配参数
let suitParm:CGFloat = (iPhone6p ? 1.12 : (iPhone6s ? 1.0 : (iPhoneX() ? 1.0 : 0.85)))

public func iPhoneX() -> Bool
{
    guard UIDevice.current.userInterfaceIdiom != .phone else {
        return false
    }
    if #available(iOS 11.0, *) {
        let window = UIApplication.shared.delegate?.window!
        if (window?.safeAreaInsets.bottom)! > 0 {
            return true
        }
    }
    return false
}
public func StatusBarHeight() -> CGFloat
{
    return UIApplication.shared.statusBarFrame.height
}
public func NavigationBarHeight() -> CGFloat
{
    if iPhoneX() {
        return 88
    }
    return 64
}
public func TabbarHeight() -> CGFloat
{
    if iPhoneX() {
        return 83
    }
    return 49
}
public func HomeIndiCatorHeight() -> CGFloat
{
    if iPhoneX() {
        return 34
    }
    return 0
}

// MARK:- 自定义打印
func Log<T>(_ message : T, file : String = #file, funcName : String = #function, lineNum : Int = #line) {
    
    #if DEBUG
        
        let timeFormatter = DateFormatter()
        
        timeFormatter.dateFormat = "HH:mm:ss.SSS"
        
        let strNowTime = timeFormatter.string(from: NSDate() as Date) as String
        
        let fileName = (file as NSString).lastPathComponent
        
        print("\(strNowTime)-\(fileName)-(\(lineNum)) : \(message)")
        
    #endif
}

//设定颜色
func ColorRGB(r red: CGFloat ,g green: CGFloat ,b blue: CGFloat) -> UIColor {
    
    let color = UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: 1.0)
    
    return color
}


// MARK: - 全局提示框
func alert(_ message: String) -> Void {
    
    let alert = UIAlertController(title: "Warn", message: message, preferredStyle: .alert)
    
    alert.addAction(UIAlertAction(title: "Sure", style: .cancel, handler: nil))
    
    UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: {
    })
}

// MARK: - 打印对象内存地址
func malloc(values: AnyObject...){
    for value in values {
        print(Unmanaged.passUnretained(value).toOpaque())
    }
}

// MARK: - 定时器启用
func DispatchTimers(timeInterval: Double, handler:@escaping (DispatchSourceTimer?) ->() ) {
    
    // 在这里如果单独实用, 那么需要对timer进行strong引用, 否则出作用域就销毁了, 失效
    let timer = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.global())
    timer.schedule(deadline: .now(), repeating: timeInterval)
    timer.setEventHandler {
        DispatchQueue.main.async {
            handler(timer)
        }
    }
    timer.resume()
}

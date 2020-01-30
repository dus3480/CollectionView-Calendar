//
//  UIColorExtension.swift
//  wiCalendar
//
//  Created by 위대연 on 2020/01/30.
//  Copyright © 2020 위대연. All rights reserved.
//

import UIKit
extension UIColor {
    convenience init(hex: UInt32, alpha: CGFloat) {
        let red = CGFloat((hex & 0xFF0000) >> 16)/256.0
        let green = CGFloat((hex & 0xFF00) >> 8)/256.0
        let blue = CGFloat(hex & 0xFF)/256.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}

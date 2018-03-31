//
// Created by Douglas Mendes  on 3/30/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(hex: Int) {
        let redMask: UInt = 16
        let greenMask: UInt = 8
        let blueMask: UInt = 0

        let red = CGFloat((hex >> redMask) & 0xff) / 0xff
        let green = CGFloat((hex >> greenMask) & 0xff) / 0xff
        let blue = CGFloat((hex >> blueMask) & 0xff) / 0xff

        self.init(red: red, green: green, blue: blue, alpha: 1)
    }
}

extension UIColor {
    static var purpleNu: UIColor {
        return UIColor(hex: 0x6E2B77)
    }

    static var enabledPurpleNu: UIColor {
        return UIColor(hex: 0x6E2B77)
    }

    static var blackNu: UIColor {
        return UIColor(hex: 0x222222)
    }

    static var hintNu: UIColor {
        return UIColor(hex: 0x999999)
    }

    static var backgroundNu: UIColor {
        return UIColor(hex: 0xFDFDFD)
    }

    static var greenNu: UIColor {
        return UIColor(hex: 0x417505)
    }

    static var redNu: UIColor {
        return UIColor(hex: 0xD5171B)
    }

    static var closeGrayNu: UIColor {
        return UIColor(hex: 0x808191)
    }

    static var disabledGrayNu: UIColor {
        return UIColor(hex: 0xCCCCCC)
    }
}

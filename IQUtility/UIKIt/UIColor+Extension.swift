//
//  UIColor+Extension.swift
//  https://github.com/hackiftekhar/IQUtility
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import UIKit

public extension UIColor {

    static func color(intRed red: Int, green: Int, blue: Int, alpha: CGFloat = 1) -> UIColor {
        return UIColor(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: alpha)
    }

    convenience init(hex: String) {

        var cString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }

        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }

    var image: UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        guard let context = UIGraphicsGetCurrentContext() else {
            return UIImage()
        }

        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        context.setAlpha(alpha)
        context.setFillColor(cgColor)
        context.fill(rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img ?? UIImage()
    }

    func lightened(by percentage: CGFloat) -> UIColor {
        return self.brightnessAdjusted(by: abs(percentage) )
    }

    func darkened(by percentage: CGFloat) -> UIColor {
        return self.brightnessAdjusted(by: -1 * abs(percentage) )
    }

    var averageBrightness: CGFloat {
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        if (self.getRed(&r, green: &g, blue: &b, alpha: &a)) {
            return (r + g + b) / 3.0
        }
        else {
            return 1.0
        }
    }

    func brightnessAdjusted(by percentage: CGFloat) -> UIColor {
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        if (self.getRed(&r, green: &g, blue: &b, alpha: &a)) {
            return UIColor(red: min(r + percentage, 1.0),
                           green: min(g + percentage, 1.0),
                           blue: min(b + percentage, 1.0),
                           alpha: a)
        }
        else {
            return .black
        }
    }
}

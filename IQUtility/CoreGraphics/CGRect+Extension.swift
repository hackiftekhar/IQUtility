//
//  CGRect+Extension.swift
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

import CoreGraphics

public extension CGRect {

    func aspectFit(_ aRect: CGRect) -> CGRect {
        let sizeThatFits = size.sizeThatFits(aRect.size)

        let xPos = (aRect.size.width - sizeThatFits.width) / 2
        let yPos = (aRect.size.height - sizeThatFits.height) / 2

        let ret = CGRect(x: xPos + aRect.minX, y: yPos + aRect.minY,
                         width: sizeThatFits.width, height: sizeThatFits.height)
        return ret
    }

    func aspectFill(_ aRect: CGRect) -> CGRect {
        let sizeThatFill = size.sizeThatFill(aRect.size)

        let xPos = (aRect.size.width - sizeThatFill.width) / 2
        let yPos = (aRect.size.height - sizeThatFill.height) / 2

        let ret = CGRect(x: xPos + aRect.minX, y: yPos + aRect.minY,
                         width: sizeThatFill.width, height: sizeThatFill.height)
        return ret
    }
}

extension CGRect {

    /// Initializes a new CGRect with a center point and size.
    init(center: CGPoint, size: CGSize) {
        self.init(x: center.x - (size.width * 0.5),
                  y: center.y - (size.height * 0.5),
                  width: size.width,
                  height: size.height)
    }

    /// The center point of the rect. Settable.
    var center: CGPoint {
        get {
            CGPoint(x: midX, y: midY)
        }
        set {
            origin = CGPoint(x: newValue.x - (size.width * 0.5),
                             y: newValue.y - (size.height * 0.5))
        }
    }

    /// The top left point of the rect. Settable.
    var topLeft: CGPoint {
        get {
            CGPoint(x: minX, y: minY)
        }
        set {
            origin = CGPoint(x: newValue.x,
                             y: newValue.y)
        }
    }

    /// The bottom left point of the rect. Settable.
    var bottomLeft: CGPoint {
        get {
            CGPoint(x: minX, y: maxY)
        }
        set {
            origin = CGPoint(x: newValue.x,
                             y: newValue.y - size.height)
        }
    }

    /// The top right point of the rect. Settable.
    var topRight: CGPoint {
        get {
            CGPoint(x: maxX, y: minY)
        }
        set {
            origin = CGPoint(x: newValue.x - size.width,
                             y: newValue.y)
        }
    }

    /// The bottom right point of the rect. Settable.
    var bottomRight: CGPoint {
        get {
            CGPoint(x: maxX, y: maxY)
        }
        set {
            origin = CGPoint(x: newValue.x - size.width,
                             y: newValue.y - size.height)
        }
    }
}

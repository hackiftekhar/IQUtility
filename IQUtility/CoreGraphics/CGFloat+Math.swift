//
//  CGFloat+Math.swift
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

public extension CGFloat {

    var degreesToRadians: CGFloat {
        self*(CGFloat.pi/180.0)
    }

    var radiansToDegrees: CGFloat {
        self*(180.0/CGFloat.pi)
    }

    //    Say the distances are P1-P2 = A, P2-P3 = B and P3-P1 = C:
    //    Angle = arccos ( (B^2-A^2-C^2) / 2AC )
    //    Angle will be in radian
    func angle(center: CGPoint, point1: CGPoint, point2: CGPoint) -> CGFloat {
        // Find angle.
        let angle = atan2(point2.y-center.y, point2.x-center.x) - atan2(point1.y-center.y, point1.x-center.x)

        // If angle is less than 0. then adding 360 degree to it.
        return (angle>0 ? angle : angle+CGFloat.pi*2)
    }
}

//
//  CGPoint+Math.swift
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

public extension CGPoint {

    /*
     A (x1, y1) and B (x2, y2) = sqrt( (x2−x1)2+(y2−y1)2)
     */
    static func distance(point1: CGPoint, point2: CGPoint) -> CGFloat {

        let distanceX = point2.x - point1.x
        let distanceY = point2.y - point1.y

        return sqrt((distanceX*distanceX + distanceY*distanceY))
    }

    static func midPoint(point1: CGPoint, point2: CGPoint) -> CGPoint {
        CGPoint(x: (point1.x+point2.x)/2, y: (point1.y+point2.y)/2)
    }

    /*  (x1,y1)         (x,y)                           (x2,y2) */
    /*  *-----------------*----------------------------------*  */
    /*  <----distance----->                                     */
    // Returns a point(x,y) lies between point1(x1,y1) and point2(x2,y2) by distance from point1(x1,y1).
    static func pointWithDistance(point1: CGPoint, point2: CGPoint, distance: CGFloat) -> CGPoint {
        if point1.equalTo(point2) {
            return .zero
        } else {
            // Finding relative percent from point1 till distance ( 0.0 - 1.0).
            let relativePercent = distance/CGPoint.distance(point1: point1, point2: point2)
            // Calculating distance from point1.
            let distanceX = point1.x + relativePercent * (point2.x - point1.x)
            let distanceY = point1.y + relativePercent * (point2.y - point1.y)

            // Returning Points
            return CGPoint(x: distanceX, y: distanceY)
        }
    }

    /*
                    rotated point
                         *
                        /
                       /
                      /
                     /
                    /__
                   /    \
                  /angle |  point(x,y)
       base(x,y) *------------------*
     // Angle should be in radian
     */
    static func rotate(basePoint: CGPoint, point: CGPoint, angle: CGFloat) -> CGPoint {

        let pointX = cos(angle) * (point.x-basePoint.x) - sin(angle) * (point.y-basePoint.y) + basePoint.x
        let pointY = sin(angle) * (point.x-basePoint.x) + cos(angle) * (point.y-basePoint.y) + basePoint.y

        return CGPoint(x: pointX, y: pointY)
    }
}

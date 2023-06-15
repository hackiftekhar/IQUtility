//
//  IQGradientView.swift
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

open class IQGradientView: UIView {

    public enum Direction {

        case horizontal
        case vertical
        case custom(startPoint: CGPoint, endPoint: CGPoint) // swiftlint:disable:this identifier_name

        var points: (startPoint: CGPoint, endPoint: CGPoint) {
            switch self {
            case .horizontal:
                return (startPoint: CGPoint(x: 0, y: 0.5), endPoint: CGPoint(x: 1, y: 0.5))
            case .vertical:
                return (startPoint: CGPoint(x: 0.5, y: 0), endPoint: CGPoint(x: 0.5, y: 1))
            case let .custom(startPoint, endPoint):
                return (startPoint: startPoint, endPoint: endPoint)
            }
        }
    }

    open override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }

    public var gradientLayer: CAGradientLayer {
        layer as! CAGradientLayer
    }

    open var direction = Direction.vertical {
        didSet {
            let directionPoints = direction.points
            gradientLayer.startPoint = directionPoints.startPoint
            gradientLayer.endPoint = directionPoints.endPoint
        }
    }

    open var locations: [CGFloat] = [] {
        didSet {
            gradientLayer.locations = locations.map { NSNumber(value: $0) }
        }
    }

    open var colors: [UIColor] = [] {
        didSet {
            gradientLayer.colors = colors.map { $0.cgColor }
        }
    }
}

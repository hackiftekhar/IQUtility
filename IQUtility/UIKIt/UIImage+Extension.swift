//
//  UIImage+Extension.swift
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

public extension UIImage {

    func fixedOrientation() -> UIImage {

        guard imageOrientation != UIImage.Orientation.up,
                let cgImage = cgImage else {
            //CGImage is not available
            return copy() as? UIImage ?? self
        }

        guard let colorSpace = cgImage.colorSpace,
              let ctx = CGContext(data: nil,
                                  width: Int(size.width),
                                  height: Int(size.height),
                                  bitsPerComponent: cgImage.bitsPerComponent,
                                  bytesPerRow: 0,
                                  space: colorSpace,
                                  bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue) else {
            return copy() as? UIImage ?? self
        }

        var transform: CGAffineTransform = CGAffineTransform.identity

        switch imageOrientation {
        case .down, .downMirrored:
            transform = transform.translatedBy(x: size.width, y: size.height)
            transform = transform.rotated(by: CGFloat.pi)
            break
        case .left, .leftMirrored:
            transform = transform.translatedBy(x: size.width, y: 0)
            transform = transform.rotated(by: CGFloat.pi / 2.0)
            break
        case .right, .rightMirrored:
            transform = transform.translatedBy(x: 0, y: size.height)
            transform = transform.rotated(by: CGFloat.pi / -2.0)
            break
        case .up, .upMirrored:
            break
        @unknown default:
            break
        }

        //Flip image one more time if needed to, this is to prevent flipped image
        switch imageOrientation {
        case .upMirrored, .downMirrored:
            transform = transform.translatedBy(x: size.width, y: 0)
            transform = transform.scaledBy(x: -1, y: 1)
            break
        case .leftMirrored, .rightMirrored:
            transform = transform.translatedBy(x: size.height, y: 0)
            transform = transform.scaledBy(x: -1, y: 1)
        case .up, .down, .left, .right:
            break
        @unknown default:
            break
        }

        ctx.concatenate(transform)

        switch imageOrientation {
        case .left, .leftMirrored, .right, .rightMirrored:
            ctx.draw(cgImage, in: CGRect(x: 0, y: 0, width: size.height, height: size.width))
        default:
            ctx.draw(cgImage, in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
            break
        }

        guard let newCGImage = ctx.makeImage() else { return copy() as? UIImage ?? self }
        return UIImage.init(cgImage: newCGImage, scale: 1, orientation: .up)
    }


    enum Gravity {

        case aspectFit
        case aspectFill
        case resize
    }

    var isOpaque: Bool {
        let isOpaque: Bool
        if let alphaInfo = cgImage?.alphaInfo {
            switch alphaInfo {
            case .none:
                isOpaque = false
            case .premultipliedLast, .premultipliedFirst, .first, .last, .noneSkipFirst, .noneSkipLast, .alphaOnly:
                isOpaque = true
            @unknown default:
                isOpaque = true
            }
        } else {
            isOpaque = false
        }
        return isOpaque
    }

    func resize(size: CGSize, gravity: Gravity) -> UIImage {
        let finalSize: CGSize
        switch gravity {
        case .aspectFit:
            finalSize = self.size.sizeThatFits(size)
        case .aspectFill:
            finalSize = self.size.sizeThatFill(size)
        case .resize:
            finalSize = size
        }

        guard !self.size.equalTo(finalSize) else {
            return copy() as? UIImage ?? self
        }

        let format = UIGraphicsImageRendererFormat()
        format.scale = 1.0
        format.opaque = isOpaque
        let renderer = UIGraphicsImageRenderer(size: finalSize, format: format)

        return renderer.image {
            let context = $0.cgContext
            draw(in: .init(origin: .zero, size: finalSize))
        }
    }

    enum Axis {
        case horizontal
        case vertical
    }

    func flip(axis: Axis) -> UIImage {

        let format = UIGraphicsImageRendererFormat()
        format.scale = 1.0
        format.opaque = isOpaque
        let renderer = UIGraphicsImageRenderer(size: size, format: format)

         return renderer.image {
           let context = $0.cgContext
           context.translateBy(x: size.width / 2, y: size.height / 2)

           switch axis {
           case .horizontal:
             context.scaleBy(x: -1, y: 1)
           case .vertical:
             context.scaleBy(x: 1, y: -1)
           }

           context.translateBy(x: -size.width / 2, y: -size.height / 2)

           draw(at: .zero)
         }
    }
}

//
//  CGSize+Extension.swift
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

public extension CGSize {

    func scaleThatFits(_ size: CGSize) -> CGFloat {
        CGFloat.minimum(size.width / width, size.height / height)
    }

    func scaleThatFill(_ size: CGSize) -> CGFloat {
        CGFloat.maximum(size.width / width, size.height / height)
    }

    func sizeThatFits(_ aSize: CGSize) -> CGSize {
        let newWidth = min(width * aSize.height / height, aSize.width)
        return CGSize(width: newWidth, height: height * newWidth / width)
    }

    func sizeThatFill(_ aSize: CGSize) -> CGSize {
        let newWidth = max(width * aSize.height / height, aSize.width)
        return CGSize(width: newWidth, height: height * newWidth / width)
    }
}

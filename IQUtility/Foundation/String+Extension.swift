//
//  String+Extension.swift
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

public extension String {

    func removeCharacters(from forbiddenChars: CharacterSet) -> String {
        let passed = self.unicodeScalars.filter { !forbiddenChars.contains($0) }
        return String(String.UnicodeScalarView(passed))
    }

    func contains<T: StringProtocol>(find: T, options: NSString.CompareOptions = []) -> Bool {
        return self.range(of: find, options: options) != nil
    }

    func sizeThatFit(width: CGFloat = .greatestFiniteMagnitude,
                     height: CGFloat = .greatestFiniteMagnitude,
                     attributes: [NSAttributedString.Key: Any]? = nil) -> CGSize {
        let constraintRect = CGSize(width: width, height: height)
        let boundingBox = self.boundingRect(with: constraintRect,
                                            options: .usesLineFragmentOrigin,
                                            attributes: attributes, context: nil)
        return boundingBox.size
    }

    func trimming() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    mutating func trim() {
        self = self.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    /// Returns a localized string
    var localizedString: String {
        return NSLocalizedString(self, comment: self)
    }
}

public extension String {

    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, count) ..< count]
    }

    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }

    func substring(with range: Range<Int>) -> String {
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(startIndex, offsetBy: range.upperBound)
        return String(self[start..<end])
    }

    func substring(with range: NSRange) -> String {
        return String(self[range.location..<(range.location + range.length)])
    }

    func nsRange(of aString: String) -> NSRange? {
        if let range = range(of: aString) {
            return NSRange(range, in: aString)
        }
        return nil
    }
}

public extension String {

    var cgFloat: CGFloat {
        return float.cgFloat
    }

    var float: Float {
        return Float(digits) ?? 0
    }

    var double: Double {
        return Double(digits) ?? 0
    }

    var int: Int {
        if let int = Int(digits) {
            return int
        } else {
            return Int(float)
        }
    }

    var digits: String {
        var characterSet = CharacterSet.decimalDigits
        characterSet.insert(".")
        characterSet.insert("-")
        characterSet.insert("+")
        let componentArr = components(separatedBy: characterSet.inverted)
        return componentArr.joined()
    }
}

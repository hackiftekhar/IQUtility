//
//  UITableView+Reuse.swift
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

public extension UITableView {
    
    // MARK: - Dequeue
    func dequeueReusableCell<T: UITableViewCell>(withIdentifier identifier: String? = nil, for indexPath: IndexPath? = nil) -> T {
        let identifier: String = identifier ?? T.reuseIdentifier

        if let indexPath = indexPath {
            guard let cell =  dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? T else {
                fatalError("Unable to dequeue cell \(T.self)")
            }
            return cell
        } else {
            guard let cell =  dequeueReusableCell(withIdentifier: identifier) as? T else {
                fatalError("Unable to dequeue cell \(T.self)")
            }
            return cell
        }
    }
    
    func dequeueReusableHeaderFooter<T: UIView>(withIdentifier identifier: String? = nil) -> T {
        let identifier: String = identifier ?? T.reuseIdentifier
        guard let view =  dequeueReusableHeaderFooterView(withIdentifier: identifier) as? T else {
            fatalError("Unable to dequeue header/footer \(T.self)")
        }
        return view
    }
}

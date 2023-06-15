//
//  UIView+Controller.swift
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

public extension UIView {
    /// Return the controller that is responsible for managing this view.
    var viewController: UIViewController? {

        var responder: UIResponder? = self
        repeat {
            responder = responder?.next
            if let viewController = responder as? UIViewController {
                return viewController
            }
        } while(responder != nil)

        return nil
    }

    /// Return the name of the view's class as it's reuse identifier.
    class var reuseIdentifier: String {
        return String(describing: self)
    }

    class func loadFromNib<View: UIView>() -> View {
        let nibName = View.reuseIdentifier
        let nib = UINib(nibName: nibName, bundle: Bundle(for: View.self))
        let views = nib.instantiate(withOwner: nil, options: nil)
        guard let view = views.first as? View else {
            fatalError("Unable to find \(nibName)")
        }
        return view
    }
}

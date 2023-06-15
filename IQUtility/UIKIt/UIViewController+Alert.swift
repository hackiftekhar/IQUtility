//
//  UIViewController+Alert.swift
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

public extension UIViewController {

    struct ActionButton {
        let title: String
        let handler: (() -> Void)?

        public init(title: String, handler: (() -> Void)? = nil) {
            self.title = title
            self.handler = handler
        }
    }

    func showAlert(title: String?,
                   message: String?,
                   sourceView: Any? = nil,
                   cancel: ActionButton = ActionButton(title: "OK"),
                   destructive: ActionButton? = nil,
                   buttons: ActionButton...) {

        showAlert(title: title, message: message, preferredStyle: .alert, sourceView: sourceView, cancel: cancel, destructive: destructive, buttons: buttons)
    }

    func showActionSheet(title: String?,
                         message: String?,
                         sourceView: Any? = nil,
                         cancel: ActionButton = ActionButton(title: "Cancel"),
                         destructive: ActionButton? = nil,
                         buttons: ActionButton...) {

        showAlert(title: title, message: message, preferredStyle: .actionSheet, sourceView: sourceView, cancel: cancel, destructive: destructive, buttons: buttons)
    }

    func showAlert(title: String?,
                   message: String?,
                   preferredStyle: UIAlertController.Style = .alert,
                   sourceView: Any? = nil,
                   cancel: ActionButton,
                   destructive: ActionButton? = nil,
                   buttons: [ActionButton]) {

        let alert = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        alert.addAction(UIAlertAction(title: cancel.title, style: .cancel, handler: { _ in
            cancel.handler?()
        }))

        if let destructive = destructive {
            alert.addAction(UIAlertAction(title: destructive.title, style: .destructive, handler: { _ in
                destructive.handler?()
            }))
        }

        for button in buttons {
            alert.addAction(UIAlertAction(title: button.title, style: .default, handler: { _ in
                button.handler?()
            }))
        }

        if let sourceView = sourceView as? UIView {
            alert.popoverPresentationController?.sourceView = sourceView
        } else if let sourceItem = sourceView as? UIBarButtonItem {
//            if #available(iOS 16.0, *) {
//                alert.popoverPresentationController?.sourceItem = sourceItem
//            } else {
                alert.popoverPresentationController?.barButtonItem = sourceItem
//            }
        } else {
            alert.popoverPresentationController?.sourceRect = self.view.bounds
        }

        self.present(alert, animated: true)
    }
}

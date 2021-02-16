//
//  ViewController.swift
//  Utility Demo
//
//  Created by Iftekhar on 12/02/21.
//

import UIKit
import IQUtility

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let rect = CGRect(x: 100, y: 300, width: 200, height: 200)

        do {
            let view = UIView(frame: rect)
            view.backgroundColor = UIColor.green
            view.layer.borderWidth = 1
            view.layer.borderColor = UIColor.green.cgColor
            self.view.addSubview(view)
        }

        let frame = CGRect(x: 125, y: 150, width: 150, height: 500)

        print(frame.size.scaleThatFits(rect.size))
        print(frame.size.scaleThatFill(rect.size))

        do {

            let view = UIView(frame: frame)
            view.layer.borderWidth = 1
            view.layer.borderColor = UIColor.red.cgColor
            self.view.addSubview(view)
        }

        do {

            let rect = frame.aspectFill(rect)
            let view = UIView(frame: rect)
            view.layer.borderWidth = 1
            view.layer.borderColor = UIColor.orange.cgColor
            self.view.addSubview(view)
        }

        do {
            let rect = frame.aspectFit(rect)
            let view = UIView(frame: rect)
            view.layer.borderWidth = 1
            view.layer.borderColor = UIColor.yellow.cgColor
            self.view.addSubview(view)
        }
    }
}

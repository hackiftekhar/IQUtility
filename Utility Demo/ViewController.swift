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

        let center = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
        let rect1 = CGRect(center: center, size: CGSize(width: 300, height: 300))
        let rect2 = CGRect(x: 0, y: 0, width: 200, height: 400)

        do {
            let view = UIView(frame: rect2.aspectFill(rect1))
            view.backgroundColor = UIColor.orange
            self.view.addSubview(view)
        }

        do {
            let view = UIView(frame: rect1)
            view.backgroundColor = UIColor.green
            self.view.addSubview(view)
        }

        do {
            let view = UIView(frame: rect2.aspectFit(rect1))
            view.backgroundColor = UIColor.red
            self.view.addSubview(view)
        }
    }
}

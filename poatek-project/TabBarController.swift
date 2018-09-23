//
//  ViewController.swift
//  poatek-project
//
//  Created by Filipe Jordão on 21/09/18.
//  Copyright © 2018 Filipe Jordão. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewControllers = [MoviesViewController.setup()]
    }
}

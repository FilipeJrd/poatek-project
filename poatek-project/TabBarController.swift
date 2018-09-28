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
        self.tabBar.tintColor =  #colorLiteral(red: 0.1294117647, green: 0.8156862745, blue: 0.4784313725, alpha: 1)
        self.tabBar.barTintColor = #colorLiteral(red: 0.03137254902, green: 0.1098039216, blue: 0.1333333333, alpha: 1)
        self.viewControllers = [TopMoviesViewController.setup(),
                                PopularMoviesViewController.setup(),
                                FavoriteMoviesViewController.setup()]
    }
}

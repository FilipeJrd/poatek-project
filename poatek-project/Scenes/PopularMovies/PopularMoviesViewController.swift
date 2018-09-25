//
//  PopularMoviesViewController.swift
//  poatek-project
//
//  Created by Filipe Jordão on 24/09/18.
//  Copyright © 2018 Filipe Jordão. All rights reserved.
//

import UIKit

class PopularMoviesViewController: MoviesViewController {
    override func viewDidLoad() {
        self.title = "Popular"
        super.viewDidLoad()
    }

    static func setup() -> UIViewController {
        let viewController = PopularMoviesViewController()
        let interactor = PopularMoviesInteractor()
        let presenter = MoviesPresenter()

        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController

        let navVc = UINavigationController(rootViewController: viewController)
        navVc.navigationBar.barTintColor = #colorLiteral(red: 0.03137254902, green: 0.1098039216, blue: 0.1333333333, alpha: 1)
        navVc.navigationBar.prefersLargeTitles = true
        navVc.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navVc.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

        navVc.navigationBar.isTranslucent = false
        return navVc
    }
}

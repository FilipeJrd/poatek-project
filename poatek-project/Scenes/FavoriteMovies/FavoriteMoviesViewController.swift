//
//  FavoriteMoviesViewController.swift
//  poatek-project
//
//  Created by Filipe Jordão on 27/09/18.
//  Copyright © 2018 Filipe Jordão. All rights reserved.
//

import UIKit

class FavoriteMoviesViewController: MoviesViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Favorites"
    }

    override func setupDataDriver() {
        let dataFetcher = self.rx.methodInvoked(#selector(self.viewWillAppear))
            .asObservable()
            .map { _ in 0 }
            .asDriver(onErrorJustReturn: 0)

        self.interactor?.fetchMovies(from: dataFetcher)
    }

    static func setup() -> UIViewController {
        let viewController = FavoriteMoviesViewController()
        let interactor = MoviesInteractor()
        let presenter = MoviesPresenter()
        let datastore = FavoriteMoviesDataStore()
        let router = MoviesRouter()

        viewController.interactor = interactor
        viewController.router = router

        router.viewController = viewController
        router.datastore = datastore

        interactor.presenter = presenter
        interactor.datastore = datastore

        presenter.viewController = viewController

        viewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 2)

        let navVc = UINavigationController(rootViewController: viewController)
        navVc.navigationBar.barTintColor = #colorLiteral(red: 0.03137254902, green: 0.1098039216, blue: 0.1333333333, alpha: 1)
        navVc.navigationBar.prefersLargeTitles = true
        navVc.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.1294117647, green: 0.8156862745, blue: 0.4784313725, alpha: 1)]
        navVc.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.1294117647, green: 0.8156862745, blue: 0.4784313725, alpha: 1)]

        navVc.navigationBar.isTranslucent = false
        return navVc
    }
}

//
//  TopMoviesViewController.swift
//  poatek-project
//
//  Created by Filipe Jordão on 24/09/18.
//  Copyright © 2018 Filipe Jordão. All rights reserved.
//

import UIKit

class TopMoviesViewController: MoviesViewController {
    static func setup() -> UIViewController {
        let viewController = MoviesViewController()
        let interactor = TopMoviesInteractor()
        let presenter = MoviesPresenter()

        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController

        return viewController
    }
}

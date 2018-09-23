//
//  TopMoviesViewController.swift
//  poatek-project
//
//  Created by Filipe Jordão on 22/09/18.
//  Copyright © 2018 Filipe Jordão. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

protocol TopMoviesDisplayLogic {
    func display(movies: Driver<TopMoviesModel.Fetch.Viewmodel>)
}

class TopMoviesViewController: UIViewController {
    var interactor: TopMoviesBusinessLogic?
    let driver = Driver.just(TopMoviesModel.Fetch.Request(page: 0, pageSize: 2))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.interactor?.bindMoviesFetch(to: driver)
    }
}

extension TopMoviesViewController: TopMoviesDisplayLogic {
    func display(movies: Driver<TopMoviesModel.Fetch.Viewmodel>) {
        
    }
}

extension TopMoviesViewController {
    static func setup() -> TopMoviesViewController {
        let viewController = TopMoviesViewController()
        let interactor = TopMoviesInteractor()
        let presenter = TopMoviesPresenter()
        
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        return viewController
    }
}

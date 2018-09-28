//
//  MoviesViewModel.swift
//  poatek-project
//
//  Created by Filipe Jordão on 22/09/18.
//  Copyright © 2018 Filipe Jordão. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class MoviesInteractor: MoviesBusinessLogic {
    var presenter: MoviesPresenter?
    var datastore: MoviesDataStore?

    func fetchMovies(from page: Driver<Page>) {
        guard let datastore = datastore else {
            return
        }

        let movies = MoviesWorker(datastore: datastore)
            .movies(page: page.map{ $0.page }.asObservable())
        self.presenter?.presentationInput(movies)
    }
}

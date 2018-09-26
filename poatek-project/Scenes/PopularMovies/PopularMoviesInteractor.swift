//
//  PopularMoviesInteractor.swift
//  poatek-project
//
//  Created by Filipe Jordão on 24/09/18.
//  Copyright © 2018 Filipe Jordão. All rights reserved.
//

import Foundation
import RxCocoa

class PopularMoviesInteractor: MoviesBusinessLogic {
    var presenter: MoviesPresentationLogic?

    func fetchMovies(from page: Driver<Page>) {
        let worker = PopularMoviesWorker()
        let processed = page
            .asObservable()
            .flatMap { worker.popularMovies(page: $0.page) }

        self.presenter?.presentationInput(processed)
    }
}

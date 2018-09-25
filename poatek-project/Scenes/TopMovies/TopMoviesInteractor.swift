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

class TopMoviesInteractor: MoviesBusinessLogic {
    var presenter: MoviesPresenter?

    func fetchMovies(from page: Driver<Page>) {
        let worker = TopMoviesWorker()
        let processed = page
                        .asObservable()
                        .flatMap { worker.topRatedMovies(page: $0.page) }

        self.presenter?.presentationInput(processed)
    }
}

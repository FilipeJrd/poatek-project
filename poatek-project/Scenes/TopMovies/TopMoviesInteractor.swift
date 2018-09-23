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
typealias Page = MoviesRequest

protocol MoviesBusinessLogic {
    func fetchMovies(from page: Driver<Page>)
}

class MoviesInteractor: MoviesBusinessLogic {
    var presenter: MoviesPresenter?

    func fetchMovies(from page: Driver<Page>) {
        let worker = MoviesWorker()
        let processed = page
                        .asObservable()
                        .flatMap { worker.topRatedMovies(page: $0.page) }

        self.presenter?.presentationInput(processed)
    }
}

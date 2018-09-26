//
//  MovieDetailInteractor.swift
//  poatek-project
//
//  Created by Filipe Jordão on 25/09/18.
//  Copyright © 2018 Filipe Jordão. All rights reserved.
//

import Foundation
import RxSwift

protocol MovieDetailBusinessLogic {
    func fetchDetails(_ request: Observable<Void>)
}

class MovieDetailInteractor: MovieDetailBusinessLogic {
    var presenter: MovieDetailPresentationLogic?
    private var movie: Observable<MovieViewModel>

    init(movie: MovieViewModel) {
        self.movie = Observable.just(movie)
    }

    func fetchDetails(_ request: Observable<Void>) {
        self.presenter?.present(movie: self.movie)
    }
}

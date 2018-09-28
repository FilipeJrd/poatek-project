//
//  PopularMoviesDataStore.swift
//  poatek-project
//
//  Created by Filipe Jordão on 27/09/18.
//  Copyright © 2018 Filipe Jordão. All rights reserved.
//

import Foundation
import RxSwift
import Moya

class PopularMoviesDataStore: MoviesDataStore {
    private let provider = MoyaProvider<TheMovieDBAPI>()
    private var moviesObs: Observable<[Movie]>?

    func setup(with pageInput: Observable<Int>) {
        moviesObs = pageInput.flatMap { page in
            return
                self.provider.rx
                    .request(.mostPopularMovies(page: page))
                    .map(MoviesResponse.self)
                    .asObservable()
            }.map { $0.movies }
            .scan([], accumulator: {$0 + $1})

    }
    func movies() -> Observable<[Movie]> {
        return moviesObs ?? Observable.just([])
    }
}

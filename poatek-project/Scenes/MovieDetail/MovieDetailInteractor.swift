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
    func toggleFavorite(_ request: Observable<Void>)
}

class MovieDetailInteractor: MovieDetailBusinessLogic {
    private let disposeBag = DisposeBag()
    private let initialMovie: Movie

    private var movie: PublishSubject<MovieDetailResponse>
    var presenter: MovieDetailPresentationLogic?

    init(movie: Movie) {
        self.initialMovie = movie
        self.movie = PublishSubject<MovieDetailResponse>()
    }

    func toggleFavorite(_ request: Observable<Void>) {

        request.withLatestFrom(self.movie)
            .subscribe(onNext: { movieDetailResponse in
                guard let favoriteDB = try? FavoriteMoviesDB() else { return }
                if movieDetailResponse.isFavorite {
                    try? favoriteDB.removeFavorite(movieDetailResponse.movie)
                } else {
                    try? favoriteDB.saveFavorite(movieDetailResponse.movie)
                }
        }).disposed(by: disposeBag)

        request.withLatestFrom(self.movie)
            .map { movie in MovieDetailResponse(movie: movie.movie, isFavorite: !movie.isFavorite)}
            .bind(to: self.movie)
            .disposed(by: disposeBag)
    }

    func fetchDetails(_ request: Observable<Void>) {
        self.presenter?.present(movie: self.movie.asObservable())

        guard let favoriteDB = try? FavoriteMoviesDB() else {
            return
        }

        let isFavorite = favoriteDB.isFavorite(initialMovie)
        self.movie.onNext(MovieDetailResponse(movie: initialMovie, isFavorite: isFavorite))
    }
}

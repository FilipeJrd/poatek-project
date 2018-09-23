//
//  MoviesPresenter.swift
//  poatek-project
//
//  Created by Filipe Jordão on 22/09/18.
//  Copyright © 2018 Filipe Jordão. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

typealias PageResponse = MoviesResponse
protocol MoviesPresentationLogic {
    func presentationInput(_ input: Observable<PageResponse>)
}

class MoviesPresenter: MoviesPresentationLogic {
    var viewController: MoviesDisplayLogic?

    func presentationInput(_ input: Observable<PageResponse>) {
        let moviesDriver = input
            .map(self.viewModel)
            .asDriver(onErrorJustReturn: MoviesViewModel(movies: []))
        self.viewController?.display(movies: moviesDriver)
    }

    private func viewModel(from response: PageResponse) -> MoviesViewModel {
        let movies = response.movies.map(self.movieViewModel)
        return MoviesViewModel(movies: movies)
    }

    private func movieViewModel(from movie: Movie) -> MovieViewModel {
        return MovieViewModel(title: movie.title,
                              averageRating: "\(movie.averageRating)",
                              releaseDate: movie.releaseDate)
    }
}

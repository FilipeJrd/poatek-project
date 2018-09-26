//
//  MoviesPresenter.swift
//  poatek-project
//
//  Created by Filipe Jordão on 22/09/18.
//  Copyright © 2018 Filipe Jordão. All rights reserved.
//

import Foundation
import RxCocoa
import Moya
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

        let errorDriver = input
            .map { _ in String() }
            .asDriver(onErrorJustReturn: "Something went wrong")
            .filter { !$0.isEmpty }

        self.viewController?.display(errorMessage: errorDriver)
        self.viewController?.display(movies: moviesDriver)
    }

    private func viewModel(from response: PageResponse) -> MoviesViewModel {
        let movies = response.movies.map(self.movieViewModel)
        return MoviesViewModel(movies: movies)
    }

    private func movieViewModel(from movie: Movie) -> MovieViewModel {

        return MovieViewModel(title: movie.title,
                              averageRating: movie.averageRating * 10 ,
                              releaseDate: movie.releaseDate,
                              imageURL: self.imageURL(from: movie),
                              summary: movie.overview)
    }

    private func imageURL(from movie: Movie) -> String? {
        if let backdrop = movie.backdropPath {
            return "https://image.tmdb.org/t/p/w500\(backdrop)"
        }
        return nil
    }
}

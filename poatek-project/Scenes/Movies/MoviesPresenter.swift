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
    func presentationInput(_ input: Observable<[Movie]>)
}

class MoviesPresenter: MoviesPresentationLogic {
    var viewController: MoviesDisplayLogic?

    func presentationInput(_ input: Observable<[Movie]>) {
        let moviesDriver = input
            .map(self.movieViewModel)
            .asDriver(onErrorJustReturn: [])

        let errorDriver = input
            .map { _ in String() }
            .asDriver(onErrorJustReturn: "Something went wrong")
            .filter { !$0.isEmpty }

        self.viewController?.display(errorMessage: errorDriver)
        self.viewController?.display(movies: moviesDriver)
    }

    func movieViewModel(from movies: [Movie]) -> [MovieViewModel] {
        return movies.map { MovieViewModel.from(movie: $0) }
    }
}

//
//  MovieDetailPresenter.swift
//  poatek-project
//
//  Created by Filipe Jordão on 26/09/18.
//  Copyright © 2018 Filipe Jordão. All rights reserved.
//

import Foundation
import RxSwift

protocol MovieDetailPresentationLogic {
    func present(movie: Observable<MovieViewModel>)
}

class MovieDetailPresenter: MovieDetailPresentationLogic {
    var viewController: MovieDetailDisplayLogic?

    func present(movie: Observable<MovieViewModel>) {
        let emptyViewModel = MovieViewModel(title: "", averageRating: 0, releaseDate: "", imageURL: nil, summary: "")
        self.viewController?.display(movie: movie.asDriver(onErrorJustReturn: emptyViewModel))
    }
}

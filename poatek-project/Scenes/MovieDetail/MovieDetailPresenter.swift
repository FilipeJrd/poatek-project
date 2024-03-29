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
    func present(movie: Observable<MovieDetailResponse>)
}

class MovieDetailPresenter: MovieDetailPresentationLogic {
    var viewController: MovieDetailDisplayLogic?

    func present(movie: Observable<MovieDetailResponse>) {
        let emptyViewModel = MovieDetailViewModel(title: "",
                                                  averageRating: 0,
                                                  releaseDate: "",
                                                  imageURL: nil,
                                                  summary: "",
                                                  isFavorite: false)

        let viewModel = movie.map(MovieDetailViewModel.from)
                             .asDriver(onErrorJustReturn: emptyViewModel)

        self.viewController?.display(movie: viewModel)
    }
}

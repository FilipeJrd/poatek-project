//
//  TopMoviesPresenter.swift
//  poatek-project
//
//  Created by Filipe Jordão on 22/09/18.
//  Copyright © 2018 Filipe Jordão. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

typealias PageResponse = TopMoviesModel.Fetch.Response
protocol TopMoviesPresentationLogic {
    func presentationInput(_ input: Observable<PageResponse>)
}

class TopMoviesPresenter: TopMoviesPresentationLogic {
    var viewController: TopMoviesDisplayLogic?
    
    func presentationInput(_ input: Observable<PageResponse>) {
        let moviesDriver = input
            .map({_ in TopMoviesModel.Fetch.Viewmodel()})
            .asDriver(onErrorJustReturn: TopMoviesModel.Fetch.Viewmodel())
        self.viewController?.display(movies: moviesDriver)
    }
}

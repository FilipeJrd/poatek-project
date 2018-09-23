//
//  TopMoviesViewModel.swift
//  poatek-project
//
//  Created by Filipe Jordão on 22/09/18.
//  Copyright © 2018 Filipe Jordão. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
typealias Page = TopMoviesModel.Fetch.Request

protocol TopMoviesBusinessLogic {
    func bindMoviesFetch(to driver: Driver<Page>)
}

class TopMoviesInteractor: TopMoviesBusinessLogic {
    var presenter: TopMoviesPresenter?
    
    func bindMoviesFetch(to driver: Driver<Page>) {
        let processed = driver
                        .asObservable()
                        .debug()
                        .flatMap { _ in Observable.just(TopMoviesModel.Fetch.Response()) }

        self.presenter?.presentationInput(processed)
    }
}

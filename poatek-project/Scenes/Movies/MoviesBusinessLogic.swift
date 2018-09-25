//
//  MoviesBusinessLogic.swift
//  poatek-project
//
//  Created by Filipe Jordão on 24/09/18.
//  Copyright © 2018 Filipe Jordão. All rights reserved.
//

import Foundation
import RxCocoa

typealias Page = MoviesRequest

protocol MoviesBusinessLogic {
    func fetchMovies(from page: Driver<Page>)
}

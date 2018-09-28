//
//  MoviesWorker.swift
//  poatek-project
//
//  Created by Filipe Jordão on 27/09/18.
//  Copyright © 2018 Filipe Jordão. All rights reserved.
//

import Foundation
import RxMoya
import RxSwift

class MoviesWorker {
    let datastore: MoviesDataStore
    init(datastore: MoviesDataStore) {
        self.datastore = datastore
    }

    func movies(page: Observable<Int>) -> Observable<[Movie]> {
        datastore.setup(with: page)
        return datastore.movies()
    }
}

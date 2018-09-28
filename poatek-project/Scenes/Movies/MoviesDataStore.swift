//
//  MoviesDataStore.swift
//  poatek-project
//
//  Created by Filipe Jordão on 27/09/18.
//  Copyright © 2018 Filipe Jordão. All rights reserved.
//

import Foundation
import RxSwift

protocol MoviesDataStore {
    func setup(with pageInput: Observable<Int>)
    func movies() -> Observable<[Movie]>
}

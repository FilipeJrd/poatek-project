//
//  MoviesRouter.swift
//  poatek-project
//
//  Created by Filipe Jordão on 27/09/18.
//  Copyright © 2018 Filipe Jordão. All rights reserved.
//

import RxCocoa
import RxSwift
import UIKit

protocol MoviesRoutingLogic {
    func route(to detailedIndex: Observable<Int>)
}

class MoviesRouter: MoviesRoutingLogic {
    private let disposeBag = DisposeBag()
    weak var viewController: UIViewController?
    var datastore: MoviesDataStore?

    func route(to detailedIndex: Observable<Int>) {
        guard let datastore = datastore else { return }
        let movies = datastore.movies()

        detailedIndex
            .withLatestFrom(movies) { $1[$0] }
            .subscribe (onNext: { movie in
                DispatchQueue.main.async {
                    let destinationVc = MovieDetailViewController.setup(with: movie)
                    self.viewController?.present(destinationVc, animated: true)
                }
            })
            .disposed(by: disposeBag)
    }
}

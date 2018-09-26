//
//  MovieDetailViewController.swift
//  poatek-project
//
//  Created by Filipe Jordão on 25/09/18.
//  Copyright © 2018 Filipe Jordão. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import Nuke

protocol MovieDetailDisplayLogic {
    func display(movie: Driver<MovieViewModel>)
}
class MovieDetailViewController: UIViewController {
    let disposeBag = DisposeBag()
    let movieDetailView = MovieDetailView()
    var interactor: MovieDetailBusinessLogic?

    static func setup(with movie: MovieViewModel) -> UIViewController {
        let viewController = MovieDetailViewController()
        let interactor = MovieDetailInteractor(movie: movie)
        let presenter = MovieDetailPresenter()

        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController

        return viewController
    }

    override func loadView() {
        super.loadView()
        self.view = self.movieDetailView
        self.movieDetailView.closeAction = {
            self.dismiss(animated: true)
        }
        let dataLoader = self.rx.sentMessage(#selector(self.viewDidLoad))
                                .map { _ in }
        self.interactor?.fetchDetails(dataLoader)

    }
}

extension MovieDetailViewController: MovieDetailDisplayLogic {
    func display(movie: Driver<MovieViewModel>) {
        movie.asObservable().subscribe(onNext: { movie in
            self.movieDetailView.info.title.text = movie.title
            self.movieDetailView.info.date.text = movie.releaseDate
            self.movieDetailView.info.rating.value = CGFloat(movie.averageRating)
            self.movieDetailView.summary.text = movie.summary
            if let imageString = movie.imageURL, let url = URL(string: imageString) {
                Nuke.loadImage(with: url, into: self.movieDetailView.img)
            }
        }).disposed(by: self.disposeBag)
    }
}

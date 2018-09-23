//
//  MoviesView.swift
//  poatek-project
//
//  Created by Filipe Jordão on 23/09/18.
//  Copyright © 2018 Filipe Jordão. All rights reserved.
//

import SnapKit
import RxCocoa
import RxSwift
import UIKit

class MoviesView: UIView {
    var tableView: UITableView

    override init(frame: CGRect) {
        self.tableView = UITableView()
        super.init(frame: frame)
    }

    override func didMoveToWindow() {
        super.didMoveToWindow()
        self.setupTableView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MoviesView {
    private func setupTableView() {
        self.tableView.register(MovieViewCell.self, forCellReuseIdentifier: MovieViewCell.identifier)
        self.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { make in
            make.margins.equalToSuperview()
        }
    }
}

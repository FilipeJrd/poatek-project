//
//  MovieDetailView.swift
//  poatek-project
//
//  Created by Filipe Jordão on 25/09/18.
//  Copyright © 2018 Filipe Jordão. All rights reserved.
//

import UIKit
import SnapKit

class MovieDetailView: UIView {
    let img = UIImageView()
    let info = MovieBasicInfoView()
    let summary = UITextView()
    let close = UIButton()
    let favorite = UIButton()

    var closeAction: (() -> Void)?
    var favoriteAction: (() -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 0.03137254902, green: 0.1098039216, blue: 0.1333333333, alpha: 1)

        self.setupImg()
        self.setupInfo()
        self.setupSummary()
        self.setupClose()
        self.setupFavorite()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupFavorite() {
        self.addSubview(self.favorite)
        self.favorite.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        self.favorite.setTitle("Add to favorites", for: .normal)
        self.favorite.setTitleColor(#colorLiteral(red: 0.1294117647, green: 0.8156862745, blue: 0.4784313725, alpha: 1), for: .normal)
        self.favorite.addTarget(self, action: #selector(self.didPressFavorite), for: .touchUpInside)

        self.favorite.snp.makeConstraints { make in
            make.left.bottom.right.equalToSuperview()
        }
    }

    private func setupClose() {
        self.addSubview(self.close)
        self.close.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        self.close.setTitle("close", for: .normal)
        self.close.setTitleColor(#colorLiteral(red: 0.1294117647, green: 0.8156862745, blue: 0.4784313725, alpha: 1), for: .normal)
        self.close.addTarget(self, action: #selector(self.didPressClose), for: .touchUpInside)
        self.close.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(15)
        }
    }

    @objc private func didPressClose() {
        self.closeAction?()
    }

    @objc private func didPressFavorite() {
        self.favoriteAction?()
    }

    private func setupImg() {
        self.img.backgroundColor = .clear
        self.img.contentMode = .scaleAspectFit
        self.img.clipsToBounds = true
        self.addSubview(self.img)
        self.img.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.25)
        }
    }

    private func setupInfo() {
        self.addSubview(self.info)
        self.info.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.info.snp.makeConstraints { make in
            make.top.equalTo(self.img.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(80)
        }
    }

    private func setupSummary() {
        self.addSubview(self.summary)
        self.summary.isScrollEnabled = false
        self.summary.isEditable = false
        self.summary.textColor = .white
        self.summary.backgroundColor = .clear
        self.summary.font = UIFont.systemFont(ofSize: 20)
        self.summary.textAlignment = .justified
        self.summary.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(15)
            make.top.equalTo(self.info.snp.bottom)
            make.height.greaterThanOrEqualTo(0)
        }
    }
}

//
//  MovieBasicInfoView.swift
//  poatek-project
//
//  Created by Filipe Jordão on 24/09/18.
//  Copyright © 2018 Filipe Jordão. All rights reserved.
//

import UICircularProgressRing
import UIKit

class MovieBasicInfoView: UIView {
    let title: UILabel
    let rating: UICircularProgressRing
    let ratingContent: CircleView
    let date: UILabel

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    init() {
        self.rating = UICircularProgressRing()
        self.title = UILabel()
        self.date = UILabel()
        self.ratingContent = CircleView()

        super.init(frame: CGRect())

        self.setupRating()
        self.setupTitle()
        self.setupDate()
    }

    private func setupTitle() {
        self.addSubview(self.title)
        self.title.font = UIFont.boldSystemFont(ofSize: 20)
        self.title.textColor = #colorLiteral(red: 0.03137254902, green: 0.1098039216, blue: 0.1333333333, alpha: 1)
        self.title.snp.makeConstraints { make in
            make.top.equalTo(self.ratingContent)
            make.left.equalTo(self.ratingContent.snp.right).offset(20)
            make.right.equalToSuperview().offset(-40)
            make.height.equalTo(self.ratingContent).dividedBy(2)
        }
    }

    private func setupDate() {
        self.addSubview(self.date)
        self.date.font = UIFont.boldSystemFont(ofSize: 20)
        self.date.textColor = #colorLiteral(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
        self.date.snp.makeConstraints { make in
            make.top.equalTo(self.title.snp.bottom)
            make.left.equalTo(self.ratingContent.snp.right).offset(20)
            make.right.equalToSuperview().offset(-40)
            make.bottom.equalTo(self.ratingContent)
        }
    }

    private func setupRating() {
        self.ratingContent.backgroundColor = #colorLiteral(red: 0.03137254902, green: 0.1098039216, blue: 0.1333333333, alpha: 1)
        self.addSubview(ratingContent)
        self.ratingContent.snp.makeConstraints { make in
            make.top.left.equalTo(15)
            make.bottom.equalTo(-15)
            make.width.equalTo(self.ratingContent.snp.height)
        }

        self.ratingContent.addSubview(self.rating)

        self.rating.ringStyle = .ontop
        self.rating.outerRingColor = #colorLiteral(red: 0.03137254902, green: 0.1098039216, blue: 0.1333333333, alpha: 1)
        self.rating.innerRingColor = #colorLiteral(red: 0.1294117647, green: 0.8156862745, blue: 0.4784313725, alpha: 1)
        self.rating.innerRingSpacing = 0.0
        self.rating.fontColor = .white
        self.rating.font = .boldSystemFont(ofSize: 14)
        self.rating.startAngle = 270
        self.rating.snp.makeConstraints { make in
            make.top.bottom.left.right.equalTo(self.ratingContent)
        }
    }
}

//
//  MovieViewCell.swift
//  poatek-project
//
//  Created by Filipe Jordão on 23/09/18.
//  Copyright © 2018 Filipe Jordão. All rights reserved.
//

import UIKit
import SnapKit
import ShadowView

import UICircularProgressRing

class MovieViewCell: UITableViewCell {
    static let identifier = "MovieCell"
    let img = UIImageView()
    let info = MovieBasicInfoView()
    let content = UIView()

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)

        self.setupContentView()
        self.setupImg()
        self.setupInfoContainer()
    }

    private func setupContentView() {
        self.contentView.addSubview(self.content)
        self.content.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.top.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(-20)
        }

        self.content.shadowRadius = 5
        self.content.shadowOffset = CGSize.zero
        self.content.shadowColor = UIColor.black
        self.content.shadowOpacity = 0.3
    }

    private func setupImg() {
        self.content.addSubview(self.img)
        self.img.contentMode = .scaleAspectFill
        self.img.clipsToBounds = true
        self.img.snp.makeConstraints { make in
            make.bottom.top.left.right.equalToSuperview()
        }
    }

    private func setupInfoContainer() {
        self.content.addSubview(self.info)
        self.info.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.info.snp.makeConstraints { make in
            make.bottom.left.right.equalToSuperview()
            make.height.equalTo(80)
        }
    }
}

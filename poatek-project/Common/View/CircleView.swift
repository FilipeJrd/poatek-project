//
//  CircleView.swift
//  poatek-project
//
//  Created by Filipe Jordão on 23/09/18.
//  Copyright © 2018 Filipe Jordão. All rights reserved.
//

import UIKit

class CircleView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.makeRound()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.makeRound()
    }

    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        self.makeRound()
    }

    private func makeRound() {
        self.layer.cornerRadius = self.frame.height/2
        self.clipsToBounds = true
    }
}

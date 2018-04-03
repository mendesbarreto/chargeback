//
// Created by douglas.barreto on 4/2/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit

final class NuDefaultButton: UIButton {
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("This view could not be initialized by coder", file: #file, line: #line)
    }

    private func setupLayout() {
        addTopBorder(color: .disabledGrayNu, width: 1)
        backgroundColor = .clear
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupLayout()
    }
}

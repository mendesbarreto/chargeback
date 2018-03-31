//
// Created by Douglas Mendes  on 3/30/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit

class NuView: UIView {
    let contentView: UIView

    override init(frame: CGRect = .zero) {
        contentView = UIView()
        super.init(frame: frame)
        setupContentLayout()
    }

    private func setupContentLayout() {
        addSubview(contentView)
        contentView.anchorToFit(in: self, constant: 10)
        contentView.backgroundColor = .backgroundNu
        self.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.7)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("This view could not be initialized by coder", file: #file, line: #line)
    }

    func addChild(view: UIView) {
        contentView.addSubview(view)
    }
}

//
// Created by Douglas Mendes  on 3/25/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit

class BindableView<T>: NuView, Bindable {
    typealias ViewModel = T

    private(set) var viewModel: ViewModel!

    func bind (to viewModel: ViewModel) {
        self.viewModel = viewModel
    }
}

class BindableViewDefaultConstraints<T>: BindableView<T> {
    override func setupContentLayout () {
        addSubview(contentView)
        contentView.anchorToFit(in: self, constant: 10)
        contentView.backgroundColor = .backgroundNu
        self.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.7)
    }
}

//
// Created by douglas.barreto on 3/25/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit

class BindableView<T>: UIView, Bindable {
    typealias ViewModel = T

    func bind(to: ViewModel) {
        fatalError("Bind method should be implemented")
    }
}

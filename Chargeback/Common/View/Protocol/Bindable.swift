//
// Created by Douglas Mendes  on 3/25/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

protocol Bindable {
    associatedtype ViewModel
    func bind(to: ViewModel)
}

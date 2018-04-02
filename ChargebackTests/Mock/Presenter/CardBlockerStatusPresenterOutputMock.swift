//
// Created by douglas.barreto on 4/2/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation
@testable import Chargeback

final class CardBlockerStatusPresenterOutputMock: CardBlockerStatusPresenterOutput {
    var invokedShow = false
    var invokedShowCount = 0
    var invokedShowParameters: (cardBlockViewModel: CardBlockerStatusViewModel, Void)?
    var invokedShowParametersList = [(cardBlockViewModel: CardBlockerStatusViewModel, Void)]()

    func show (cardBlockViewModel: CardBlockerStatusViewModel) {
        invokedShow = true
        invokedShowCount += 1
        invokedShowParameters = (cardBlockViewModel, ())
        invokedShowParametersList.append((cardBlockViewModel, ()))
    }

    var invokedShowLoading = false
    var invokedShowLoadingCount = 0

    func showLoading () {
        invokedShowLoading = true
        invokedShowLoadingCount += 1
    }

    var invokedHideLoading = false
    var invokedHideLoadingCount = 0

    func hideLoading () {
        invokedHideLoading = true
        invokedHideLoadingCount += 1
    }
}

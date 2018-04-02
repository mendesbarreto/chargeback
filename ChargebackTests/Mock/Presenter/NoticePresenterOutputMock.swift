//
// Created by douglas.barreto on 4/2/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

@testable import Chargeback

final class NoticePresenterOutputMock: NoticePresenterOutput {
    var invokedShow = false
    var invokedShowCount = 0
    var invokedShowParameters: (notice: NoticeViewModel, Void)?
    var invokedShowParametersList = [(notice: NoticeViewModel, Void)]()

    func show (notice: NoticeViewModel) {
        invokedShow = true
        invokedShowCount += 1
        invokedShowParameters = (notice, ())
        invokedShowParametersList.append((notice, ()))
    }

    var invokedShowError = false
    var invokedShowErrorCount = 0

    func showError () {
        invokedShowError = true
        invokedShowErrorCount += 1
    }

    var invokedShowLoading = false
    var invokedShowLoadingCount = 0

    func showLoading () {
        invokedShowLoading = true
        invokedShowLoadingCount += 1
    }

    var invokedHideLoading = false
    var invokedHideLoadingCount = 0

    func hideLoading (onComplete: (() -> ())?) {
        invokedHideLoading = true
        invokedHideLoadingCount += 1
        onComplete?()
    }
}

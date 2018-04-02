//
// Created by douglas.barreto on 4/1/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import RxTest
import RxSwift

@testable import Chargeback

final class NoticePresenterInputMock: NoticePresenterInput {
    var invokedShow = false
    var invokedShowCount = 0
    var invokedShowParameters: (notice: Notice, Void)?
    var invokedShowParametersList = [(notice: Notice, Void)]()
    var stubbedShowError: Error?

    func show (notice: Notice) throws {
        invokedShow = true
        invokedShowCount += 1
        invokedShowParameters = (notice, ())
        invokedShowParametersList.append((notice, ()))
        if let error = stubbedShowError {
            throw error
        }
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

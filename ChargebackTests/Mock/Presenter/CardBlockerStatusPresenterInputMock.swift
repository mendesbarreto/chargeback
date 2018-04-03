//
// Created by douglas.barreto on 4/1/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import RxTest
import RxSwift

@testable import Chargeback

final class CardBlockerStatusPresenterInputMock: CardBlockerStatusPresenterInput {
    var invokedLockPadLockView = false
    var invokedLockPadLockViewCount = 0

    func lockPadLockView() {
        invokedLockPadLockView = true
        invokedLockPadLockViewCount += 1
    }

    var invokedUnlockPadLockView = false
    var invokedUnlockPadLockViewCount = 0

    func unlockPadLockView() {
        invokedUnlockPadLockView = true
        invokedUnlockPadLockViewCount += 1
    }

    var invokedShowLoading = false
    var invokedShowLoadingCount = 0

    func showLoading() {
        invokedShowLoading = true
        invokedShowLoadingCount += 1
    }

    var invokedHideLoading = false
    var invokedHideLoadingCount = 0

    func hideLoading(onComplete: (() -> Void)?) {
        invokedHideLoading = true
        invokedHideLoadingCount += 1
        onComplete?()
    }
}

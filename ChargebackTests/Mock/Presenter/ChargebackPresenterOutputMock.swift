//
// Created by douglas.barreto on 4/2/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

@testable import Chargeback

final class ChargebackPresenterOutputMock: ChargebackPresenterOutput {

    var invokedShowChargebackSuccessAlert = false
    var invokedShowChargebackSuccessAlertCount = 0

    func showChargebackSuccessAlert () {
        invokedShowChargebackSuccessAlert = true
        invokedShowChargebackSuccessAlertCount += 1
    }

    var invokedShowChargebackFailAlert = false
    var invokedShowChargebackFailAlertCount = 0

    func showChargebackFailAlert () {
        invokedShowChargebackFailAlert = true
        invokedShowChargebackFailAlertCount += 1
    }

    var invokedShowAutoblock = false
    var invokedShowAutoblockCount = 0

    func showAutoblock () {
        invokedShowAutoblock = true
        invokedShowAutoblockCount += 1
    }

    var invokedShow = false
    var invokedShowCount = 0
    var invokedShowParameters: (chargebackViewModel: ChargebackViewModel, Void)?
    var invokedShowParametersList = [(chargebackViewModel: ChargebackViewModel, Void)]()

    func show (chargebackViewModel: ChargebackViewModel) {
        invokedShow = true
        invokedShowCount += 1
        invokedShowParameters = (chargebackViewModel, ())
        invokedShowParametersList.append((chargebackViewModel, ()))
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

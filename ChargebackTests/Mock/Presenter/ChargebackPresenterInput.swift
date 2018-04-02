//
// Created by douglas.barreto on 4/1/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Quick
import Nimble
import RxSwift
import RxBlocking
import RxTest

@testable import Chargeback

class ChargebackPresenterInputMock: ChargebackPresenterInput {

    var invokedShow = false
    var invokedShowCount = 0
    var invokedShowParameters: (chargeback: Chargeback, Void)?
    var invokedShowParametersList = [(chargeback: Chargeback, Void)]()
    var stubbedShowError: Error?

    func show (chargeback: Chargeback) throws {
        invokedShow = true
        invokedShowCount += 1
        invokedShowParameters = (chargeback, ())
        invokedShowParametersList.append((chargeback, ()))
        if let error = stubbedShowError {
            throw error
        }
    }

    var invokedShowChargeBackActionSuccess = false
    var invokedShowChargeBackActionSuccessCount = 0

    func showChargeBackActionSuccess () {
        invokedShowChargeBackActionSuccess = true
        invokedShowChargeBackActionSuccessCount += 1
    }

    var invokedShowChargeBackActionError = false
    var invokedShowChargeBackActionErrorCount = 0

    func showChargeBackActionError () {
        invokedShowChargeBackActionError = true
        invokedShowChargeBackActionErrorCount += 1
    }

    var invokedShowAutoblock = false
    var invokedShowAutoblockCount = 0

    func showAutoblock () {
        invokedShowAutoblock = true
        invokedShowAutoblockCount += 1
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

    func hideLoading () {
        invokedHideLoading = true
        invokedHideLoadingCount += 1
    }
}

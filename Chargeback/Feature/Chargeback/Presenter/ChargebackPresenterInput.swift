//
// Created by Douglas Mendes on 3/31/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

protocol ChargebackPresenterInput: LoadablePresenter {
    func show(chargeback: Chargeback) throws

    func showChargeBackActionSuccess()

    func showChargeBackActionError()

    func showAutoblock()

    func showError()
}

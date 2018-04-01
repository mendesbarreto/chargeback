//
// Created by Douglas Mendes on 3/31/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

protocol ChargebackPresenterOutput: class {
    func showChargebackSuccessAlert ()

    func showChargebackFailAlert ()

    func show (chargebackViewModel: ChargebackViewModel)
}

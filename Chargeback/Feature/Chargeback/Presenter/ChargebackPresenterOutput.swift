//
// Created by douglas.barreto on 3/31/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

protocol ChargebackPresenterOutput: class {
    func show (chargebackViewModel: ChargeBackViewModel)

    func showError ()
}

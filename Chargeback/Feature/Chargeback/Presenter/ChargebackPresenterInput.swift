//
// Created by douglas.barreto on 3/31/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

protocol ChargebackPresenterInput {
    func show (chargeback: Chargeback) throws

    func showError ()
}

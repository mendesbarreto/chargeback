//
// Created by douglas.barreto on 3/31/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

final class ChargebackPresenterFactory {
    static func make (presenterOutput: ChargebackPresenterOutput) -> ChargebackPresenterInput {
        return ChargebackPresenter(presenterOutput: presenterOutput)
    }
}

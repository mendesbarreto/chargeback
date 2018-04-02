//
// Created by Douglas Mendes on 4/1/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

final class ChargebackUseCaseFactory {
    static func make (presenterOutput: ChargebackPresenterOutput) -> ChargebackUseCase {
        let presenterInput = ChargebackPresenterFactory.make(presenterOutput: presenterOutput)
        return ChargebackUseCase(resourceRouter: ResourceRouter.main, presenter: presenterInput)
    }
}

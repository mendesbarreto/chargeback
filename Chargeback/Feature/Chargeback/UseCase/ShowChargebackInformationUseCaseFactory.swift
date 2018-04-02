//
// Created by Douglas Mendes on 3/31/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

final class ShowChargebackInformationUseCaseFactory {
    static func make (presenterOutput: ChargebackPresenterOutput) -> ShowChargebackInformationUseCase {
        let presenterInput = ChargebackPresenterFactory.make(presenterOutput: presenterOutput)
        return ShowChargebackInformationUseCase(resourceRouter: ResourceRouter.main, presenter: presenterInput)
    }
}

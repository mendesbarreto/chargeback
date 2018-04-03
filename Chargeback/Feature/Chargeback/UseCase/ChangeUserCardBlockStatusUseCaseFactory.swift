//
// Created by douglas.barreto on 4/1/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

final class ChangeUserCardBlockStatusUseCaseFactory {
    static func make(presenterOutput: CardBlockerStatusPresenterOutput) -> ChangeUserCardBlockStatusUseCase {
        let presenter = CardBlockerStatusPresenterFactory.make(presenterOutput: presenterOutput)
        return ChangeUserCardBlockStatusUseCase(resourceRouter: ResourceRouter.main, presenter: presenter)
    }
}

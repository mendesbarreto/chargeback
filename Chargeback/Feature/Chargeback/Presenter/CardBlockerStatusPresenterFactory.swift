//
// Created by douglas.barreto on 4/1/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

final class CardBlockerStatusPresenterFactory {
    static func make (presenterOutput: CardBlockerStatusPresenterOutput) -> CardBlockerStatusPresenterInput {
        return CardBlockerStatusPresenter(presenterOutput: presenterOutput)
    }
}

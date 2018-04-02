//
// Created by douglas.barreto on 4/2/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation
@testable import Chargeback

struct CardBlockerStatusViewModelMock {
    static var viewModelLocked: CardBlockerStatusViewModel {
        let descriptionLockedCard = Strings.Chargeback.descriptionLockedCard
        let descriptionUnLockedCard = Strings.Chargeback.descriptionUnLockedCard
        return CardBlockerStatusViewModel(lockIconImage: Assets.icChargebackLock.image,
                                          unLockIconImage: Assets.icChargebackUnlock.image,
                                          descriptionLockedCard: .descriptionRed(withText: descriptionLockedCard),
                                          descriptionUnLockedCard: .descriptionRed(withText: descriptionUnLockedCard),
                                          isCardBlocked: true)
    }

    static var viewModelUnblocked: CardBlockerStatusViewModel {
        let descriptionLockedCard = Strings.Chargeback.descriptionLockedCard
        let descriptionUnLockedCard = Strings.Chargeback.descriptionUnLockedCard
        return CardBlockerStatusViewModel(lockIconImage: Assets.icChargebackLock.image,
                                          unLockIconImage: Assets.icChargebackUnlock.image,
                                          descriptionLockedCard: .descriptionRed(withText: descriptionLockedCard),
                                          descriptionUnLockedCard: .descriptionRed(withText: descriptionUnLockedCard),
                                          isCardBlocked: false)
    }
}

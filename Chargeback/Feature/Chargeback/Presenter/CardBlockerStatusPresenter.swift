//
// Created by douglas.barreto on 4/2/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

final class CardBlockerStatusPresenter: CardBlockerStatusPresenterInput {
    private weak var presenterOutput: CardBlockerStatusPresenterOutput?

    init(presenterOutput: CardBlockerStatusPresenterOutput) {
        self.presenterOutput = presenterOutput
    }

    func showLoading() {
        presenterOutput?.showLoading()
    }

    func hideLoading(onComplete: (() -> Void)? = nil) {
        presenterOutput?.hideLoading(onComplete: onComplete)
    }

    func lockPadLockView() {
        let descriptionLockedCard = Strings.Chargeback.descriptionLockedCard
        let descriptionUnLockedCard = Strings.Chargeback.descriptionUnLockedCard
        let cardBlockerStatusViewModel = CardBlockerStatusViewModel(lockIconImage: Assets.icChargebackLock.image,
                                                                    unLockIconImage: Assets.icChargebackUnlock.image,
                                                                    descriptionLockedCard: .descriptionRed(withText: descriptionLockedCard),
                                                                    descriptionUnLockedCard: .descriptionRed(withText: descriptionUnLockedCard),
                                                                    isCardBlocked: true)
        presenterOutput?.show(cardBlockViewModel: cardBlockerStatusViewModel)
    }

    func unlockPadLockView() {
        let descriptionLockedCard = Strings.Chargeback.descriptionLockedCard
        let descriptionUnLockedCard = Strings.Chargeback.descriptionUnLockedCard
        let cardBlockerStatusViewModel = CardBlockerStatusViewModel(lockIconImage: Assets.icChargebackLock.image,
                                                                    unLockIconImage: Assets.icChargebackUnlock.image,
                                                                    descriptionLockedCard: .descriptionRed(withText: descriptionLockedCard),
                                                                    descriptionUnLockedCard: .descriptionRed(withText: descriptionUnLockedCard),
                                                                    isCardBlocked: false)
        presenterOutput?.show(cardBlockViewModel: cardBlockerStatusViewModel)
    }
}

//
// Created by douglas.barreto on 4/1/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import RxSwift

protocol CardBlockerStatusPresenterOutput: class, LoadablePresenter {
    func show (cardBlockViewModel: CardBlockerStatusViewModel)
}

protocol CardBlockerStatusPresenterInput: LoadablePresenter {
    func lockPadLockView ()

    func unlockPadLockView ()
}

final class CardBlockerStatusPresenterFactory {
    static func make (presenterOutput: CardBlockerStatusPresenterOutput) -> CardBlockerStatusPresenterInput {
        return CardBlockerStatusPresenter(presenterOutput: presenterOutput)
    }
}

final class CardBlockerStatusPresenter: CardBlockerStatusPresenterInput {
    private weak var presenterOutput: CardBlockerStatusPresenterOutput?

    init (presenterOutput: CardBlockerStatusPresenterOutput) {
        self.presenterOutput = presenterOutput
    }

    func showLoading () {
        presenterOutput?.showLoading()
    }

    func hideLoading () {
        presenterOutput?.hideLoading()
    }

    func lockPadLockView () {
        let descriptionLockedCard = ChargebackPresenterConst.descriptionLockedCard
        let descriptionUnLockedCard = ChargebackPresenterConst.descriptionUnLockedCard
        let cardBlockerStatusViewModel = CardBlockerStatusViewModel(lockIconImage: Assets.icChargebackLock.image,
                                                                    unLockIconImage: Assets.icChargebackUnlock.image,
                                                                    descriptionLockedCard: .descriptionRed(withText: descriptionLockedCard),
                                                                    descriptionUnLockedCard: .descriptionRed(withText: descriptionUnLockedCard),
                                                                    isCardBlocked: true)
        presenterOutput?.show(cardBlockViewModel: cardBlockerStatusViewModel)
    }

    func unlockPadLockView () {
        let descriptionLockedCard = ChargebackPresenterConst.descriptionLockedCard
        let descriptionUnLockedCard = ChargebackPresenterConst.descriptionUnLockedCard
        let cardBlockerStatusViewModel = CardBlockerStatusViewModel(lockIconImage: Assets.icChargebackLock.image,
                                                                    unLockIconImage: Assets.icChargebackUnlock.image,
                                                                    descriptionLockedCard: .descriptionRed(withText: descriptionLockedCard),
                                                                    descriptionUnLockedCard: .descriptionRed(withText: descriptionUnLockedCard),
                                                                    isCardBlocked: false)
        presenterOutput?.show(cardBlockViewModel: cardBlockerStatusViewModel)
    }
}

final class ChangeUserCardBlockStatusUseCase {

    private let resourceRouter: ResourceRoutable
    private let presenter: CardBlockerStatusPresenterInput
    private let disposableBag = DisposeBag()

    init (resourceRouter: ResourceRoutable, presenter: CardBlockerStatusPresenterInput) {
        self.resourceRouter = resourceRouter
        self.presenter = presenter
    }

    func change (to isCardBlocked: Bool) {
        card(isCardBlocked: isCardBlocked)
        let action: ResourceAction = isCardBlocked ? .blockCard : .unblockCard
        resourceRouter.exec(action: action)
                      .subscribe(onError: { [weak self] _ in
                          if let strongSelf = self {
                              strongSelf.card(isCardBlocked: !isCardBlocked)
                          }
                      }).disposed(by: disposableBag)
    }

    private func card (isCardBlocked: Bool) {
        if isCardBlocked {
            presenter.lockPadLockView()
        } else {
            presenter.unlockPadLockView()
        }
    }
}

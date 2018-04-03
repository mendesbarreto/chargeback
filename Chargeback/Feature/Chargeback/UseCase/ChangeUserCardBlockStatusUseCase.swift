//
// Created by douglas.barreto on 4/1/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import RxSwift

final class ChangeUserCardBlockStatusUseCase {

    private let resourceRouter: ResourceRoutable
    private let presenter: CardBlockerStatusPresenterInput
    private let disposableBag = DisposeBag()

    init(resourceRouter: ResourceRoutable, presenter: CardBlockerStatusPresenterInput) {
        self.resourceRouter = resourceRouter
        self.presenter = presenter
    }

    func change(to isCardBlocked: Bool) {
        card(isCardBlocked: isCardBlocked)
        let action: ResourceAction = isCardBlocked ? .blockCard : .unblockCard
        resourceRouter.exec(action: action)
                      .subscribe(onError: { [weak self] _ in
                          if let strongSelf = self {
                              strongSelf.card(isCardBlocked: !isCardBlocked)
                          }
                      }).disposed(by: disposableBag)
    }

    private func card(isCardBlocked: Bool) {
        if isCardBlocked {
            presenter.lockPadLockView()
        } else {
            presenter.unlockPadLockView()
        }
    }
}

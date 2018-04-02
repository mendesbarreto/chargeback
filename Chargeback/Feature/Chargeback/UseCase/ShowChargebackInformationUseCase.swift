//
// Created by Douglas Mendes on 3/31/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import RxSwift

final class ShowChargebackInformationUseCase {

    private let presenter: ChargebackPresenterInput
    private let resourceRouter: ResourceRoutable
    private let disposableBag = DisposeBag()

    init (resourceRouter: ResourceRoutable, presenter: ChargebackPresenterInput) {
        self.presenter = presenter
        self.resourceRouter = resourceRouter
    }

    func show () {
        presenter.showLoading()
        resourceRouter.chargeBack().subscribe(onNext: { [weak self] chargeback in
            guard let strongSelf = self else { return }
            strongSelf.show(chargeback: chargeback)
        }, onError: { [weak self] _ in
            guard let strongSelf = self else { return }
            strongSelf.presenter.hideLoading {
                strongSelf.presenter.showError()
            }
        }).disposed(by: disposableBag)
    }

    private func show (chargeback: Chargeback) {
        presenter.hideLoading(onComplete: nil)
        do {
            try presenter.show(chargeback: chargeback)
            shouldSHowAutoBlock(of: chargeback)
        } catch {
            presenter.showError()
        }
    }

    private func shouldSHowAutoBlock (of chargeback: Chargeback) {
        if chargeback.autoblock {
            presenter.showAutoblock()
        }
    }
}

//
// Created by Douglas Mendes on 4/1/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import RxSwift

final class ChargebackUseCase {

    let resourceRouter: ResourceRoutable
    let presenter: ChargebackPresenterInput
    let disposableBag = DisposeBag()

    init (resourceRouter: ResourceRoutable, presenter: ChargebackPresenterInput) {
        self.resourceRouter = resourceRouter
        self.presenter = presenter
    }

    func chargeback (withUserResponse response: ChargeBackUserResponse) {
        resourceRouter.exec(action: .chargeback(userResponse: response)).subscribe(onNext: { [weak self] in
            if let presenter = self?.presenter {
                presenter.showChargeBackActionSuccess()
            }
        }, onError: { [weak self] error in
            if let presenter = self?.presenter {
                presenter.showChargeBackActionError()
            }
        }).disposed(by: disposableBag)
    }
}

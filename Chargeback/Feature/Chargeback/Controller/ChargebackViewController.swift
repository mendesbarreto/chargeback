//
// Created by Douglas Mendes on 3/31/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

final class ChangeUserCardBlockStatusUseCaseFactory {
    static func make () -> ChangeUserCardBlockStatusUseCase {
        return ChangeUserCardBlockStatusUseCase(resourceRouter: ResourceRouter.main)
    }
}

class ChangeUserCardBlockStatusUseCase {
    let resourceRouter: ResourceRoutable
    let presenter:

    init (resourceRouter: ResourceRoutable) {
        self.resourceRouter = resourceRouter
    }

    func change (to isCardBlocked: Bool) {
    }
}

final class ChargebackViewController: BaseViewController {

    private let chargebackView: ChargebackView
    private var showChargebackUserCase: ShowChargebackInformationUseCase!
    private var chargebackUserCase: ChargebackUseCase!
    private var changeUserCardBlockStatusUseCase: ChangeUserCardBlockStatusUseCase!

    override init() {
        chargebackView = ChargebackView()
        super.init()
        showChargebackUserCase = ShowChargebackInformationUseCaseFactory.make(presenterOutput: self)
        chargebackUserCase = ChargebackUseCaseFactory.make(presenterOutput: self)
        changeUserCardBlockStatusUseCase = ChangeUserCardBlockStatusUseCaseFactory.make()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init?(coder aDecoder: NSCoder) not implemented", file: #file, line: #line)
    }

    override func viewDidLoad () {
        super.viewDidLoad()
        setupLayout()
        setupChargebackView()
        showChargebackUserCase.show()
    }

    private func setupLayout () {
        view.backgroundColor = .backgroundNu
    }

    private func setupChargebackView() {
        view.addSubview(chargebackView)
        chargebackView.anchorToFit(in: view)
        chargebackView.cancelAction.emit(onNext: onCancelAction).disposed(by: disposableBag)
        chargebackView.contestAction.emit(onNext: onContestAction).disposed(by: disposableBag)
        chargebackView.blockCardAction.emit(onNext: onBlockCardAction).disposed(by: disposableBag)
    }

    private func onCancelAction () {
        backToNotice()
    }

    private func onBlockCardAction (_ isBlocked: Bool) {
        changeUserCardBlockStatusUseCase.change(to: isBlocked)
    }

    private func onContestAction () {
        requestChargeBack()
    }

    private func requestChargeBack () {
        let comment = chargebackView.hinComment
        let reasonMerchantRecognized = ReasonDetailUserResponse(id: .merchantRecognized,
                                                                response: chargebackView.reasonMerchantIsOn)
        let reasonCardInPossession = ReasonDetailUserResponse(id: .cardInPossession,
                                                              response: chargebackView.reasonCardInPossessionIsOn)
        chargebackUserCase.chargeback(withUserResponse: ChargeBackUserResponse(comment: comment,
                                                                               reasonDetails: [reasonCardInPossession,
                                                                                               reasonMerchantRecognized]))
    }

    private func backToNotice () {
        self.dismiss(animated: true)
    }
}

extension ReasonDetailUserResponse {
    init (id: ReasonDetailIdKey, response: Bool) {
        self.init(id: id.rawValue, response: response)
    }
}

extension ChargebackViewController: ChargebackPresenterOutput {
    func show (chargebackViewModel: ChargebackViewModel) {
        chargebackView.bind(to: chargebackViewModel)
    }

    func showChargebackSuccessAlert () {
        let alertViewController = NuAlertViewControllerFactory.make(title: NuAlertConst.successTitle,
                                                                    description: NuAlertConst.successDescription,
                                                                    buttonTitle: NuAlertConst.closeButtonTitle,
                                                                    type: .success) { [weak self] in self?.dismiss(animated: true) }
        present(alertViewController, animated: true)
    }

    func showChargebackFailAlert () {
        NuAlertViewControllerFactory.make(title: NuAlertConst.successTitle,
                                          description: NuAlertConst.successDescription,
                                          buttonTitle: NuAlertConst.closeButtonTitle,
                                          type: .fail)
    }
}

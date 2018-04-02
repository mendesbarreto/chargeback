//
// Created by Douglas Mendes on 3/31/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

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
        changeUserCardBlockStatusUseCase = ChangeUserCardBlockStatusUseCaseFactory.make(presenterOutput: self)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init?(coder aDecoder: NSCoder) not implemented", file: #file, line: #line)
    }

    override func viewDidLoad () {
        super.viewDidLoad()
        setupLayout()
        setupChargebackView()
        setupKeyboardEvents()
    }

    override func viewDidAppear (_ animated: Bool) {
        super.viewDidAppear(animated)
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

    private func setupKeyboardEvents () {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

    @objc func keyboardWillShow (notification: NSNotification) {
        if let infoKey = notification.userInfo?[UIKeyboardFrameEndUserInfoKey],
           let rawFrame = (infoKey as AnyObject).cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y = -rawFrame.size.height
            }
        }
    }

    @objc func keyboardWillHide (notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
}

extension ChargebackViewController: CardBlockerStatusPresenterOutput {
    func show (cardBlockViewModel: CardBlockerStatusViewModel) {
        self.chargebackView.bind(toCardBlockerViewModel: cardBlockViewModel)
    }
}

extension ChargebackViewController: ChargebackPresenterOutput {

    func showAutoblock () {
        changeUserCardBlockStatusUseCase.change(to: true)
    }

    func show (chargebackViewModel: ChargebackViewModel) {
        chargebackView.bind(to: chargebackViewModel)
    }

    func showChargebackSuccessAlert () {
        let alertViewController = NuAlertViewControllerFactory.make(title: Strings.NuAlert.successTitle,
                                                                    description: Strings.NuAlert.successDescription,
                                                                    buttonTitle: Strings.NuAlert.closeButtonTitle,
                                                                    type: .success)
        present(alertViewController, animated: true)
    }

    func showChargebackFailAlert () {
        let alertController = NuAlertViewControllerFactory.make(title: Strings.NuAlert.failTitle,
                                                                description: Strings.NuAlert.failDescription,
                                                                buttonTitle: Strings.NuAlert.closeButtonTitle,
                                                                type: .fail)
        present(alertController, animated: true)
    }
}

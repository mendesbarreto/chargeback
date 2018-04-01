//
// Created by douglas.barreto on 4/1/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

struct NuAlertConst {
    static let successTitle = "Contestação de compra recebida"
    static let successDescription = "Fique de olho no seu email! Nos próximos 3 dias você deverá receber um primeiro retorno sobre sua contestação"
    static let closeButtonTitle = "Fechar"
}

final class NuAlertViewController: BaseViewController {

    private var presenter: NuAlertPresenter!
    private let nuAlertView = NuAlertView()
    private var action: (() -> ())?

    init (title: String, description: String, buttonTitle: String, type: NuAlertType, action: (() -> ())? = nil) {
        super.init()
        self.action = action
        presenter = NuAlertPresenter(title: title,
                                     description: description,
                                     buttonTitle: buttonTitle,
                                     type: type,
                                     presenterOutput: self)
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    override func viewDidLoad () {
        super.viewDidLoad()
        setupLayout()
        setupAction()
        presenter.show()
    }

    private func setupAction () {
        nuAlertView.onButtonTap.emit(onNext: onActionButtonTap).disposed(by: disposableBag)
    }

    private func onActionButtonTap () {
        let action = self.action
        dismiss(animated: true) {
            action?()
        }
    }

    private func setupLayout () {
        view.addSubview(nuAlertView)
        nuAlertView.startAnchor().heightAnchor.constraint(equalToConstant: 300).isActive = true
        nuAlertView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        nuAlertView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        nuAlertView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        view.backgroundColor = .transparentBlack
    }
}

extension NuAlertViewController: NuAlertPresenterOutput {
    func show (alertViewModel: NuAlertViewModel) {
        nuAlertView.bind(to: alertViewModel)
    }
}

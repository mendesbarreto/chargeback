//
// Created by douglas.barreto on 4/1/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class NuAlertViewController: BaseViewController {

    private var presenter: NuAlertPresenter!
    private let nuAlertView = NuAlertView()
    private let opacityBalckBackground = UIView()
    private var action: (() -> ())?

    let alertType: NuAlertType

    var viewModel: NuAlertViewModel {
        return nuAlertView.viewModel
    }

    init (title: String, description: String, buttonTitle: String, type: NuAlertType, action: (() -> ())? = nil) {
        alertType = type
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
        view.addSubview(opacityBalckBackground)
        view.backgroundColor = .backgroundNu
        opacityBalckBackground.anchorToFit(in: view)
        opacityBalckBackground.backgroundColor = .transparentBlack

        view.addSubview(nuAlertView)
        nuAlertView.startAnchor().heightAnchor.constraint(equalToConstant: 300).isActive = true
        nuAlertView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        nuAlertView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        nuAlertView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}

extension NuAlertViewController: NuAlertPresenterOutput {
    func show (alertViewModel: NuAlertViewModel) {
        nuAlertView.bind(to: alertViewModel)
    }
}

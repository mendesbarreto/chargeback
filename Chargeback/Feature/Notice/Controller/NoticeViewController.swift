//
// Created by Douglas Mendes  on 3/24/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class NoticeViewController: BaseViewController {
    var showNoticeUseCase: ShowNoticeUseCase!
    let noticeView = NoticeView()

    override init() {
        super.init()
        showNoticeUseCase = ShowNoticeUseCaseFactory.make(presenterOutput: self)
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNoticeView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showNoticeUseCase.show()
    }

    private func setupNoticeView() {
        view.addSubview(noticeView)
        view.backgroundColor = .backgroundNu
        noticeView.anchorToFit(in: view)
        noticeView.continueAction.emit(onNext: onContinueAction).disposed(by: disposableBag)
        noticeView.closeAction.emit(onNext: onCloseAction).disposed(by: disposableBag)
    }

    private func onContinueAction() {
        present(ChargebackViewControllerFactory.make(), animated: true)
    }

    private func onCloseAction() {
        print("closeAction")
    }
}

extension NoticeViewController: NoticePresenterOutput {
    func show(notice: NoticeViewModel) {
        noticeView.bind(to: notice)
    }

    func showError() {
        let alertController = NuAlertViewControllerFactory.make(title: Strings.NuAlert.failTitle,
                                                                description: Strings.NuAlert.failDescription,
                                                                buttonTitle: Strings.NuAlert.closeButtonTitle,
                                                                type: .fail)
        present(alertController, animated: true)
    }
}

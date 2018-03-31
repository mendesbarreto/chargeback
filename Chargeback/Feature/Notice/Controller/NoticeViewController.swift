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

    override  init() {
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
        print("onContinueAction")
    }
    private func onCloseAction() {
        print("closeAction")
    }
}

extension NoticeViewController: NoticePresenterOutput {
    func show (notice: NoticeViewModel) {
        noticeView.bind(to: notice)
    }

    func showError () {
        //TODO: SHOW SOME ALERT
    }
}

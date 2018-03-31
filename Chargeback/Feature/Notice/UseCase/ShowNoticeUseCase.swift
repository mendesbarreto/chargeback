//
// Created by Douglas Mendes  on 3/30/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import RxSwift

final class ShowNoticeUseCase {

    let noticeGateway: ResourceRoutable
    let presenter: NoticePresenterInput
    let disposableBag = DisposeBag()

    init(noticeGateway: ResourceRoutable, presenter: NoticePresenterInput) {
        self.noticeGateway = noticeGateway
        self.presenter = presenter
    }

    func show() {
        noticeGateway.notice().subscribe(onNext: {[weak self] notice in
            guard let strongSelf = self else {
                return
            }
            strongSelf.presenter.show(notice: notice)
        }, onError: { [weak self] error in
            guard let strongSelf  = self else {
                return
            }
            strongSelf.presenter.showError()
        }).disposed(by: disposableBag)
    }
}

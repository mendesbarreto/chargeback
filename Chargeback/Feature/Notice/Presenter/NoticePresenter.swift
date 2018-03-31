//
// Created by Douglas Mendes  on 3/25/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

protocol NoticePresenterInput {
    func show(notice: Notice)
    func showError()
}

protocol NoticePresenterOutput: class {
    func show(notice: NoticeViewModel)
    func showError()
}

final class NoticePresenter: NoticePresenterInput {

    private weak var presenterOutput: NoticePresenterOutput?

    init(presenterOutput: NoticePresenterOutput) {
        self.presenterOutput = presenterOutput
    }

    func show(notice: Notice) {
        let viewModel = NoticeViewModel(title: .titlePurple(withText: notice.title),
                                        description: .descriptionHTML(withText: notice.description),
                                        continueButtonTitle: .titleButtonPurple(withText: notice.primaryAction.title.uppercased()),
                                        closeButtonTitle: .titleButtonGray(withText: notice.secondaryAction.title.uppercased()))

        presenterOutput?.show(notice: viewModel)
    }

    func showError () {
        presenterOutput?.showError()
    }
}

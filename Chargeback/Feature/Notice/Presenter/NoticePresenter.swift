//
// Created by Douglas Mendes  on 3/25/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

final class NoticePresenter: NoticePresenterInput {

    private weak var presenterOutput: NoticePresenterOutput?

    init(presenterOutput: NoticePresenterOutput) {
        self.presenterOutput = presenterOutput
    }

    func show(notice: Notice) throws {
        let noticeDescriptionHTML: NSAttributedString = try .descriptionHTML(withText: notice.description)
        let viewModel = NoticeViewModel(title: .titleLargePurple(withText: notice.title),
                                        description: noticeDescriptionHTML,
                                        continueButtonTitle: .titleButtonPurple(withText: notice.primaryAction.title.uppercased()),
                                        closeButtonTitle: .titleButtonGray(withText: notice.secondaryAction.title.uppercased()))

        presenterOutput?.show(notice: viewModel)
    }

    func showError () {
        presenterOutput?.showError()
    }

    func showLoading () {
        presenterOutput?.showLoading()
    }

    func hideLoading () {
        presenterOutput?.hideLoading()
    }
}

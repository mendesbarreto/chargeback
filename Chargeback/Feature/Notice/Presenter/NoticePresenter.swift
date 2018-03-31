//
// Created by douglas.barreto on 3/25/18.
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
        let title: NSAttributedString = .titlePurple(withText: notice.title)
        let description: NSAttributedString = .descriptionHTML(withText: notice.description)
        let closeButtonTitle: NSAttributedString = .titleButtonPurple(withText: notice.primaryAction.title)
        let continueButtonTitle: NSAttributedString = .titleButtonGray(withText: notice.secondaryAction.title)
        let viewModel = NoticeViewModel(title: title, description: description, continueButtonTitle: continueButtonTitle, closeButtonTitle: closeButtonTitle)

        presenterOutput?.show(notice: viewModel)
    }

    func showError () {
        presenterOutput?.showError()
    }
}

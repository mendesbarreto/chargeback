//
// Created by douglas.barreto on 4/1/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

final class NuAlertPresenter: NuAlertPresenterInput {
    private weak var presenterOutput: NuAlertPresenterOutput?
    private let viewModel: NuAlertViewModel

    init(title: String,
         description: String,
         buttonTitle: String,
         type: NuAlertType,
         presenterOutput: NuAlertPresenterOutput) {
        self.presenterOutput = presenterOutput
        let titleAttr: NSAttributedString = type != .success ? .titleMediumRead(withText: title) : .titleMediumPurple(withText: title)
        viewModel = NuAlertViewModel(title: titleAttr,
                                     description: .descriptionSmallGray(withText: description),
                                     buttonTile: .titleButtonGray(withText: buttonTitle.uppercased()))
    }

    func show() {
        presenterOutput?.show(alertViewModel: viewModel)
    }
}

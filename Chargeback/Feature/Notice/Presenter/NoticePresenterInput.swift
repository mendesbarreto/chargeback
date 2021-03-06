//
// Created by douglas.barreto on 4/1/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

protocol NoticePresenterInput: LoadablePresenter {
    func show(notice: Notice) throws

    func showError()
}

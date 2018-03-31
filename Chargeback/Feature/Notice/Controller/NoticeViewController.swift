//
// Created by douglas.barreto on 3/24/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit
import RxSwift

final class NoticeViewController: BaseViewController, NoticePresenterOutput {
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
        view.addSubview(noticeView)
        noticeView.anchorToFit(in: view)
        showNoticeUseCase.show()
    }

    func show (notice: NoticeViewModel) {
        noticeView.bind(to: notice)
    }

    func showError () {
        //TODO: SHOW SOME ALERT
    }
}

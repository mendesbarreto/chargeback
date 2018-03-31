//
// Created by douglas.barreto on 3/30/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

final class ShowNoticeUseCaseFactory {
    static func make(presenterOutput: NoticePresenterOutput) -> ShowNoticeUseCase {
        return ShowNoticeUseCase(noticeGateway: ResourceRouter.main, presenter: NoticePresenter(presenterOutput: presenterOutput))
    }
}

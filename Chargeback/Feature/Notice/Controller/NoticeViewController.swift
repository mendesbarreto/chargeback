//
// Created by douglas.barreto on 3/24/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit
import RxSwift

final class NoticeViewController: BaseViewController {

    let noticeGateway: ResourceGateway & EntryPointResourceGateway

    init(noticeGateway: ResourceGateway & EntryPointResourceGateway) {
        self.noticeGateway = noticeGateway
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }
}

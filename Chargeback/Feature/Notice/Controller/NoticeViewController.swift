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

    var noticeViewModel: NoticeViewModel {
        return NoticeViewModel(title: .titlePurple(withText: "Ronan é Lindo"),
                               description: .titlePurple(withText: "Ronan é Lindo"),
                               continueButtonTitle: .titlePurple(withText: "Ronan é Lindo"),
                               closeButtonTitle: .titlePurple(withText: "Ronan é Lindo"))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let noticeView = NoticeView()
        view.addSubview(noticeView)
        view.backgroundColor = .backgroundNu
        noticeView.bind(to: noticeViewModel)
        noticeView.startAnchor().anchorToFit(in: view)
    }
}

//
// Created by douglas.barreto on 4/2/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Quick
import Nimble
import UIKit

@testable import Chargeback

final class NoticeViewControllerSpec: QuickSpec {
    override func spec () {
        super.spec()
        describe("NoticeViewControllerSpec") {
            context("when called make") {
                var noticeViewController: NoticeViewController!
                beforeEach {
                    noticeViewController = NoticeViewController()
                }
                context("when notice view controller presented") {
                    var controller: UIViewController!
                    beforeEach {
                        controller = UIViewController()
                    }
                    // Shame on me!
                    // I know this test is very general, I'd like test better but the time is over and I should
                    // merely know if when my view controller is presented rise some null pointer exception =)
                    it("should not rise errors") {
                        controller.present(noticeViewController, animated: true)
                    }
                }
            }
        }
    }
}

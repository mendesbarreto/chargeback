//
// Created by douglas.barreto on 4/2/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Quick
import Nimble
import UIKit

@testable import Chargeback

final class ChargebackViewControllerFactorySpec: QuickSpec {
    override func spec() {
        super.spec()
        describe("ChargebackViewControllerFactory") {
            context("when called make") {
                var chargebackViewController: ChargebackViewController?
                beforeEach {
                    chargebackViewController = ChargebackViewControllerFactory.make() as? ChargebackViewController
                }
                it("expect view controller of type chargeback") {
                    expect(chargebackViewController).toNot(beNil())
                }
                context("when charge back view controller presented") {
                    var controller: UIViewController!
                    beforeEach {
                        controller = UIViewController()
                    }
                    // I know this test is very general, I'd like test better but the time is over and I should
                    // merely know if when my view controller is presented rise some null pointer exception =)
                    it("should not rise errors") {
                        controller.present(chargebackViewController!, animated: true)
                    }
                }
            }
        }
    }
}

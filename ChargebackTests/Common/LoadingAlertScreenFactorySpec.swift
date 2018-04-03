//
// Created by douglas.barreto on 4/2/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Quick
import Nimble
import RxSwift
import RxTest
import UIKit

@testable import Chargeback

final class LoadingAlertScreenFactorySpec: QuickSpec {
    override func spec() {
        super.spec()
        describe("LoadingAlertScreenFactory") {
            var alertViewController: UIAlertController!
            context("when called make") {
                beforeEach {
                    alertViewController = LoadingAlertScreenFactory.make()
                }
                it("expect message to be the same as defined") {
                    expect(alertViewController.message).to(equal(Strings.LoadingAlert.message))
                }
                it("expect title to be nil") {
                    expect(alertViewController.title).to(beNil())
                }
            }
        }
    }
}

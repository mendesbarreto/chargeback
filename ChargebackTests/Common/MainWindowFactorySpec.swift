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

final class MainWindowFactorySpec: QuickSpec {
    override func spec() {
        super.spec()
        describe("MainWindowFactorySpec") {
            var window: UIWindow!
            context("when called make") {
                beforeEach {
                    window = MainWindowFactory.make()
                }
                it("expect root view controller of type notice view controller") {
                    let noticeViewController = window.rootViewController as? NoticeViewController
                    expect(noticeViewController).toNot(beNil())
                }
                it("expect window bound equals to screen bounds") {
                    expect(window.bounds).to(equal(UIScreen.main.bounds))
                }
            }
        }
    }
}

//
//  BaseViewControllerTests.swift
//  ChargebackTests
//
//  Created by Douglas Mendes  on 3/24/18.
//  Copyright © 2018 Douglas Mendes Barreto. All rights reserved.
//

import Quick
import Nimble
import UIKit

@testable import Chargeback

final class BaseViewControllerSpec: QuickSpec {
    override func spec() {
        super.spec()
        describe("BaseViewController") {
            var baseViewController: BaseViewController?
            context("when initialized with coder") {
                beforeEach {
                    baseViewController = BaseViewController(coder: NSCoder())
                }
                it("expect be nil") {
                    expect(baseViewController).to(beNil())
                }
            }
            context("when initialized with init without parameter") {
                beforeEach {
                    baseViewController = BaseViewController()
                }
                it("expect be nil") {
                    expect(baseViewController).toNot(beNil())
                }
            }
        }
    }
}

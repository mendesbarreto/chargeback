//
// Created by douglas.barreto on 4/2/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

import Quick
import Nimble
import UIKit

@testable import Chargeback

final class NuAlertViewControllerFactorySpec: QuickSpec {
    override func spec () {
        super.spec()
        describe("NuAlertViewControllerFactory") {
            var nuAlertViewController: NuAlertViewController?
            context("when called make with default params") {
                beforeEach {
                    nuAlertViewController = NuAlertViewControllerFactory.make() as? NuAlertViewController
                }
                context("and asked to present") {
                    var viewController: UIViewController!
                    beforeEach {
                        viewController = UIViewController()
                        viewController.present(nuAlertViewController!, animated: true)
                    }
                    it("should be type of nu alert view controller") {
                        expect(nuAlertViewController).toNot(beNil())
                    }
                    it("should alert type be type of success") {
                        expect(nuAlertViewController!.alertType).to(equal(NuAlertType.success))
                    }
                    context("with view model") {
                        var viewModel: NuAlertViewModel!
                        beforeEach {
                            viewModel = nuAlertViewController!.viewModel
                        }
                        it("expect title the same as default params") {
                            expect(viewModel.title.string).to(equal(Strings.NuAlert.successTitle))
                        }
                        it("expect description the same as default params") {
                            expect(viewModel.description.string).to(equal(Strings.NuAlert.successDescription))
                        }
                        it("expect button tile the same as default params") {
                            expect(viewModel.buttonTile.string).to(equal(Strings.NuAlert.closeButtonTitle.uppercased()))
                        }
                    }
                }
            }
        }
    }
}

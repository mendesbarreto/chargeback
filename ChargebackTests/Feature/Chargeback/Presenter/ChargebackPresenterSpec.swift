//
// Created by douglas.barreto on 4/2/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Quick
import Nimble
import RxSwift
import RxTest

@testable import Chargeback

final class ChargebackPresenterSpec: QuickSpec {
    private var chargeBack: Chargeback {
        return ChargebackMock.chargeback
    }

    //swiftlint:disable function_body_length
    //swiftlint:disable force_try
    override func spec() {
        super.spec()
        describe("ChargebackPresenter") {
            var presenter: ChargebackPresenter!
            var presenterOutput: ChargebackPresenterOutputMock!
            context("when initialized") {
                beforeEach {
                    presenterOutput = ChargebackPresenterOutputMock()
                    presenter = ChargebackPresenter(presenterOutput: presenterOutput)
                }
                context("and called showError") {
                    beforeEach {
                        presenter.showError()
                    }
                    it("should call presenter output show fail alert") {
                        expect(presenterOutput.invokedShowChargebackFailAlert).to(beTrue())
                        expect(presenterOutput.invokedShowChargebackFailAlertCount).to(equal(1))
                    }
                }
                context("and called show charge back action error") {
                    beforeEach {
                        presenter.showChargeBackActionError()
                    }
                    it("should call presenter output show fail alert") {
                        expect(presenterOutput.invokedShowChargebackFailAlert).to(beTrue())
                        expect(presenterOutput.invokedShowChargebackFailAlertCount).to(equal(1))
                    }
                }
                context("and called show charge back action success") {
                    beforeEach {
                        presenter.showChargeBackActionSuccess()
                    }
                    it("should call presenter output show success alert") {
                        expect(presenterOutput.invokedShowChargebackSuccessAlert).to(beTrue())
                        expect(presenterOutput.invokedShowChargebackSuccessAlertCount).to(equal(1))
                    }
                }
                context("and called show show loading") {
                    beforeEach {
                        presenter.showLoading()
                    }
                    it("should call presenter output show loading") {
                        expect(presenterOutput.invokedShowLoading).to(beTrue())
                        expect(presenterOutput.invokedShowLoadingCount).to(equal(1))
                    }
                }
                context("and called show hide loading") {
                    beforeEach {
                        presenter.hideLoading()
                    }
                    it("should call presenter output hide loading") {
                        expect(presenterOutput.invokedHideLoading).to(beTrue())
                        expect(presenterOutput.invokedHideLoadingCount).to(equal(1))
                    }
                }
                context("with a valid model") {
                    context("and called show") {
                        beforeEach {
                            try! presenter.show(chargeback: self.chargeBack)
                        }
                        context("with view model") {
                            var viewModel: ChargebackViewModel!
                            var chargebackModel: Chargeback!
                            beforeEach {
                                viewModel = presenterOutput.invokedShowParameters!.chargebackViewModel
                                chargebackModel = self.chargeBack
                            }
                            it("expect title be the same as notice model title") {
                                expect(chargebackModel.title.uppercased()).to(equal(viewModel.title.string))
                            }
                            it("expect description be the same notice model description") {
                                expect(chargebackModel.commentHint).to(equal(viewModel.descriptionHint.string))
                            }
                            it("expect merchant recognized title be the same as reason merchant description ") {
                                let reason = chargebackModel.reasonDetails.first { $0.reasonKey == .merchantRecognized }!
                                expect(reason.title).to(equal(viewModel.reasonMerchantViewModel.description.string))
                            }
                            it("expect card in possession title be the same as reason card in possession description") {
                                let reason = chargebackModel.reasonDetails.first { $0.reasonKey == .cardInPossession }!
                                expect(reason.title).to(equal(viewModel.reasonCardInPossessionViewModel.description.string))
                            }
                        }
                    }
                }
                context("with a invalid model") {
                    var chargeBack: Chargeback!
                    context("without merchant recognized reason") {
                        beforeEach {
                            chargeBack = ChargebackMock.chargebackWithoutMerchantRecognized
                        }
                        context("and called show") {
                            it("should rise exception ChargebackPresenterError") {
                                expect { try presenter.show(chargeback: chargeBack) }.to(throwError(ChargebackPresenterError.problemToFindDetailsReasons))
                            }
                        }
                    }
                    context("without merchant recognized reason") {
                        beforeEach {
                            chargeBack = ChargebackMock.chargebackWithoutMerchantRecognized
                        }
                        context("and called show") {
                            it("should rise exception ChargebackPresenterError ") {
                                expect { try presenter.show(chargeback: chargeBack) }.to(throwError(ChargebackPresenterError.problemToFindDetailsReasons))
                            }
                        }
                    }
                }
                context("with a valid reason details") {
                    var reasonDetails: [ReasonDetail]!
                    var reason: ReasonDetail? = nil
                    beforeEach {
                        reasonDetails = self.chargeBack.reasonDetails
                    }
                    context("and called get reason details") {
                        beforeEach {
                            reason = presenter.get(reasonDetails: reasonDetails, by: .merchantRecognized)
                        }
                        it("should not be nil") {
                            expect(reason).toNot(beNil())
                        }
                        it("should be the same type as merchant recognized") {
                            expect(reason?.reasonKey).to(equal(ReasonDetailIdKey.merchantRecognized))
                        }
                    }
                }
            }
        }
    }
}

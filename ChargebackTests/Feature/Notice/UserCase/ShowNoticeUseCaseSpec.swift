//
// Created by douglas.barreto on 4/1/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Quick
import Nimble
import RxSwift
import RxBlocking
import RxTest

@testable import Chargeback

final class ShowNoticeUseCaseSpec: QuickSpec {

    var noticeMock: Notice {
        return NoticeMock.noticeMock
    }

    override func spec () {
        super.spec()
        describe("ShowNoticeUseCase") {
            var showNoticeUseCase: ShowNoticeUseCase!
            var resourceRouter: ResourceRouterMock!
            var noticePresenter: NoticePresenterInputMock!
            context("when initialized") {
                beforeEach {
                    resourceRouter = ResourceRouterMock()
                    noticePresenter = NoticePresenterInputMock()
                    showNoticeUseCase = ShowNoticeUseCase(noticeGateway: resourceRouter, presenter: noticePresenter)
                }
                context("with a valid resource") {
                    beforeEach {
                        resourceRouter.stubbedNoticeResult = Observable.just(self.noticeMock)
                    }
                    context("and called method show") {
                        beforeEach {
                            showNoticeUseCase.show()
                        }
                        it("should call presenter show") {
                            expect(noticePresenter.invokedShow).to(beTrue())
                            expect(noticePresenter.invokedShowCount).to(equal(1))
                        }
                        it("should call presenter show loading") {
                            expect(noticePresenter.invokedShowLoading).to(beTrue())
                            expect(noticePresenter.invokedShowLoadingCount).to(equal(1))
                        }
                        it("should call presenter hide loading") {
                            expect(noticePresenter.invokedHideLoading).to(beTrue())
                            expect(noticePresenter.invokedHideLoadingCount).to(equal(1))
                        }
                        it("shouldn't call presenter show error") {
                            expect(noticePresenter.invokedShowError).to(beFalse())
                        }
                    }
                    context("and has a problem to parse object to view model") {
                        beforeEach {
                            noticePresenter.stubbedShowError = NSAttributedStringError.problemToConvertStringToDataWithUnicode
                        }
                        context("and called method show") {
                            beforeEach {
                                showNoticeUseCase.show()
                            }
                            it("should call presenter show") {
                                expect(noticePresenter.invokedShow).to(beTrue())
                                expect(noticePresenter.invokedShowCount).to(equal(1))
                            }
                            it("should call presenter show loading") {
                                expect(noticePresenter.invokedShowLoading).to(beTrue())
                                expect(noticePresenter.invokedShowLoadingCount).to(equal(1))
                            }
                            it("should call presenter hide loading") {
                                expect(noticePresenter.invokedHideLoading).to(beTrue())
                                expect(noticePresenter.invokedHideLoadingCount).to(equal(1))
                            }
                            it("should call presenter show error") {
                                expect(noticePresenter.invokedShowError).to(beTrue())
                                expect(noticePresenter.invokedShowErrorCount).to(equal(1))
                            }
                        }
                    }
                }
                context("with a resource error") {
                    beforeEach {
                        resourceRouter.stubbedNoticeResult = Observable.error(ResourceRouterError.resourceNotFound)
                    }
                    context("and called method show") {
                        beforeEach {
                            showNoticeUseCase.show()
                        }
                        it("shouldn't call presenter show") {
                            expect(noticePresenter.invokedShow).to(beFalse())
                        }
                        it("should call presenter show error") {
                            expect(noticePresenter.invokedShowError).to(beTrue())
                            expect(noticePresenter.invokedShowErrorCount).to(equal(1))
                        }
                        it("should call presenter show loading") {
                            expect(noticePresenter.invokedShowLoading).to(beTrue())
                            expect(noticePresenter.invokedShowLoadingCount).to(equal(1))
                        }
                        it("should call presenter hide loading") {
                            expect(noticePresenter.invokedHideLoading).to(beTrue())
                            expect(noticePresenter.invokedHideLoadingCount).to(equal(1))
                        }
                    }
                }
            }
        }
    }
}

//
//  BaseViewControllerTests.swift
//  ChargebackTests
//
//  Created by douglas.barreto on 3/24/18.
//  Copyright © 2018 Douglas Mendes Barreto. All rights reserved.
//

import XCTest

@testable import Chargeback

final class BaseViewControllerTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    func testInitWithCoderShouldReturnNil() {
        let coder = NSCoder()
        XCTAssertEqual(BaseViewController(coder: coder), nil)
    }
}


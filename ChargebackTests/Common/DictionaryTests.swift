//
// Created by Douglas Mendes  on 3/25/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import XCTest

@testable import Chargeback

final class DictionaryTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    func testSubscriptionInsertOneValidResourceShouldReturnResourceValue() {
        //Assemble
        let resource = Resource(href: "ref")

        //Action
        var dictionary = [ResourceKey.notice.rawValue: resource]

        //Assertion
        XCTAssertEqual(dictionary[ResourceKey.notice.rawValue]?.href, resource.href)
    }

    func testSubscriptionInsertTwoValidResourcesShouldReturnEachResourceValue() {
        //Assemble
        let resourceOne = Resource(href: "ref")
        let resourceTwo = Resource(href: "ref")

        //Action
        var dictionary = [ResourceKey.notice.rawValue: resourceOne, ResourceKey.chargeback.rawValue: resourceTwo]

        //Assertion
        XCTAssertEqual(dictionary[ResourceKey.notice.rawValue]?.href, resourceOne.href)
        XCTAssertEqual(dictionary[ResourceKey.chargeback.rawValue]?.href, resourceTwo.href)
    }

    func testSubscriptionInsertOneInvalidResourceKeyShouldReturnNil() {
        //Assemble
        let invalidResourceKey = "invalid"
        let resource   = Resource(href: "ref")

        //Action
        var dictionary = [ResourceKey.notice.rawValue: resource]

        //Assertion
        XCTAssertNil(dictionary["invalidResourceKey"])
    }
}

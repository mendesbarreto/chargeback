//
// Created by Douglas Mendes  on 3/25/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import XCTest

@testable import Chargeback

import Quick
import Nimble
import UIKit

@testable import Chargeback

final class DictionarySpec: QuickSpec {
    override func spec() {
        super.spec()
        describe("Dictionary") {
            var resource: Resource!
            var dictionary: [String: Resource]!
            context("when initialized with valid resource") {
                beforeEach {
                    resource = Resource(href: "hrefTest")
                    dictionary = [ResourceKey.notice.rawValue: resource]
                }
                it("expect resource key not be nil") {
                    expect(dictionary[ResourceKey.notice]?.href).to(equal(resource.href))
                }
            }
            context("when initialized with invalid resource") {
                let invalidResource = "invalidRes"
                beforeEach {
                    resource = Resource(href: "hrefTest")
                    dictionary = [invalidResource: resource]
                }
                it("expect resource key to be nil") {
                    expect(dictionary[ResourceKey.notice]).to(beNil())
                }
            }
        }
    }
}

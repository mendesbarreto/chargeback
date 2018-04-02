//
// Created by douglas.barreto on 4/1/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

@testable import Chargeback

struct ChargeBackUserResponseMock {
    static var chargeBackUserResponse: ChargeBackUserResponse {
        return ChargeBackUserResponse(comment: "Some comment", reasonDetails: [ReasonDetailUserResponse(id: "some",
                                                                                                        response: true)])
    }
}

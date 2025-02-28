// Copyright (c) 2022 WSO2 LLC. (http://www.wso2.com) All Rights Reserved.
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/test;
import asithan/gcp.demo.'client.stubs as stubs;

@test:Config {}
function emailSendTest() returns error? {
    stubs:EmailServiceClient ep = check new ("http://localhost:9097");
    stubs:Money cost = {
        currency_code: "USD",
        nanos: 900000000,
        units: 5
    };

    stubs:Address address = {
        street_address: "56, Palm grove",
        city: "Colombo",
        country: "Sri Lanka",
        state: "Western",
        zip_code: 10300
    };

    stubs:OrderItem item1 = {
        item: {
            product_id: "1",
            quantity: 2
        },
        cost: cost
    };

    stubs:OrderItem item2 = {
        item: {
            product_id: "2",
            quantity: 1
        },
        cost: cost
    };

    stubs:SendOrderConfirmationRequest req = {
        email: "anjanasupun05@gmail.com",
        'order: {
            order_id: "1",
            shipping_tracking_id: "2323",
            shipping_cost: cost,
            shipping_address: address,
            items: [item1, item2]
        }
    };
    _ = check ep->SendOrderConfirmation(req);

}

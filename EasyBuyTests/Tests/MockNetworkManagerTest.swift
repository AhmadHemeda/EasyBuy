//
//  MockNetworkManagerTest.swift
//  EasyBuy
//
//  Created by mo_fathy on 17/06/2023.
//

import XCTest
@testable import EasyBuy

final class MockNetworkManagerTest: XCTestCase {

    func testDecodeProductsData() {
        // Given: A request to fetch all products

        MockNetworkManager.shared.queryAllProducts { result in
            // When: The response is received

            // Then: The result should not be nil
            XCTAssertNotNil(result)
        }

    }

    func testProductsCountIs5() {
        // Given: A request to fetch all products

        MockNetworkManager.shared.queryAllProducts { result in
            switch result {
            case .success(let root):
                if let productEdges = root.products {
                    let products = productEdges.nodes
                    // Then: The number of products should be 5
                    XCTAssertEqual(products?.count, 1)
                } else {
                    XCTFail("Error: products not found in response")
                }
            case .failure(_):
                XCTFail("Error fetching products")
            }
        }

    }

//
    func testDecodeCollectionsData() {
            // Given: A request to fetch all collections
            MockNetworkManager.shared.queryAllCollections { result in
                // When: The response is received
                
                // Then: The result should not be nil
                XCTAssertNotNil(result)
            }
            
        }
       
        func testCollectionsCountIs5() {
            // Given: A request to fetch all collections
            
            MockNetworkManager.shared.queryAllCollections { result in
                switch result {
                case .success(let root):
                    if let collectionEdges = root.collections {
                        let collections = collectionEdges.nodes?.count
                        // Then: The number of collections should be 4
                        XCTAssertEqual(collections, 5)
                    } else {
                        XCTFail("Error: collections not found in response")
                    }
                case .failure(_):
                    XCTFail("Error fetching products")
                }
            }
            
        }
    func testDecodeAddressCodesData() {
        // Given: A request to fetch all discount codes
        MockNetworkManager.shared.queryAllAddress{ result in
            // When: The response is received

            // Then: The result should not be nil
            XCTAssertNotNil(result)
        }

    }

    func testAddressCodesCountIs1() {
        // Given: A request to fetch all Address

        MockNetworkManager.shared.queryAllAddress { result in
            switch result {
            case .success(let root):
                if let codeDiscountNodes = root.customer?.addresses?.nodes {
                        let discountCodesCount = codeDiscountNodes.count
                    // Then: The number of discount codes should be 3
                    XCTAssertEqual(discountCodesCount, 1)
                } else {
                    XCTFail("Error: discount codes not found in response")
                }
            case .failure(_):
                XCTFail("Error fetching products")
            }
        }

    }
    
    func testOrderCodesCountIs1() {
        // Given: A request to fetch all Address

        MockNetworkManager.shared.queryAllOrders { result in
            switch result {
            case .success(let root):
                if let OrderNodes = root.orders?.edges {
                        let OrderCount = OrderNodes.count
                    // Then: The number of discount codes should be 3
                    XCTAssertEqual(OrderCount, 1)
                } else {
                    XCTFail("Error: discount codes not found in response")
                }
            case .failure(_):
                XCTFail("Error fetching products")
            }
        }

    }

}

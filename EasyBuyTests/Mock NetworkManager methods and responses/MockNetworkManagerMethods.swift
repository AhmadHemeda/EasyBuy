//
//  MockNetworkManagerMethods.swift
//  EasyBuy
//
//  Created by mo_fathy on 17/06/2023.
//


import Foundation
import Apollo
@testable import EasyBuy

extension MockNetworkManager: NetworkManagerProtocol {
    
    var service: ApolloClient {
        get { return _service }
        set { _service = newValue }
    }
    
    func queryGraphQLRequest<T, K>(query: T, responseModel: K.Type, completion: @escaping ((Result<K, Error>) -> Void)) where T : Apollo.GraphQLQuery, K : Decodable, K : Encodable {
        do {
            let decodedData = try JSONDecoder().decode(K.self, from: jsonResponse)
            completion(.success(decodedData))
        } catch let error {
            completion(.failure(error))
        }
    }
    
    func performGraphQLRequest<T, K>(mutation: T, responseModel: K.Type, completion: @escaping ((Result<K, Error>) -> Void)) where T : Apollo.GraphQLMutation, K : Decodable, K : Encodable {
        
    }
    
    func queryAllProducts(completion: @escaping (Result<DataClassProdcuts, Error>) -> Void) {
        jsonResponse = Data(MockNetworkManager.allProductsResponse.utf8)
        MockNetworkManager.shared.queryGraphQLRequest(query: GetAllProductsQuery(), responseModel: DataClassProdcuts.self) { (result: Result<DataClassProdcuts, Error>) in
            switch result {
            case .success(let decodedData):
                completion(.success(decodedData))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
//
    func queryAllCollections(completion: @escaping (Result<Res_Collection, Error>) -> Void) {
            jsonResponse = Data(MockNetworkManager.allCollectionsResponse.utf8)
            MockNetworkManager.shared.queryGraphQLRequest(query: CollectionsQuery(first: 40), responseModel: Res_Collection.self) { (result: Result<Res_Collection, Error>) in
                switch result {
                case .success(let decodedData):
                    completion(.success(decodedData))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }

    
        func queryAllAddress(completion: @escaping (Result<DataClassAddress, Error>) -> Void) {
            jsonResponse = Data(MockNetworkManager.allAddressCodesResponse.utf8)
            MockNetworkManager.shared.queryGraphQLRequest(query: QueryGetAddressQuery(customerAccessToken: "token",first: 20), responseModel: DataClassAddress.self) { (result: Result<DataClassAddress, Error>) in

                switch result {
                case .success(let decodedData):
                    completion(.success(decodedData))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }

    func queryDraftOrder(id: String, completion: @escaping (Result<DraftOrderCreate, Error>) -> Void) {
            jsonResponse = Data(MockNetworkManager.draftOrderJson.utf8)
            MockNetworkManager.shared.queryGraphQLRequest(query: DraftOrderQuery(id: id), responseModel: DraftOrderCreate.self) { (result: Result<DraftOrderCreate, Error>) in
                switch result {
                case .success(let decodedData):
                    completion(.success(decodedData))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
//

    
    func queryAllOrders(completion: @escaping (Result<ResOrder, Error>) -> Void) {
        jsonResponse = Data(MockNetworkManager.allOrderCodesResponse.utf8)
        MockNetworkManager.shared.queryGraphQLRequest(query:GetOrdersQuery(first: 10,query: "fathy.gmal.com"), responseModel: ResOrder.self) { (result: Result<ResOrder, Error>) in
            switch result {
            case .success(let decodedData):
                completion(.success(decodedData))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
//queryGraphQLRequest(query:GetOrdersQuery(first: 10,query: mail)  ResOrder

    func queryAllDiscountCodes(completion: @escaping (Result<RootDiscountCodes, Error>) -> Void) {
        jsonResponse = Data(MockNetworkManager.discountCodesResponse.utf8)
        MockNetworkManager.shared.queryGraphQLRequest(query: GetAllDiicountCodesQuery(first: 10), responseModel: RootDiscountCodes.self) { (result: Result<RootDiscountCodes, Error>) in
            switch result {
            case .success(let decodedData):
                completion(.success(decodedData))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}


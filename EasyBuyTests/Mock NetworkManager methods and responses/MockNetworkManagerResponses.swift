//
//  MockNetworkManagerResponses.swift
//  EasyBuy
//
//  Created by mo_fathy on 17/06/2023.
//

import Foundation
import Apollo
@testable import EasyBuy

class MockNetworkManager{
    static let shared: MockNetworkManager = .init()
    
    var jsonResponse: Data!
    
    lazy var _service: ApolloClient = {
        let store = ApolloStore()
        let client = URLSessionClient()
        let provider = NetworkInterceptorProvider(store: store, client: client, requestType: .storeFront)
        let url = URL(string: NetworkConstants.baseUrl)!
        
        let requestChainTransport = RequestChainNetworkTransport(interceptorProvider: provider, endpointURL: url)
        
        return ApolloClient(networkTransport: requestChainTransport, store: store)
    }()
    
    static let allProductsResponse = """
    {
        "products": {
          "__typename": "ProductConnection",
          "nodes": [
            {
              "__typename": "Product",
              "id": "gid://shopify/Product/8311139107123",
              "title": "VANS |AUTHENTIC | LO PRO | BURGANDY/WHITE",
              "tags": [
                "egnition-sample-data",
                "men",
                "sale",
                "summer",
                "vans"
              ],
              "description": "The forefather of the Vans family, the original Vans Authentic was introduced in 1966 and nearly 4 decades later is still going strong, its popularity extending from the original fans - skaters and surfers to all sorts. Now remodeled into a low top lace-up with a slim silhouette, the Vans Authentic Lo Pro features sturdy canvas uppers with lower sidewalls, metal eyelets, and low profile mini waffle outsoles for a lightweight feel.",
              "productType": "SHOES",
              "vendor": "VANS",
              "options": [
                {
                  "__typename": "ProductOption",
                  "name": "Size",
                  "values": [
                    "4",
                    "5",
                    "10"
                  ]
                },
                {
                  "__typename": "ProductOption",
                  "name": "Color",
                  "values": [
                    "burgandy"
                  ]
                }
              ],
              "variants": {
                "__typename": "ProductVariantConnection",
                "edges": [
                  {
                    "__typename": "ProductVariantEdge",
                    "node": {
                      "__typename": "ProductVariant",
                      "id": "gid://shopify/ProductVariant/45253508006195",
                      "title": "4 / burgandy",
                      "price": {
                        "__typename": "MoneyV2",
                        "amount": "29.0",
                        "currencyCode": "EGP"
                      },
                      "availableForSale": true
                    }
                  },
                  {
                    "__typename": "ProductVariantEdge",
                    "node": {
                      "__typename": "ProductVariant",
                      "id": "gid://shopify/ProductVariant/45253508038963",
                      "title": "5 / burgandy",
                      "price": {
                        "__typename": "MoneyV2",
                        "amount": "29.0",
                        "currencyCode": "EGP"
                      },
                      "availableForSale": true
                    }
                  },
                  {
                    "__typename": "ProductVariantEdge",
                    "node": {
                      "__typename": "ProductVariant",
                      "id": "gid://shopify/ProductVariant/45253508071731",
                      "title": "10 / burgandy",
                      "price": {
                        "__typename": "MoneyV2",
                        "amount": "29.0",
                        "currencyCode": "EGP"
                      },
                      "availableForSale": true
                    }
                  }
                ]
              },
              "featuredImage": {
                "__typename": "Image",
                "id": "gid://shopify/ProductImage/41348866081075",
                "url": "https://cdn.shopify.com/s/files/1/0773/8789/0995/products/9f190cba7218c819c81566bca6298c6a.jpg?v=1685480862"
              },
              "images": {
                "__typename": "ImageConnection",
                "edges": [
                  {
                    "__typename": "ImageEdge",
                    "node": {
                      "__typename": "Image",
                      "id": "gid://shopify/ProductImage/41348866081075",
                      "url": "https://cdn.shopify.com/s/files/1/0773/8789/0995/products/9f190cba7218c819c81566bca6298c6a.jpg?v=1685480862"
                    }
                  },
                  {
                    "__typename": "ImageEdge",
                    "node": {
                      "__typename": "Image",
                      "id": "gid://shopify/ProductImage/41348866113843",
                      "url": "https://cdn.shopify.com/s/files/1/0773/8789/0995/products/57a6013d4b24210dd35456e5890e9a2e.jpg?v=1685480862"
                    }
                  },
                  {
                    "__typename": "ImageEdge",
                    "node": {
                      "__typename": "Image",
                      "id": "gid://shopify/ProductImage/41348866146611",
                      "url": "https://cdn.shopify.com/s/files/1/0773/8789/0995/products/10835069b66a4a8ffc47febc6e88aee7.jpg?v=1685480862"
                    }
                  },
                  {
                    "__typename": "ImageEdge",
                    "node": {
                      "__typename": "Image",
                      "id": "gid://shopify/ProductImage/41348866179379",
                      "url": "https://cdn.shopify.com/s/files/1/0773/8789/0995/products/81ae3a034de733944fd314f6d27c844f.jpg?v=1685480862"
                    }
                  },
                  {
                    "__typename": "ImageEdge",
                    "node": {
                      "__typename": "Image",
                      "id": "gid://shopify/ProductImage/41348866212147",
                      "url": "https://cdn.shopify.com/s/files/1/0773/8789/0995/products/1580fdd3164d608c47a5d7d6eccbf4cc.jpg?v=1685480862"
                    }
                  }
                ]
              }
            }
          ]
        }
    }
    """
    
    static let allCollectionsResponse = """
{

    "collections": {
      "nodes": [
        {
          "id": "gid://shopify/Collection/447403131187",
          "image": null,
          "handle": "frontpage",
          "title": "Home page"
        },
        {
          "id": "gid://shopify/Collection/447403819315",
          "image": {
            "url": "https://cdn.shopify.com/s/files/1/0773/8789/0995/collections/a340ce89e0298e52c438ae79591e3284.jpg?v=1685481047"
          },
          "handle": "vans",
          "title": "VANS"
        },
        {
          "id": "gid://shopify/Collection/447403852083",
          "image": {
            "url": "https://cdn.shopify.com/s/files/1/0773/8789/0995/collections/97a3b1227876bf099d279fd38290e567.jpg?v=1685481048"
          },
          "handle": "adidas",
          "title": "ADIDAS"
        },
        {
          "id": "gid://shopify/Collection/447403884851",
          "image": {
            "url": "https://cdn.shopify.com/s/files/1/0773/8789/0995/collections/52e93c3a86b9b62e023e5977ab218302.png?v=1685481049"
          },
          "handle": "nike",
          "title": "NIKE"
        },
        {
          "id": "gid://shopify/Collection/447403917619",
          "image": {
            "url": "https://cdn.shopify.com/s/files/1/0773/8789/0995/collections/1651743658af793833e0a0d9cf6a9c5d.png?v=1685481050"
          },
          "handle": "converse",
          "title": "CONVERSE"
        }
      ]
    }
  
}
"""

   static let discountCodesResponse = """
 {
     "data": {
         "codeDiscountNodes": {
             "nodes": [
                 {
                     "id": "gid://shopify/DiscountCodeNode/1388420661555",
                     "codeDiscount": {
                         "title": "25PercentOffEverything",
                         "summary": "25% off entire order • One use per customer",
                         "codeCount": 1,
                         "usageLimit": null,
                         "status": "ACTIVE",
                         "customerGets": {
                             "items": {
                                 "__typename": "AllDiscountItems"
                             },
                             "value": {
                                 "__typename": "DiscountPercentage"
                             }
                         },
                         "codes": {
                             "nodes": [
                                 {
                                     "code": "25OFFEVERYTHING",
                                     "id": "gid://shopify/DiscountRedeemCode/20328401305907"
                                 }
                             ]
                         }
                     }
                 },
                 {
                     "id": "gid://shopify/DiscountCodeNode/1388430885171",
                     "codeDiscount": {
                         "title": "Men 50%",
                         "summary": "50% off MEN • One use per customer",
                         "codeCount": 1,
                         "usageLimit": null,
                         "status": "ACTIVE",
                         "customerGets": {
                             "items": {
                                 "__typename": "DiscountCollections"
                             },
                             "value": {
                                 "__typename": "DiscountPercentage"
                             }
                         },
                         "codes": {
                             "nodes": [
                                 {
                                     "code": "MEN50OFF",
                                     "id": "gid://shopify/DiscountRedeemCode/20328492564787"
                                 }
                             ]
                         }
                     }
                 },
                 {
                     "id": "gid://shopify/DiscountCodeNode/1388494094643",
                     "codeDiscount": {
                         "title": "70 Percent Off Kids",
                         "summary": "70% off KID • One use per customer",
                         "codeCount": 1,
                         "usageLimit": 5,
                         "status": "ACTIVE",
                         "customerGets": {
                             "items": {
                                 "__typename": "DiscountCollections"
                             },
                             "value": {
                                 "__typename": "DiscountPercentage"
                             }
                         },
                         "codes": {
                             "nodes": [
                                 {
                                     "code": "70OFFKIDS",
                                     "id": "gid://shopify/DiscountRedeemCode/20328928313651"
                                 }
                             ]
                         }
                     }
                 },
                 {
                     "id": "gid://shopify/DiscountCodeNode/1388638306611",
                     "codeDiscount": {
                         "title": "Women 20% off",
                         "summary": "20% off WOMEN • One use per customer",
                         "codeCount": 1,
                         "usageLimit": null,
                         "status": "ACTIVE",
                         "customerGets": {
                             "items": {
                                 "__typename": "DiscountCollections"
                             },
                             "value": {
                                 "__typename": "DiscountPercentage"
                             }
                         },
                         "codes": {
                             "nodes": [
                                 {
                                     "code": "20PERCENTOFFWOMENITEMS",
                                     "id": "gid://shopify/DiscountRedeemCode/20330180542771"
                                 }
                             ]
                         }
                     }
                 }
             ]
         }
     },
     "extensions": {
         "cost": {
             "requestedQueryCost": 537,
             "actualQueryCost": 31,
             "throttleStatus": {
                 "maximumAvailable": 1000.0,
                 "currentlyAvailable": 969,
                 "restoreRate": 50.0
             }
         }
     }
 }
 """
    static let draftOrderJson = """
        {
                "draftOrder": {
                    "id": "gid://shopify/DraftOrder/1120714129715",
                    "name": "#D273",
                    "email": "mamo2men@gmail.com",
                    "subtotalPrice": "29.00",
                    "note2": null,
                    "totalPrice": "33.06",
                    "lineItems": {
                        "nodes": [
                            {
                                "quantity": 1,
                                "variant": {
                                    "id": "gid://shopify/ProductVariant/45253508006195",
                                    "price": "29.00",
                                    "availableForSale": true,
                                    "title": "4 / burgandy"
                                },
                                "product": {
                                    "id": "gid://shopify/Product/8311139107123",
                                    "priceRangeV2": {
                                        "maxVariantPrice": {
                                            "amount": "29.0",
                                            "currencyCode": "EGP"
                                        }
                                    },
                                    "title": "VANS |AUTHENTIC | LO PRO | BURGANDY/WHITE",
                                    "productType": "SHOES",
                                    "featuredImage": {
                                        "url": "https://cdn.shopify.com/s/files/1/0773/8789/0995/products/9f190cba7218c819c81566bca6298c6a.jpg?v=1685480862"
                                    }
                                }
                            }
                        ]
                    }
                },
            "extensions": {
                "cost": {
                    "requestedQueryCost": 503,
                    "actualQueryCost": 8,
                    "throttleStatus": {
                        "maximumAvailable": 1000.0,
                        "currentlyAvailable": 992,
                        "restoreRate": 50.0
                    }
                }
            }
        }
        """
    static let  allAddressCodesResponse = """
{
    "customer": {
      "addresses": {
        "__typename": "MailingAddressConnection",
        "nodes": [
          {
            "__typename": "MailingAddress",
            "address1": "Apple Campus",
            "address2": "",
            "city": "Cupertino",
            "country": "United States",
            "id": "gid://shopify/MailingAddress/9216817168691?model_name=CustomerAddress&customer_access_token=LUbHxgc0_eagOo3H-Q81qFNHbHLF1zJEQtWNfHQP6tExtquH2pjH1US4mT8sQYYyEYvKVeZp2L7Bpd-16kXH4kzwjrysJRfG7BjXMRUfMNtwJ0L4UVGmprDTr18bikGrDsWwVP6MEtf92y3v9xKbyb97k3J8fJSYP77JPK6kc3Sd2Szn5LnpSGFN9brES28KXrWb0t-BVOsQOV6kg505qyLr6jhkcD5ECaCfwfrgqK0uhNRIkBlzQb1Jyys-tlnw",
            "zip": "95014",
            "phone": "01225024355"
          }
        ]
      },
      "__typename": "Customer",
      "email": "draft@gmail.com",
      "firstName": "lead",
      "lastName": "dads",
      "phone": "+201012345678",
      "id": "gid://shopify/Customer/7023240511795",
      "displayName": "lead dads"
    }
  
}
"""
    
    static let  allOrderCodesResponse = 
    """
{
    
        "orders": {
            "__typename": "OrderConnection",
            "edges": [
                {
                    "__typename": "OrderEdge",
                    "node": {
                        "__typename": "Order",
                        "id": "gid://shopify/Order/5378473918771",
                        "name": "#1021",
                        "phone": "+15145676599",
                        "createdAt": "2023-06-14T18:32:36Z",
                        "displayFinancialStatus": "PAID",
                        "displayFulfillmentStatus": "UNFULFILLED",
                        "returnStatus": "NO_RETURN",
                        "totalPriceSet": {
                            "__typename": "MoneyBag",
                            "presentmentMoney": {
                                "__typename": "MoneyV2",
                                "amount": "33.06",
                                "currencyCode": "EGP"
                            },
                            "shopMoney": {
                                "__typename": "MoneyV2",
                                "amount": "33.06",
                                "currencyCode": "EGP"
                            }
                        },
                        "shippingAddress": null
                    }
                }
            ]
        
    },
    "extensions": {
        "cost": {
            "requestedQueryCost": 8,
            "actualQueryCost": 5,
            "throttleStatus": {
                "maximumAvailable": 1000.0,
                "currentlyAvailable": 995,

                "restoreRate": 50.0
            }
        }
    }
}
"""
}

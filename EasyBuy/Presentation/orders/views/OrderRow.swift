//
//  OrderRow.swift
//  EasyBuy
//
//  Created by mo_fathy on 05/06/2023.
//

import SwiftUI

struct OrderRow: View {
    var order: Order
    var selectorIndex = 0
    var body: some View {
        VStack(alignment: .leading) {
            VStack{
                HStack {
                    let orderNumber = "Order No: \(order.name ?? "207119551")"
                    Text(orderNumber)
                    Spacer()
                    Text(order.createdAt ?? "")

                        .foregroundColor(.gray)
                }.padding([.top], 2)
                HStack() {
                    Text("Address:")
                    let Address = "\(order.billingAddress?.city ?? ""),\(order.billingAddress?.address1 ?? "shipping Address")"
                    Text(Address)
                        .foregroundColor(.gray)
                    Spacer()
                }.padding([.top], 2)
                HStack {
                    Text("Total Amount:")
                    let price : Double = Double( order.totalPriceSet?.shopMoney?.amount ?? "0.0") ?? 0.0
                    let priceCurrency = price * (UserDefaults.standard.numCurrency ?? 1.0)
                    let formattedprice = String(format: "%.2f", priceCurrency) + " \(UserDefaults.standard.currency!)"
                    Text(formattedprice)
                    
                    
                   
                   
                        .foregroundColor(.gray)
                    Spacer()
                }.padding([.top], 2)
//                HStack{
//                    if self.selectorIndex == 0 {
//                        Text(order.displayFulfillmentStatus ?? "Delivered")
//                            .foregroundColor(.green)
//                            .padding(.vertical, 1)
//                    } else if self.selectorIndex == 1 {
//                        Text(order.displayFulfillmentStatus ?? "Processing")
//                            .foregroundColor(Color.init("CCAA00"))
//                            .padding(.vertical, 1)
//                    } else {
//                        Text(order.displayFulfillmentStatus ?? "Cancelled")
//                            .foregroundColor(.red)
//                            .padding(.vertical, 1)
//                    }
//                    Spacer()
//                }
             
                
            }.padding(.all,15)
               .background(Color("itemcolor"))
                .cornerRadius(25)
        }
        .font(.footnote)

    }
}

struct OrderRow_Previews: PreviewProvider {
    static var previews: some View {
        let resOrder : ResOrder = Bundle.main.decode("orders.json")
        OrderRow(order: (resOrder.orders?.edges?.first?.node)!)
    }
}

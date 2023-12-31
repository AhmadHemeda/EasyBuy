//
//  AddToCartView.swift
//  EasyBuy
//
//  Created by Ahmad Hemeda on 08/06/2023.
//

import SwiftUI

struct AddToCartView: View {
    @AppStorage("token") var token: String?
    let price: String?
    let action: () -> Void
    var body: some View {
       HStack {
            VStack {
                Text("Total price")
                Text("\(formatPrice(price: price))")
                    .font(.title)
                    .foregroundColor(.black)
            }
            
            Spacer()
           if token != "guest"{
               Button(action: action) {
                   Text("Add to Cart")
                       .font(.title3)
                       .fontWeight(.semibold)
                       .foregroundColor(Color.white)
                       .padding()
                       .padding(.horizontal, 8)
                       .background(Color.black)
                       .cornerRadius(10.0)
               }
           }
       }.onAppear{
           SettingsViewModel().getCurrency()
       }
        .padding()
        .padding(.horizontal)
        .cornerRadius(60.0, corners: .topLeft)
        .frame(maxHeight: .infinity, alignment: .bottom)
        .edgesIgnoringSafeArea(.bottom)
        .background(Color("itemcolor"))
    }
}


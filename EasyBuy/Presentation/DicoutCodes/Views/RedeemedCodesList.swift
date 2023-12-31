//
//  RedeemedCodesList.swift
//  EasyBuy
//
//  Created by moamen ali gomaa on 05/06/2023.
//

import SwiftUI

struct RedeemedCodesList: View {
    @StateObject var redeemedViewModel: RedeemedListViewModel
    @State var isUseable = false
    var checkoutViewModel: CheckoutViewModel?
    var body: some View {
        VStack(alignment: .leading){
            if #available(iOS 16.0, *) {
                Text("Redeemed Discounts Offer").frame(maxWidth: .infinity, alignment: .leading).padding(.leading,10).fontWeight(.bold).font(Font.system(size: 22))
                }
                ScrollView{
                    LazyVStack {
                        ForEach(redeemedViewModel.codes?.discountCodes ?? []){ code in
                            
                            RedeemedCell(code: code, isUseable: isUseable, checkoutViewModel: checkoutViewModel, redeemedViewMode: redeemedViewModel).padding(.all,10).listRowBackground(Color.clear)   .listRowSeparator(.hidden).clipped().cornerRadius(16)
                        }
                    }.onAppear(){
                        let customerID = UserDefaults.standard.string(forKey: "customerID")
                        redeemedViewModel.getRedeemedCode(id: customerID!)
                        
                    }
                    
                }
            }
    }
}

//struct RedeemedCodesList_Previews: PreviewProvider {
//    static var previews: some View {
//        RedeemedCodesList(redeemedViewModel: RedeemedListViewModel(), isPresented: <#Binding<Bool>#>)
//    }
//}

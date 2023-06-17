//
//  ShopingCartListUIView.swift
//  EasyBuy
//
//  Created by moamen ali gomaa on 13/06/2023.
//

import SwiftUI

struct ShopingCartListUIView: View {
    @ObservedObject var shopingCartViewModel: CartListViewModel
    @ObservedObject var settingsViewModel = SettingsViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var showAlert = false
    @State private var indexSet: IndexSet?
    var body: some View {
        VStack{
            if #available(iOS 16.0, *) {
                Text("Shopping Cart").frame(maxWidth: .infinity, alignment: .leading).padding(.leading,10).fontWeight(.bold).font(Font.system(size: 22))
            }
            ScrollView{
                LazyVStack {
                    ForEach(shopingCartViewModel.products ?? [], id: \.variant?.id) { item in

                        FavoriteAndCartCell(imageUrl: URL(string: item.product?.featuredImage?.url ?? "not available"),
                                            title: item.product?.title,
                                            type: item.product?.productType,
                                            price: formatPrice(price: item.product?.priceRangeV2?.maxVariantPrice?.amount),
                                            onDelete: {
                            showAlert = true
                            self.indexSet = shopingCartViewModel.indexSet(for: item)
                            
                        },
                                            availableQuantity: item.quantity ?? 10)
                        
                    }.alert(isPresented: $showAlert){
                        Alert(title: Text("Delete ?"),message: Text("Do you want to delete this product from your cart ?") ,
                              primaryButton: .destructive(Text("OK"),action: {
                            shopingCartViewModel.deletProduct(indexSet: self.indexSet!)
                            
                        }),
                              secondaryButton: .cancel())
                    }
                }.padding(.horizontal,10)
            }
            .onAppear{
                shopingCartViewModel.getCartItems()
                settingsViewModel.getCurrency()
            }
            if shopingCartViewModel.products?.isEmpty == false{
                HStack{
                    Text("Total Price : \(formatPrice(price: shopingCartViewModel.totalPrice))")
                    
                    NavigationLink(destination: CheckoutView(viewModel: CheckoutViewModel())) {
                        Text("Checkout")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                            .padding()
                            .padding(.horizontal, 8)
                            .background(Color.black)
                            .cornerRadius(10.0)
                    }
                   
                }
            }
                else{
                        NoProducts().frame(maxWidth: .infinity, alignment: .center)
                }
            }.navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: BackButton(action: {
                presentationMode.wrappedValue.dismiss()
            })).background(Color("itemcolor"))
   
    }
  
}

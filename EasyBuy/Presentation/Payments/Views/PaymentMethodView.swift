//
//  PaymentMethodView.swift
//  EasyBuy
//
//  Created by moamen ali gomaa on 16/06/2023.
//

import SwiftUI
import AlertToast

struct PaymentMethodView: View {
    @State var totalPrice: String = ""
    @State var products: [LinesItemNode] = []
    @State var draftOrderID: String = ""
    @StateObject var isSuccess = SuccessPayment()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        VStack{
            if #available(iOS 16.0, *) {
                Text("Payment Method").frame(maxWidth: .infinity, alignment: .leading).padding(.leading,10).fontWeight(.bold).font(Font.system(size: 22))
            }
            PaymentButton(products: products, totalPrice: totalPrice,currrencyCode: UserDefaults.standard.currency ?? "USD", draftOrderID: draftOrderID, isSuccess: isSuccess).frame(minWidth: 100, maxWidth:
                    .infinity, maxHeight: 45)
            .padding()
            Button {
                isSuccess.showAlert = true
                isSuccess.isLoading = true
                Task{
                    await isSuccess.completeOrder(draftOrderID: draftOrderID)
                    isSuccess.draftOrderDelete()
                  
                }
            } label: {
                Text("Cash On Delivery")
                    .frame(minWidth: 100, maxWidth:
                            .infinity, maxHeight: 45)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(5)
                    .padding ()
            }
            Spacer()

            if isSuccess.isSuccess {
                              NavigationLink(
                                  destination:  BaseView().navigationBarBackButtonHidden(true),
                                  isActive: $isSuccess.isSuccess,
                                  label: {
                                      EmptyView()
                                  })
                          }

        }.toast(isPresenting: $isSuccess.showAlert){
            var alertToast: AlertToast?
            if isSuccess.isLoading{
                alertToast = AlertToast(type: .loading, title: "Please wait...")
            }
            if isSuccess.isComplete{
                alertToast = AlertToast(type: .complete(.green), title: "Completed ",subTitle: "Congrats your order completed")
            }
          
            return alertToast ?? AlertToast(type: .loading , title: "Please wait...")
        }
.navigationBarBackButtonHidden(true).navigationBarItems(leading: BackButton(action: { presentationMode.wrappedValue.dismiss() }))
           .background(Color("itemcolor"))
      
    }
}

struct PaymentMethodView_Previews: PreviewProvider {
    @State static var totalPrice = "total price"
    @State static var products: [LinesItemNode] = []
    static var previews: some View {
        PaymentMethodView(totalPrice: totalPrice)
    }
}

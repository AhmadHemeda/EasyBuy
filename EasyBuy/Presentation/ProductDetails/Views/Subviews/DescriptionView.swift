import SwiftUI
import AlertToast

struct DescriptionView: View {
    let product: DataClass?
    @ObservedObject var viewModel: ProductViewModel
    @Binding var isExist: Bool
    @State private var showToast = false
    var body: some View {
        VStack (alignment: .leading) {
            ProductTitleView(
                isExist: $isExist,
                title: product?.product?.title ?? "",
                productType: product?.product?.productType ?? "",
                action: {
                    viewModel.getFavoriteDraftOrder()
                        
                    
                })
//            .onChange(of: viewModel?.isFavoriteExist ?? false) { newValue in
//                isExist = newValue
//            }
            
            RatingView(rating: 3.2)
            
            Text("Description")
                .fontWeight(.medium)
                .padding(.vertical, 8)
            Stepper {
                Text("Quantity : \(viewModel.quantity)")
            } onIncrement: {
                if viewModel.quantity == viewModel.availableQuantity{
                    showToast.toggle()
                }
                else{
                    viewModel.quantity += 1
                    let price = Double(product?.product?.variants?.edges?.first?.node?.price?.amount ?? "1.0")
                    viewModel.price = "\(Double(viewModel.quantity) * (price ?? 100))"
                }
            } onDecrement: {
                if viewModel.quantity > 1{
                    viewModel.quantity -= 1
                    let price = Double(product?.product?.variants?.edges?.first?.node?.price?.amount ?? "1.0")
                    viewModel.price = "\(Double(viewModel.quantity) * (price ?? 100))"
                }
            }.toast(isPresenting: $showToast){
                AlertToast(type: .error(.red), title: "Sorry 🙋‍♂️",subTitle: "No more item available 🙋‍♂️" )
            }
            Text(product?.product?.description ?? "")
                .lineSpacing(8.0)
                .opacity(0.6)
            
            SizesView(variants: product?.product?.variants?.edges,viewModel: viewModel )
        }
        .padding()
        .padding(.top)
        .background(Color.gray)
        .cornerRadius(30, corners: [.topLeft, .topRight])
    }
}


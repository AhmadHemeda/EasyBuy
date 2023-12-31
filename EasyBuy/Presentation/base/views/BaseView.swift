import SwiftUI

struct BaseView: View {
    @StateObject var baseData = BaseViewModel()
    @AppStorage("barIsShow") var barIsShow: Bool = false
    @AppStorage("token") var token: String?
    @State var unreadNotifications: Int = 0

    // MARK: - HIDE TAB BAR
    init() {
        UITabBar.appearance().isHidden = true
        
    }
    
    var body: some View {
   
            TabView(selection: $baseData.currentTab) {
                Home()
                    .environmentObject(baseData)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black.opacity(0.04))
                    .tag(Tab.Home)
                Category()
                    .environmentObject(baseData)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black.opacity(0.04))
                    .tag(Tab.Category)
                if token == "guest" || token == "" {
                    NoAccountView()
                        .environmentObject(baseData)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.black.opacity(0.04))
                        .tag(Tab.Heart)
                } else {
                    FavoriteProductsView(favoriteProductViewModel: FavoriteListViewModel())
                        .environmentObject(baseData)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.black.opacity(0.04))
                        .tag(Tab.Heart)
                }
                if token == "guest" || token == "" {
                    NoAccountView()
                        .environmentObject(baseData)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.black.opacity(0.04))
                        .tag(Tab.Person)
                } else {
                    ProfileView()
                        .environmentObject(baseData)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.black.opacity(0.04))
                        .tag(Tab.Person)
                }
            }.onAppear{
                unreadNotifications = UserDefaults.standard.integer(forKey: "count")
            }
            .overlay(
                // MARK: - CUSTOM TAB BAR
                HStack(spacing: 0) {
                    if(barIsShow){
                        
                    }else{
                        // MARK: - TAB BUTTON
                        TabButton(Tab: .Home)
                        TabButton(Tab: .Category)
                            .offset(x: -10)
                        
                        // MARK: CURVED BUTTON
                        NavigationLink {
                            if token == "guest" || token == "" {
                                NoAccountView()
                                    .environmentObject(baseData)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .background(Color.black.opacity(0.04))
                                    .tag(Tab.Person)
                            } else {
                                ShopingCartListUIView(shopingCartViewModel: CartListViewModel())
                            }
                        } label: {
                            
                            Image("cart")
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 26, height: 26)
                                .offset(x: -1)
                                .padding(18)
                                .foregroundColor(Color("myWhite"))
                                .background(Color("Btnbg"))
                                .clipShape(Circle())
                                .shadow(color: Color.black.opacity(0.04), radius: 5, x: 5, y: 5)
                                .shadow(color: Color.black.opacity(0.04), radius: 5, x: -5, y: -5)
                        }.onAppear(perform: {
                            unreadNotifications = UserDefaults.standard.integer(forKey: "count")
                            print(unreadNotifications)
                        }).overlay(
                            NotificationCountView(value: $unreadNotifications)
                        ).offset(y: -30)


                      
                       
                        
                        TabButton(Tab: .Heart)
                            .offset(x: 10)
                        TabButton(Tab: .Person)
                    }
                }.background(
                        Color("myWhite")
                            .clipShape(CustomCurveShape())
                        //MARK: - SHADOW
                            .shadow(color: Color.black.opacity(0.04), radius: 5, x: -5, y: -5)
                            .ignoresSafeArea(.container, edges: .bottom)
                    )
                //MARK: - HIDE TAB ON DETAIL VIEW
                    .offset(y: baseData.showDetail ? 200 : 0)
                
                , alignment: .bottom
            )
            
        
    }
 
        @ViewBuilder
        func TabButton(Tab: Tab)-> some View {
            Button {
                withAnimation{
                    baseData.currentTab = Tab
                }
            } label: {
                Image(Tab.rawValue)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                    .foregroundColor(baseData.currentTab == Tab ? Color("Btnbg") : Color.gray.opacity(0.5))
                    .frame(maxWidth: .infinity)
            }
        }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}

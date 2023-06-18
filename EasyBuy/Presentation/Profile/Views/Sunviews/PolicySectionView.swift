import SwiftUI

struct PolicySectionView: View {
    @Binding var isShowingFAQs: Bool
    @Binding var isShowingAboutUs: Bool
    @AppStorage("email") var email: String?
    @AppStorage("displayName") var displayName: String?
    var body: some View {
        Section("Policy") {
            Button {
                isShowingFAQs = true
            } label: {
                SettingRowView(imageName: "exclamationmark.circle.fill", title: "FAQs", tintColor: .black)
            }
            .sheet(isPresented: $isShowingFAQs) {
                FAQView()
            }
            
            Button {
                isShowingAboutUs = true
                email = ""
                displayName = ""
            } label: {
                SettingRowView(imageName: "checkmark.shield.fill", title: "About Us", tintColor: .black)
            }
            .sheet(isPresented: $isShowingAboutUs) {
                AboutUsView()
            }
        }
    }
}

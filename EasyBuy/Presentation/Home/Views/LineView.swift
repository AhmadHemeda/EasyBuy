//
//  LineView.swift
//  EasyBuy
//
//  Created by mo_fathy on 03/06/2023.
//

import SwiftUI

struct LineView: View {
    let color: Color = Color.gray
    var body: some View {
        Divider()
            .background(color)
    }
}

struct LineView_Previews: PreviewProvider {
    static var previews: some View {
        LineView()
    }
}

//
//  CustomDivider.swift
//  Moonshot
//
//  Created by Badran on 18/07/2022.
//

import SwiftUI

struct CustomDivider: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundColor(.lightBackground)
            .padding(.vertical)
    }
}

struct CustomDivider_Previews: PreviewProvider {
    static var previews: some View {
        CustomDivider()
            .background(.darkBackground)
    }
}

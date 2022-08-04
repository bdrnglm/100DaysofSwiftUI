//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Badran on 04/08/2022.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var wrapper: OrderWrapper
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $wrapper.order.name)
                TextField("Street Address", text: $wrapper.order.streetAddress)
                TextField("City", text: $wrapper.order.city)
                TextField("Zip", text: $wrapper.order.zip)
            }
            
            Section {
                NavigationLink {
                    CheckoutView(wrapper: wrapper)
                } label: {
                    Text("Check out")
                }
            }
            .disabled(!wrapper.order.hasValidAddress)
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(wrapper: OrderWrapper())
    }
}

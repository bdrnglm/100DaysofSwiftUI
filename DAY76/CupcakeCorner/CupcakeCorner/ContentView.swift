//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Badran on 04/08/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var wrapper = OrderWrapper()

    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $wrapper.order.type) {
                        ForEach(Order.types.indices) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("Number of cakes: \(wrapper.order.quantity)", value: $wrapper.order.quantity, in: 3...20)
                }
                
                Section {
                    Toggle("Any special request ?", isOn: $wrapper.order.specialRequestEnabled.animation())
                    
                    if wrapper.order.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $wrapper.order.extraFrosting)
                        Toggle("Add extra sprinkles", isOn: $wrapper.order.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink {
                        AddressView(wrapper: wrapper)
                    } label: {
                        Text("Delivery details")
                    }
                }
            }
            .navigationTitle("CupcakeCorner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  UnitConverter
//
//  Created by Badran on 19/06/2022.
//

import SwiftUI

struct ContentView: View {
    @FocusState private var degreeIsFocused: Bool
    
    let temperatureUnits = ["C", "F", "K"]

    @State private var temperatureUnit = "C"
    @State private var temperature = 0.0
    
    var celcius: Double {
        switch temperatureUnit {
        case "F":
            return (temperature - 32) * 5 / 9
        case "K":
            return temperature - 273.15
        default:
            return temperature
        }
    }

    var farhenheit: Double {
        switch temperatureUnit {
        case "C":
            return (temperature * 9 / 5) + 32
        case "K":
            return (temperature - 32) * 5 / 9 + 273.15
        default:
            return temperature
        }
    }
    
    var kelvin: Double {
        switch temperatureUnit {
        case "C":
            return temperature + 273.15
        case "F":
            return (temperature - 273.15) * 9 / 5 + 32
        default:
            return temperature
        }
    }
        
    var body: some View {
        NavigationView {
            Form {
                Group {
                    Section {
                        TextField("\(temperatureUnit)", value: $temperature, format: .number)
                            .keyboardType(.decimalPad)
                            .focused($degreeIsFocused)
                        
                    } header: {
                        Text("Temperature to convert")
                    }
                    
                    Section {
                        Picker("Temperature Units", selection: $temperatureUnit){
                            ForEach(temperatureUnits, id: \.self) {
                                Text("°\($0)")
                            }
                        }
                        .pickerStyle(.segmented)

                    } header: {
                        Text("Temperature Units")
                    }

                    Group {
                        Section {
                            Text("\(String(format: "%g", celcius))°C")
                        } header: {
                            Text("Celcius")
                        }

                        Section {
                            Text("\(String(format: "%g", farhenheit))°F")
                        } header: {
                            Text("Farhenheit")
                        }

                        Section {
                            Text("\(String(format: "%g", kelvin))°K")
                        } header: {
                            Text("Kelvin")
                        }
                    }
                }
            }
            .navigationTitle("UnitConverter")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        degreeIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

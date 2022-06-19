//
//  ContentView.swift
//  UnitConverter
//
//  Created by Badran on 19/06/2022.
//

import SwiftUI

struct ContentView: View {
    @FocusState private var degreeIsFocused: Bool
    
    @State private var temperature = 0.0
    @State private var temperatureUnit = "°C"
    
    let temperatureUnits = ["°C", "°F", "°K"]
    
    var body: some View {
        NavigationView {
            Form {
                Group {
                    Section {
                        Picker("Temperatures Units", selection: $temperatureUnit){
                            ForEach(temperatureUnits, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.segmented)

                    } header: {
                        Text("Temperatures Units")
                    }

                    Section {
                        TextField("Temperature to convert", value: $temperature, format: .number)
                            .keyboardType(.decimalPad)
                            .focused($degreeIsFocused)
                        
                    } header: {
                        Text("Degree \(temperatureUnit) to convert")
                    }
                    
                    Group {
                        Section {
                            if temperatureUnit == "°F" {
                                let convertedTemperature = (temperature - 32) * 5 / 9
                                Text("\(String(format: "%g", convertedTemperature))°C")
                            } else if temperatureUnit == "°K" {
                                let convertedTemperature = temperature - 273.15
                                Text("\(String(format: "%g", convertedTemperature))°C")
                            } else {
                                Text("\(String(format: "%g", temperature))°C")
                            }
                        } header: {
                            Text("Celcius")
                        }

                        Section {
                            if temperatureUnit == "°C" {
                                let convertedTemperature = (temperature * 9 / 5) + 32
                                Text("\(String(format: "%g", convertedTemperature))°F")
                            } else if temperatureUnit == "°K" {
                                let convertedTemperature = (temperature - 32) * 5 / 9 + 273.15
                                Text("\(String(format: "%g", convertedTemperature))°F")
                            } else {
                                Text("\(String(format: "%g", temperature))°F")
                            }
                        } header: {
                            Text("Farhenheit")
                        }

                        Section {
                            if temperatureUnit == "°C" {
                                let convertedTemperature = temperature + 273.15
                                Text("\(String(format: "%g", convertedTemperature))°K")
                            } else if temperatureUnit == "°F" {
                                let convertedTemperature = (temperature - 273.15) * 9 / 5 + 32
                                Text("\(String(format: "%g", convertedTemperature))°K")
                            } else {
                                Text("\(String(format: "%g", temperature))°K")
                            }
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

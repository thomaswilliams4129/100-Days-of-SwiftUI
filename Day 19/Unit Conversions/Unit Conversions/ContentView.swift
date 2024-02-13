//
//  ContentView.swift
//  Unit Conversions
//
//  Created by Thomas Williams on 2/12/24.
//

import SwiftUI

struct ContentView: View {
    @State var inputUnit = "Celsius"
    @State var outputUnit = "Fahrenheit"
    @State var input = 0.0
    @FocusState private var tempIsFocused: Bool

    
    let temperatureUnits = ["Celsius", "Fahrenheit", "Kelvin"]
    
    private var outPut: Double {
        
        var celsiusValue = 0.0
        
        // convert all inputs to celsius
        switch inputUnit {
        case "Celsius":
            celsiusValue = input
        case "Fahrenheit":
            celsiusValue = (input - 32) * 5/9
        case "Kelvin":
            celsiusValue = input - 273.15
        default:
            break
        }
        
        var outputValue = 0.0
        
        // convert value to whatever the desidered output value
        switch outputUnit {
        case "Celsius":
            outputValue = celsiusValue
        case "Fahrenheit":
            outputValue = celsiusValue * 9/5 + 32
        case "Kelvin":
            outputValue = celsiusValue + 273.15
        default:
            break
        }
        
        return outputValue
    }
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Temperature Input") {
                    TextField("Input Temperature", value: $input, format: .number)
                        .keyboardType(.numberPad)
                        .focused($tempIsFocused)
                    Picker("Unit Selection", selection: $inputUnit) {
                        ForEach(temperatureUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }

                
                Section("Temperature Output") {
                    Text("\(outPut.formatted())")
                    Picker("Unit Selection", selection: $outputUnit) {
                        ForEach(temperatureUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
            }
            .navigationTitle("Convert Tempatures")
            .toolbar {
                if tempIsFocused {
                    Button("Done") {
                        tempIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

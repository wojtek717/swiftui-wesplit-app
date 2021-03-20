//
//  ContentView.swift
//  WeSplit
//
//  Created by Wojciech Konury on 07/02/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    private var tipPercentages = [5, 10, 15, 20, 0]
    
    var totalAmount: Double {
        guard let checkValue = Double(checkAmount) else {
            return 0
        }
        
        let tipSelection = Double(tipPercentages[tipPercentage])
        
        return (checkValue/100*tipSelection) + checkValue
    }
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)

        
        return totalAmount/peopleCount
    }
    
    
    
    var body: some View {
    
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<50) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section(header: Text("Total check amount")) {
                    Text("$\(totalAmount, specifier: "%.2f")")
                }
                
                Section(header: Text("Amount per person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
                
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
            }
            .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  WeSplit
//
//  Created by 마석우 on 2022/07/09.
//

import SwiftUI
import Foundation

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    
    let percentage = [0, 10, 20, 25, 30]

    var totalPerperson: Double{
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)

        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }
    
    var totalAmount: Double {
        let tipSelection = Double(tipPercentage)

        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        
        return grandTotal
    }
    
    var body: some View {
       NavigationView {
           
           Form {
               
               Section{
                   TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                       .keyboardType(.decimalPad)
                       .focused($amountIsFocused)
                   
                   Picker("Number of People", selection: $numberOfPeople) {
                       ForEach(2..<100) {
                           Text("\($0) people")
                       }
                   }
               }
               
               Section{
                   Picker("Tip Percentage", selection: $tipPercentage) {
                       ForEach(0..<101) {
                           Text($0, format: .percent)
                       }
                   }
//                   .pickerStyle(.wheel)
               } header: {
                   Text("how much tip do you want to leave?")
               }
               
               Section{
                   Text(checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))

               }
               
               Section {
                   Text("\(totalAmount)")
                       .foregroundColor(tipPercentage == 0 ? .red : .black)
               } header: {
                   Text("total amount")
               }
               
               Section {
                   Text("\(totalPerperson)")
               } header: {
                   Text("amount per person")
               }
               .toolbar {
                   ToolbarItemGroup(placement: .keyboard) {
                       Button("Done") {
                           amountIsFocused = false
                       }
                   }
               }
           }
           .navigationTitle("WeSplit")
       }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            ContentView()
        }
    }
}

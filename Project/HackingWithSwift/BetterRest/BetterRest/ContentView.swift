//
//  ContentView.swift
//  BetterRest
//
//  Created by 마석우 on 2022/07/19.
//

import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakeUp = defaultDate
    @State private var sleepAmount = 8.0
    @State private var coffeAmount = 1
    
    var sleepResult: String {
        do {
            let config = MLModelConfiguration()
            let model = try sleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            return  "your ideal bedtime is.." + sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            return "sorry there was a problem calculating your bedtime"
        }
    }
    static var defaultDate: Date {
        var componets = DateComponents()
        componets.hour = 7
        componets.minute = 0
        
        return Calendar.current.date(from: componets) ?? Date.now
    }
    @State private var showingAlert = false
    @State private var message = ""
    @State private var alertTitle = ""
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    DatePicker("please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                } header: {
                    Text("when do you want to wake up?")
                        .font(.headline)
                }
                
                Section {
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                } header: {
                    Text("Desire amount of sleep")
                        .font(.headline)
                }
                
                Section {
                    Picker("\(coffeAmount) cup", selection: $coffeAmount) {
                        ForEach(0..<21) {
                            Text("\($0)")
                        }
                    }
                } header: {
                    Text("Daily coffee intake")
                        .font(.headline)
                }
                
                Section {
                    Text("\(sleepResult)")
                } header: {
                    Text("Recommended bedime")
                        .font(.largeTitle)
                }
                .navigationTitle("Better Rest")
                
            }
        }
    }
    
    func calcurateBedtime() {
        do {
            let config = MLModelConfiguration()
            let model = try sleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            alertTitle = "your ideal bedtime is.."
            message = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            //something wrong
            alertTitle = "error"
            message = "sorry there was a problem calculating your bedtime"
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

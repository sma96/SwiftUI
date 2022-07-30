//
//  ContentView.swift
//  GeussTheFlag
//
//  Created by 마석우 on 2022/07/13.
//

import SwiftUI

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        .asymmetric(
                   insertion: .move(edge: .leading).combined(with: .opacity),
                   removal: .move(edge: .leading).combined(with: .opacity)
               )
    }
}

struct FlagImage: View {
    
    var flagName: String
    
    var body: some View {
        Image(flagName)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(color: .secondary ,radius: 5)
    }
}
struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var count = 0
    @State private var showingResult = false
    @State private var countries = allCountries.shuffled()
    @State private var selectedFlag = -1
    
    static let allCountries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    var body: some View{
        if showingResult {
            VStack{
//                Color.white
                Text("your Result")
                    .font(.largeTitle.bold())
                Text("\(score) / 5")
                    .font(.title.bold())
                
                Button {
                    count = 0;
                    score = 0;
                    countries = Self.allCountries
                    withAnimation {
                        showingResult.toggle()
                    }
                } label: {
                    Text("Continue")
                        .font(.subheadline.weight(.semibold))
                }
            }
            .transition(.moveAndFade)
        } else {
            
            ZStack{
    //            RadialGradient(stops: [.init(color: Color(red: 0.1, green: 0.25, blue: 0.45), location: 0.3), .init(color: Color(red: 0.7, green: 0.15, blue: 0.25), location: 0.3)], center: .top, startRadius: 200, endRadius: 700)
                VStack{
                    Spacer()
                    Spacer()
                    Text("Geuss the Flag")
                        .font(.largeTitle.bold())
                    Spacer()
                    VStack(spacing: 15){
                        VStack{
                            Text("Tap the flag of")
                                .font(.headline.weight(.bold))
                            Text(countries[correctAnswer])
                                .font(.largeTitle.weight(.semibold))
                        }
                        ForEach(0..<3) { number in
                            Button{
                                flagTapped(number)
                            } label: {
                                FlagImage(flagName: countries[number])
                                    .rotation3DEffect(Angle(degrees: selectedFlag == number ? 360 : 0), axis: (x: 0, y: 1, z: 0))
//                                    .animation(.easeInOut, value: selectedFlag)
//                                    .opacity(selectedFlag == number || selectedFlag == -1 ? 1 : 0.25)
//                                    .saturation(selectedFlag == number || selectedFlag == -1 ? 1 : 0)
                                    .blur(radius: selectedFlag == number || selectedFlag == -1 ? 0 : 3)
                                    
                            }
                        }
                        
                    }
                    Spacer()
                    Text("score : \(score)")
                        .padding(.vertical, 30)
                        .font(.title)
                    Spacer()
        //            .frame(maxWidth: .infinity)
        //            .padding(20)
        //            .background(.thinMaterial)
        //            .clipShape(RoundedRectangle(cornerRadius: 20))
                }
            }
            .alert(scoreTitle, isPresented: $showingScore) {
                Button("Continue") {
                    count += 1
                    if count == 5 {
                        withAnimation {
                            showingResult.toggle()
                        }
                    }
                    if scoreTitle == "Correct" {
                        score += 1
                    }
                    answerQuestion()
                }
            } message: {
                Text("your score is \(scoreTitle == "Correct" ? score + 1 : score)")
            }
    //        .ignoresSafeArea()
        }
    }
    
    func flagTapped(_ number: Int) -> Void{
        withAnimation(.easeInOut(duration: 5)){
            selectedFlag = number
        }
            
        if number == correctAnswer{
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
        }
        showingScore = true
    }
    
    func answerQuestion() {
        countries.remove(at: correctAnswer)
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        selectedFlag = -1
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
    }
}

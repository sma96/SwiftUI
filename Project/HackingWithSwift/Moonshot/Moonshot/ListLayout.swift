//
//  ListLayout.swift
//  Moonshot
//
//  Created by 마석우 on 2022/08/08.
//

import SwiftUI

struct ListLayout: View {
    var missions: [Mission]
    var astronauts: [String: Astronaut]
    
    let columns = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        List(missions) { mission in
            NavigationLink {
                MissionView(mission: mission, astronaut: astronauts)
            } label: {
                HStack {
                    Image(mission.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 42, height: 42)
                        .padding()
                    
                    VStack {
                        Text(mission.displayName)
                            .font(.headline)
                        
                        Text(mission.formattedLaunchDate)
                        
                    }
                }
            }
            .listRowBackground(Color.darkBackground)
        }
        .listStyle(.plain)
    }
}

struct ListLayout_Previews: PreviewProvider {
    static var astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    static var  missions: [Mission] = Bundle.main.decode("missions.json")
    static var previews: some View {
        ListLayout(missions: missions, astronauts: astronauts)
    }
}

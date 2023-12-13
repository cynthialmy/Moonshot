//
//  MissionView.swift
//  Moonshot
//
//  Created by Cynthia LI on 2023-12-05.
//

import SwiftUI

struct MissionView: View {
    let mission: Mission
    let crew: [CrewMember]
    @Binding var path: NavigationPath
    
    init(mission: Mission, astronauts: [String: Astronaut], path: Binding<NavigationPath>) {
        self.mission = mission
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
        self._path = path
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal){ width, _ in
                        width * 0.6
                    }
                    .padding(.top)
                
                Text("Launch Date: \(mission.formattedLaunchDate)")
                    .font(.title.bold())
                    .padding(.bottom, 5)
                
                RectDivider()
                
                VStack(alignment: .leading, content: {
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    
                    Text(mission.description)
                    
                    RectDivider()
                    
                    Text("Crew")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                })
                .padding(.horizontal)
                
                CrewView(crew: crew, path: $path)
            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String:Astronaut] = Bundle.main.decode("astronauts.json")
    @State var path = NavigationPath()
    
    return MissionView(mission: missions[0], astronauts: astronauts, path: $path)
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}

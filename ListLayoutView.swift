//
//  ListLayoutView.swift
//  Moonshot
//
//  Created by Cynthia LI on 2023-12-06.
//

import SwiftUI

struct ListLayoutView: View {
    let astronauts: [String:Astronaut]
    let missions: [Mission]
    
    var body: some View {
            ScrollView {
                LazyVStack {
                    ForEach(missions) { mission in
                        NavigationLink (value: mission, label: {
                            HStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .padding()
                                Spacer()
                                VStack {
                                    Text(mission.displayName)
                                        .font(.title)
                                        .foregroundStyle(.white)
                                    Text(mission.formattedLaunchDate)
                                        .font(.caption)
                                        .foregroundStyle(.white.opacity(0.5))
                                }
                            }
                            .padding(.horizontal)
                            .clipShape(.rect(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.lightBackground)
                            )
                            .frame(maxWidth: .infinity)
                            .background(.lightBackground)
                            
                        })
                    }
                    .navigationDestination(for: Mission.self) { mission in
                        MissionView(mission: mission, astronauts: astronauts)
                    }
                }
                .padding([.horizontal, .bottom])
            }
        }
    
}

#Preview {
    let astronauts: [String:Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    return ListLayoutView(astronauts: astronauts, missions: missions)
        .preferredColorScheme(.dark)
}


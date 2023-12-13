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
    @Binding var path: NavigationPath
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(missions) { mission in
                    NavigationLink {
                        MissionView(mission: mission, astronauts: astronauts, path: $path)
                    } label: {
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
                        
                    }
                }
            }
            .padding([.horizontal, .bottom])
        }
    }
}

#Preview {
    let astronauts: [String:Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    @State var path = NavigationPath()
    
    return ListLayoutView(astronauts: astronauts, missions: missions, path: $path)
        .preferredColorScheme(.dark)
}


//
//  GridLayoutView.swift
//  Moonshot
//
//  Created by Cynthia LI on 2023-12-06.
//

import SwiftUI

struct GridLayoutView: View {
    let astronauts: [String:Astronaut]
    let missions: [Mission]
    let columns = [GridItem(.adaptive(minimum: 150))]
    @Binding var path: NavigationPath
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(missions) { mission in
                    NavigationLink {
                        MissionView(mission: mission, astronauts: astronauts, path: $path)
                    } label: {
                        VStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding()
                            VStack {
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundStyle(.white)
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                                    .foregroundStyle(.white.opacity(0.5))
                            }
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(.lightBackground)
                        }
                        .clipShape(.rect(cornerRadius: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.lightBackground)
                        )
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
    
    return GridLayoutView(astronauts: astronauts, missions: missions, path: $path)
        .preferredColorScheme(.dark)
}

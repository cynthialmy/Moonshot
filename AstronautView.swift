//
//  AstronautView.swift
//  Moonshot
//
//  Created by Cynthia LI on 2023-12-05.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    @Binding var path: NavigationPath
    
    var body: some View {
        ScrollView {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()

                Text(astronaut.description)
                    .padding()
            }
        }
        .background(.darkBackground)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    @State var path = NavigationPath()

    return AstronautView(astronaut: astronauts["aldrin"]!, path: $path)
        .preferredColorScheme(.dark)
}

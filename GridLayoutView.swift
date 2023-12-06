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
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    let astronauts: [String:Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    return GridLayoutView(astronauts: astronauts, missions: missions)
}

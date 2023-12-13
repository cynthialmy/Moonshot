//
//  ContentView.swift
//  Moonshot
//
//  Created by Cynthia LI on 2023-12-04.
//

import SwiftUI

@Observable
class PathStore {
    var path: NavigationPath {
        didSet {
            save()
        }
    }
    
    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")
    
    init() {
        if let data = try? Data(contentsOf: savePath) {
            if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) {
                path = NavigationPath(decoded)
                return
            }
        }
        path = NavigationPath()
    }
    
    func save() {
        guard let representation = path.codable else {return}
        do {
            let data = try JSONEncoder().encode(representation)
            try data.write(to: savePath)
            print("Saved to navigation data.")
        } catch {
            print("Failed to save navigation data.")
        }
    }
}

struct ContentView: View {
    @State private var showingGrid = true
//    @State private var pathStore = PathStore()
    @State private var path = NavigationPath()
    
    let astronauts: [String:Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")

    var body: some View {
        NavigationStack(path: $path) {
            Group {
                if showingGrid {
                    GridLayoutView(astronauts: astronauts, missions: missions)
                } else {
                    ListLayoutView(astronauts: astronauts, missions: missions)
                }
            }
            .toolbar {
                if showingGrid {
                    Button("Show List") {
                        showingGrid = false
                    }
                } else {
                    Button("Show Grid") {
                        showingGrid = true
                    }
                }
//                Button("Home") {
//                    path = NavigationPath()
//                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  Moonshot
//
//  Created by Thomas Williams on 3/3/24.
//

import SwiftUI

struct MoonshotView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var twoColumns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var singleColumn = [
        GridItem(.adaptive(minimum: 300))
    ]

    
    @State private var toggleView = false
    
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            ScrollView {
                LazyVGrid(columns: toggleView ? singleColumn : twoColumns) {
                    ForEach(missions) { mission in
                        NavigationLink(value: mission) {
                            MissionButton(mission: mission)
                        }
                        .navigationDestination(for: Mission.self) { mission in
                            MissionView(mission: mission, astronauts: astronauts)
                        }
                    }
                    
                }
                .padding([.horizontal, .bottom])
            }
            .navigationTitle("Moonshot")
            .background(.darkBackgound)
            .preferredColorScheme(.dark)
            .toolbar {
                Button {
                    toggleView.toggle()
                } label: {
                    Image(systemName: "switch.2")
                }
                .foregroundStyle(.gray)
            }
        }
    }
    
    struct MissionButton: View {
        var mission: Mission
        
        var body: some View {
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
                    Text(mission.formatedLaunchDate)
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .background(.lightBackground)
            }
            .clipShape(.rect(cornerRadius: 10))
            .overlay (
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.lightBackground)
            )
        }
    }
}

#Preview {
    MoonshotView()
}

//
//  ContentView.swift
//  iPet
//
//  Created by Byron Mejia on 5/24/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    private let timer = Timer.publish(every: 15, on: .main, in: .common).autoconnect()
    
    var body: some View {
        Form {
            Section("Pet") {
                TextField("Name your pet!", text: $viewModel.pet.name)
                Image(viewModel.pet.happinessLevel == "Happy" ? "happy-pet" : "sad-pet")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .centerH()
                Text("Age: **\(viewModel.pet.age)** seconds")
                Text("Status: **\(viewModel.pet.happinessLevel)**")
                Text("Hunger: **\(viewModel.pet.hunger)**")
                Text("Thirst: **\(viewModel.pet.thirst)**")
                    
            }
            Section("Actions") {
                Button("Feed", action: viewModel.feed)
                Button("Give water", action: viewModel.giveWater)
            }
        }
        .onReceive(timer) {_ in
            viewModel.saveData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

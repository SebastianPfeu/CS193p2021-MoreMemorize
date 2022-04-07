//
//  ContentView.swift
//  MoreMemorize
//
//  Created by Sebastian Pfeufer on 07.04.22.
//

import SwiftUI

struct ContentView: View {
    let vehicles = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🦼", "🛴", "🚲", "🛵", "🏍", "🛺", "🚁", "🛸", "🚀", "🛶", "⛵️", "🚤", "🛥", "🛳", "⛴", "🚢", "🚜", "🚛"]
    let animals = ["🐶", "🐱", "🐭", "🐹", "🦊", "🐼", "🐯", "🦁", "🐸", "🐒", "🐥", "🦅", "🦇", "🪱", "🦄", "🐞"]
    let buildings = ["🏠", "🏭", "🏢", "🏣", "🏥", "🏨", "🏛", "⛪️", "🕌", "🛕", "🏚", "🛖"]
    @State var emojis: [String] = []

    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis, id: \.self, content: { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    })
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                vehicleTheme
                Spacer()
                animalTheme
                Spacer()
                buildingTheme
            }
            .padding(.horizontal)
        }
        .padding(.horizontal)
        .onAppear(perform: {
            emojis = vehicles
        })
    }
    
    var vehicleTheme: some View {
        Button(action: {
            emojis = vehicles.shuffled()
        }, label: {
            VStack {
                Image(systemName: "car").font(.largeTitle)
                Text("Vehicles")
            }
        })
    }
    var animalTheme: some View {
        Button(action: {
            emojis = animals.shuffled()
        }, label: {
            VStack {
                Image(systemName: "hare").font(.largeTitle)
                Text("Animals")
            }
        })
    }
    var buildingTheme: some View {
        Button(action: {
            emojis = buildings.shuffled()
        }, label: {
            VStack {
                Image(systemName: "building").font(.largeTitle)
                Text("Buildings")
            }
        })
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = true
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}









struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.light)
        ContentView().preferredColorScheme(.dark)
    }
}


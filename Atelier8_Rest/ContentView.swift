//
//  ContentView.swift
//  Atelier8_Rest
//
//  Created by CHEBIHI FAYCAL on 16/5/2023.
//

import SwiftUI

struct ContentView: View {
    init(){
        DataService.shared.fetchGists{(result) in
            switch result {
            case .success(let json): print(json)
            case .failure(let error): print(error)
            }
        }
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

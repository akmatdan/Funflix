//
//  ContentView.swift
//  Funflix
//
//  Created by Daniil Akmatov on 23/4/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showSettings = false
    
    var body: some View {
        NavigationView {
            Group{
                HomeTabView()
            }
            .navigationBarTitle("Movies", displayMode: .automatic)
            .navigationBarItems(trailing: HStack{
                settingButton
            })
            .sheet(isPresented: $showSettings, content: {
                Text("Setting View")
            })
        }
    }
    
    private var settingButton: some View {
        Button(action: {
            showSettings.toggle()
        }, label: {
            VStack {
                Image(systemName: "gear")
                    .imageScale(.large)
                    .foregroundColor(.gray)
            }
            .frame(width: 30, height: 30)
        })
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}

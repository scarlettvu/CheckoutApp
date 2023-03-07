//
//  ContentView.swift
//  CheckoutApp
//
//  Created by Scarlett  on 3/6/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Group {
                    ListItem(item: "Item 1", price: "10")
                    ListItem(item: "Item 2", price: "20")
                    ListItem(item: "Item 3", price: "30")
                }
                Section {
                    ActionItem()
                }
                Section {
                    PickerItem()
                }
                Section {
                    ConfirmItem()
                }
            }
            .listStyle(.grouped)
            .navigationTitle("Checkout App")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}

struct ListItem: View {
    
    var icon : String = "globe"
    var item : String
    var price : String
    
    var body: some View {
        HStack {
            Image(systemName: "globe")
                .imageScale(.large)
            Text(item)
            Spacer()
            Text("$ \(price)")
        }
        .padding()
        .foregroundColor(.accentColor)
    }
}

struct ActionItem: View {
    
    @State var counter = 0
    
    var body: some View {
        HStack {
            Text("\(counter)")
            Spacer()
            Image(systemName: "plus")
                .imageScale(.large)
                .onTapGesture {
                    counter += 1
                }
        }
        .padding()
        .foregroundColor(.accentColor)
    }
}

struct PickerItem: View {
    
    @State var flag = false
    @State var tip = 0
    let tipAmount = [0, 10, 20, 30]
    
    var body: some View {
        VStack {
            Toggle("Add a tip?", isOn: $flag.animation())
            if flag {
                Picker("Percent", selection: $tip) {
                    ForEach(tipAmount, id: \.self) { tip in
                        Text(String(tip))
                    }
                }.pickerStyle(.segmented)
            }
        }
        .padding()
        .foregroundColor(.accentColor)
    }
}

struct ConfirmItem: View {
    
    @State var present = false
    
    var body: some View {
        VStack {
            Button("Confirm Order") {
                present.toggle()
            }
        }
        .sheet(isPresented: $present) {
            SecondView(present: $present)
        }
    }
}

struct SecondView: View {
        
    @Binding var present: Bool
    
    var body: some View {
        VStack {
            Text("New View")
            Button("Dismiss") {
                present.toggle()
            }
            
        }
    }
}


//
//  ContentView.swift
//  FoodForThought
//
//  Created by Ted Xiong on 1/21/24.
//

import SwiftUI

struct MainPage: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Text("First Tab Content")
                .tabItem {
                    Image(systemName: "list.clipboard.fill")
                    Text("Shopping List")
                }
                .tag(0)
            
            FoodItemPage()
                .tabItem {
                    Image(systemName: "carrot.fill")
                    Text("Inventory")
                }
                .tag(1)
            
            Text("Third Tab Content")
                .tabItem {
                    Image(systemName: "book.pages.fill")
                    Text("Recipes")
                }
                .tag(2)
        }
    }
}


#Preview {
    MainPage()
}



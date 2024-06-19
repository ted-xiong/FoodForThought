//
//  SwiftUIView.swift
//  FoodForThought
//
//  Created by Ted Xiong on 4/29/24.
//

import SwiftUI

struct PopupView: View {
    @Binding var isSheetPresented: Bool
    @Binding var newFoodItemName: String
    @Binding var newFoodItemShelfLife: String
    @Binding var foodItems: [FoodItem]
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    self.isSheetPresented = false
                }
            
            VStack {
                VStack {
                    TextField("Name", text: $newFoodItemName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    TextField("Shelf Life", text: $newFoodItemShelfLife)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    Button("Done") {
                                    let newItem = FoodItem(id: UUID(), name: newFoodItemName, shelfLife: newFoodItemShelfLife)
                                    foodItems.append(newItem)
                                    isSheetPresented = false
                                    newFoodItemName = ""
                                    newFoodItemShelfLife = ""
                                }
                    .padding()
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .padding()
                .onTapGesture {
                    // Prevent dismissing the popup when tapping inside it
                }
            }
        }
    }
}

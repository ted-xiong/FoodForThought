////
////  foodItemPage.swift
////  FoodForThought
////
////  Created by Ted Xiong on 4/29/24.
////
//
import SwiftUI
//
//struct foodItemPage: View {
//    @State private var isPopupPresented = false
//    @State private var newFoodItemName = ""
//    @State private var newFoodItemShelfLife = ""
//    @State static var foodItems: [FoodItem] = [
//        FoodItem(id: UUID(), name: "Apple", shelfLife: "2 weeks"),
//        FoodItem(id: UUID(), name: "Banana", shelfLife: "1 week"),
//        FoodItem(id: UUID(), name: "Orange", shelfLife: "10 days")
//        // Add more food items as needed
//    ]
//    
//    var body: some View {
//            ZStack {
//                ScrollView {
//                    VStack(spacing: 20) {
//                        ForEach(foodItemPage.foodItems, id: \.name) { foodItem in
//                            RoundedRectangle(cornerRadius: 10)
//                                .fill(Color.gray.opacity(0.2))
//                                .frame(height: 100)
//                                .overlay(
//                                    HStack {
//                                        Text(foodItem.name)
//                                            .font(.title)
//                                            .foregroundColor(.black)
//                                            .frame(maxWidth: .infinity, alignment: .leading)
//                                            .padding(.leading, 10)
//                                        Spacer()
//                                        Text(foodItem.shelfLife)
//                                            .font(.subheadline)
//                                            .foregroundColor(.black)
//                                            .frame(maxWidth: .infinity, alignment: .leading)
//                                            .padding(.leading, 10)
//                                    }
//                                )
//                                .padding(.horizontal, 20)
//                        }
//                    }
//                    .padding(.vertical, 20)
//                    
//                    Button(action: {
//                        self.isPopupPresented.toggle()
//                    }) {
//                        Image(systemName: "plus.circle.fill")
//                            .resizable()
//                            .frame(width: 50, height: 50)
//                            .foregroundColor(.green)
//                            .padding()
//                    }
//                }
//                .padding(.horizontal, 10)
//                
//                if isPopupPresented {
//                    ZStack {
//                        Color.black.opacity(0.5)
//                            .edgesIgnoringSafeArea(.all)
//                            .onTapGesture {
//                                self.isPopupPresented = false
//                            }
//                        
//                            VStack {
//                                TextField("Name", text: $newFoodItemName)
//                                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                                    .padding()
//                                TextField("Shelf Life", text: $newFoodItemShelfLife)
//                                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                                    .padding()
//                                Button("Done") {
//                                    foodItemPage.foodItems.append(FoodItem(id: UUID(), name: self.newFoodItemName, shelfLife: self.newFoodItemShelfLife))
//                                    self.isPopupPresented.toggle()
//                                }
//                                .padding()
//                            }
//                            .padding()
//                            .background(Color.white)
//                            .cornerRadius(10)
//                            .padding()
//                        
//                    }
//                }
//            }
//        }
//}

struct FoodItemPage: View {
    @State private var isSheetPresented = false
    @State private var newFoodItemName = ""
    @State private var newFoodItemShelfLife = ""
    @State private var foodItems: [FoodItem] = [
        FoodItem(id: UUID(), name: "Apple", shelfLife: "2 weeks"),
        FoodItem(id: UUID(), name: "Banana", shelfLife: "1 week"),
        FoodItem(id: UUID(), name: "Orange", shelfLife: "10 days")
        // Add more food items as needed
    ]
    
    var body: some View {
        ZStack {
            FoodItemScrollView(isSheetPresented: $isSheetPresented, foodItems: $foodItems)
        }
        .sheet(isPresented: $isSheetPresented) {
            PopupView(isSheetPresented: $isSheetPresented, newFoodItemName: $newFoodItemName, newFoodItemShelfLife: $newFoodItemShelfLife, foodItems: $foodItems)
        }
    }
}

struct FoodItemScrollView: View {
    @Binding var isSheetPresented: Bool
    @Binding var foodItems: [FoodItem]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(foodItems, id: \.id) { foodItem in
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 100)
                        .overlay(
                            HStack {
                                // You can add an image here if you have one for each food item
                                Image(systemName: "takeoutbag.and.cup.and.straw.fill")
                                    .padding(.leading, 20)
                                    .scaledToFill()
                                VStack {
                                    Text(foodItem.name)
                                        .font(.title)
                                        .foregroundColor(.black)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading, 10)
                                        .bold()
                                    Text(foodItem.shelfLife)
                                        .font(.title3)
                                        .foregroundColor(.black)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading, 10)
                                }
                                Spacer()
                            }
                        )
                        .padding(.horizontal, 20)
                }
                
                AddButton(isPopupPresented: $isSheetPresented)
            }
            .padding(.vertical, 20)
        }
        .padding(.horizontal, 10)
    }
}

struct AddButton: View {
    @Binding var isPopupPresented: Bool
    
    var body: some View {
        Button(action: {
            withAnimation {
                self.isPopupPresented.toggle()
            }
        }) {
            Image(systemName: "plus.circle.fill")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(.green)
                .padding()
        }
    }
}


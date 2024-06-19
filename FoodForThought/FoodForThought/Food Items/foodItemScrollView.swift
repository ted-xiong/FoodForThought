//
//  foodItemScrollView.swift
//  FoodForThought
//
//  Created by Ted Xiong on 4/29/24.
//

import SwiftUI

struct foodItemScrollView: View {
    @Binding var isPopupPresented: Bool
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
                    
//                    addButton(isPopupPresented: $isPopupPresented)
                    Button(action: {
                        isPopupPresented.toggle()
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.green)
                            .padding()
                    }
                }
                .padding(.vertical, 20)
        }
        .padding(.horizontal, 10)
    }
}

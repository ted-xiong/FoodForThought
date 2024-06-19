//
//  addButton.swift
//  FoodForThought
//
//  Created by Ted Xiong on 4/29/24.
//

import SwiftUI

struct addButton: View {
    @Binding var isPopupPresented: Bool
    
    var body: some View {
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
}

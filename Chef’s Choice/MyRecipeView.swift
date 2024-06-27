//
//  MyRecipeView.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 25.06.2024.
//

import SwiftUI

struct MyRecipeView: View {
    @State private var isShowingAddRecipeView = false
    
    var body: some View {
        NavigationStack {
            List {
                Text("1")
                Text("2")
                Text("4")
                
            }
            .navigationTitle("My Recipe")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        isShowingAddRecipeView.toggle()
                    }){
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isShowingAddRecipeView) {
                AddRecipesView()
                    .presentationDetents([.large, .large])
                
            }
            
        }
        
    }
}

#Preview {
    MyRecipeView()
}

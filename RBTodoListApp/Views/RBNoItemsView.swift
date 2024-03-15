//
//  NoItemsView.swift
//  RBTodoListApp
//
//  Created by Run on 2024/3/15.
//

import SwiftUI

struct RBNoItemsView: View {
    @State var animated: Bool = false
    var body: some View {
        ScrollView {
            VStack {
                Text("No items")
                    .foregroundStyle(.black.opacity(0.8))
                Text("Please add items")
                    .font(.title2)
                NavigationLink(destination: RBAddItemView()) {
                    Text("Add a item")
                        .foregroundStyle(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animated ? Color.blue : Color.red)
                        .cornerRadius(10)
                        .padding(.horizontal, animated ? 50 : 30)
                }
            }
            .padding(.top, 80)
            .onAppear(perform: animation)
        }
    }
    func animation() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
            withAnimation(Animation.easeInOut(duration: 1).repeatForever()) {
                animated.toggle()
            }
        }
    }
}

#Preview {
    RBNoItemsView()
}

//
//  RBAddItemView.swift
//  RBTodoListApp
//
//  Created by Run on 2024/3/15.
//

import SwiftUI

struct RBAddItemView: View {
    @EnvironmentObject var viewModel: RBTodoListViewModel
    @State var text: String = ""
    
    @Environment(\.dismiss) var dismiss
    
    @State var isAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("type here to add item", text: $text)
                    .padding()
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.4))
                    .cornerRadius(10)
                Button(action: addItem, label: {
                    Text("SAVE")
                        .foregroundStyle(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .cornerRadius(10)
                })
                
            }
            .padding(.horizontal, 20)
        }
        .navigationTitle("Add Item")
        .alert(isPresented: $isAlert, content: {
            Alert(title: Text("You must input more than 3 words."))
        })
    }
    
    func passValidation() -> Bool {
        guard text.count > 3 else {
            isAlert = true
            return false
        }
        isAlert = false
        return true
    }
    
    func addItem() {
        if  passValidation() {
            viewModel.addItem(item: TodoItem(title: text))
            dismiss()
        }
    }
}

#Preview {
    NavigationStack {
        RBAddItemView()
    }
}

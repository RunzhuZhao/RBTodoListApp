//
//  RBTodoListAppApp.swift
//  RBTodoListApp
//
//  Created by Run on 2024/3/15.
//

import SwiftUI

@main
struct RBTodoListAppApp: App {
    @StateObject var viewModel: RBTodoListViewModel = RBTodoListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                RBTodoListView()
            }
            .environmentObject(viewModel)
        }
    }
}

//
//  BookListsView.swift
//  Books
//
//  Created by Laurynas Letkauskas on 09/11/2023.
//

import SwiftUI
import NavigationBackport

struct BookListsView<ViewModel: BookListsViewModelInterface>: View {
    
    @ObservedObject private var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List {
            
        }
    }
}

#Preview {
    BookListsView(viewModel: SampleBookListsViewModel())
}

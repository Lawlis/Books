import Foundation
import SwiftUI
import NavigationBackport

struct BookListRow<ViewModel: BookListRowViewModelInterface>: View {
    
    private var viewModel: ViewModel
    private var onAllTapped: (() -> Void)
    
    init(viewModel: ViewModel,
         onAllTapped: @escaping () -> Void) {
        self.viewModel = viewModel
        self.onAllTapped = onAllTapped
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(viewModel.title)
                    .font(.title)
                Spacer()
                Button("All") {
                    onAllTapped()
                }
            }
            .padding()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(viewModel.previewBooks) { book in
                        NBNavigationLink(value: book) {
                            BookPreviewItemView(viewModel: book)
                                .listRowSeparator(.hidden)
                        }
                    }
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 8)
                .strokeBorder(.ultraThickMaterial, lineWidth: 4)
        )

    }
}

#Preview {
    BookListRow(viewModel: SampleBookListRowViewModel(), onAllTapped: {})
        .padding()
}

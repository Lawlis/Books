import SwiftUI
import NavigationBackport

struct BookDetailsView<ViewModel: BookDetailsViewModelInterface>: View {
    
    @State var viewModel: ViewModel
    
    var body: some View {
        switch viewModel.state {
        case .idle:
            ProgressView()
                .task {
                    await viewModel.fetchBookDetails()
                }
        case .loading:
            ProgressView()
        case .loaded(let details):
            bookDetailView(from: details)
        case .error:
            ErrorView(explanationText: "Something went wrong") {
                Task {
                    await viewModel.fetchBookDetails()
                }
            }
        }
    }
    
    @ViewBuilder
    private func bookDetailView(from detail: BookDetailItem) -> some View {
        ScrollView {
            VStack(alignment: .leading) {
                PhasedAsyncImage(widthHeightDimension: 300, url: detail.img)
                Text(detail.title)
                    .font(.headline)
                Text(detail.author)
                    .font(.subheadline)
                Text(detail.isbn)
                    .font(.subheadline)
                Text(detail.publicationDate, style: .date)
                    .font(.subheadline)
                VStack(alignment: .leading) {
                    Text(detail.description)
                        .font(.body)
                }
                .padding(.top, 16)
            }
            .padding()
            .navigationTitle("Book")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Refresh") {
                        Task {
                            await viewModel.fetchBookDetails()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    BookDetailsView(viewModel: SampleBookDetailsViewModel())
}

import Foundation
import SwiftUI

struct BookPreviewItemView: View {
    
    private let viewModel: BookPreviewItemViewModel
    
    init(viewModel: BookPreviewItemViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            PhasedAsyncImage(widthHeightDimension: 150, url: viewModel.imageUrl)
            Text(viewModel.title)
                .lineLimit(nil)
        }
        .frame(maxWidth: 150)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .strokeBorder(.thickMaterial, lineWidth: 4)
        )
    }
}

#Preview {
    BookPreviewItemView(viewModel: SampleBookPreviewItemViewModel())
}

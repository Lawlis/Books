import SwiftUI

struct PhasedAsyncImage: View {
    
    let widthHeightDimension: CGFloat
    let url: URL
    
    var body: some View {
        AsyncImage(url: url) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .frame(maxWidth: widthHeightDimension, maxHeight: widthHeightDimension)
            } else if phase.error != nil {
                Image(systemName: "exclamationmark.icloud.fill")
            } else {
                ProgressView()
                    .frame(width: widthHeightDimension, height: widthHeightDimension)
            }
        }
    }
}

#Preview {
    PhasedAsyncImage(widthHeightDimension: 300, url: URL(string: "https://covers.openlibrary.org/b/id/11464688-L.jpg")!)
}

import SwiftUI

struct ErrorView: View {
    
    let explanationText: String
    let fallbackAction: (() -> Void)
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: "exclamationmark.triangle")
            Text(explanationText)
                .font(.callout)
            Button("Try again") {
                fallbackAction()
            }
        }
    }
}

#Preview {
    ErrorView(explanationText: "Something went wrong", fallbackAction: {
        
    })
}

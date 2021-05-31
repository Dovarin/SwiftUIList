import SwiftUI
import Combine
struct CheckButton: View {
    @State var isSet: Bool
    var body: some View {
        Button(action: {
            isSet.toggle()
        }) {
            Image(systemName: isSet ? "checkmark.circle" : "checkmark.circle.fill")
                .foregroundColor(.yellow)
        }
    }
}

struct CheckButton_Previews: PreviewProvider {
    static var previews: some View {
        CheckButton(isSet: false)
    }
}

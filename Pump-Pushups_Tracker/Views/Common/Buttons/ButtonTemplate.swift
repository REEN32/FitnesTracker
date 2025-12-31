struct ButtonTemplate: View {
    let text: String
    let backgroundColor: Color
    let borderColor: Color = Color.borderColor
    let lineWidth: CGFloat = 3
    let foregroundColor: Color
    let foregroungSize: CGFloat
    let cornerRadius: CGFloat = 12
    let paddingH: CGFloat
    let paddingV: CGFloat
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .foregroundStyle(foregroundColor)
                .font(.system(size: foregroungSize))
                .padding(.vertical, paddingV)
                .padding(.horizontal, paddingH)
        }
        .background(
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(backgroundColor)
        )
        .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(borderColor, lineWidth: lineWidth)
        )
    }
}

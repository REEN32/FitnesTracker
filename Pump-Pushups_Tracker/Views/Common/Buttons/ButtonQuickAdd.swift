struct ButtonQuickAdd : View {
    let text: String
    let backgroundColor: Color
    let textColor: Color
    let width: CGFloat
    let height: CGFloat
    let action: () -> Void
    
    init(text: String, backgroundColor: Color = Color.clear, textColor: Color = Color.gray, width: CGFloat = 20, height: CGFloat = 20, action: @escaping () -> Void) {
        self.text = text
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.width = width
        self.height = height
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .font(.system(size: 18, weight: .semibold))
                .foregroundStyle(textColor)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(.horizontal, 10)
                .padding(.vertical, 8)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(backgroundColor)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.borderColor, lineWidth: 3)
                )
        }
        .frame(width: width, height: height)
    }
}

struct MainBorder: ViewModifier {
    let color: Color
    let radius: CGFloat
    let lineWidth: CGFloat
    
    func body(content: Content) -> some View {
        content.overlay(
            RoundedRectangle(cornerRadius: radius)
                .stroke(color, lineWidth: lineWidth)
        )
        .padding(8)
    }
}

struct MainBorder: ViewModifier {
    let color: Color
    let radius: CGFloat
    let lineWidth: CGFloat
    let paddingH: CGFloat
    let paddingV: CGFloat
    
    func body(content: Content) -> some View {
        content.overlay(
            RoundedRectangle(cornerRadius: radius)
                .stroke(color, lineWidth: lineWidth)
        )
        .padding(.horizontal, paddingH)
        .padding(.vertical, paddingV)
    }
}

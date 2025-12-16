extension View {
    func mainBorder(color: Color = .borderColor, lineWidth: CGFloat = 3, cornerRadius: CGFloat = 12) -> some View {
        modifier(
            MainBorder(
                color: color,
                radius: cornerRadius,
                lineWidth: lineWidth
            )
        )
    }
}

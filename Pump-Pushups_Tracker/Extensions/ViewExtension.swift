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
    
    
    func mainTextStyle(color: Color = Color.selectedPurpleColor, size: CGFloat = 20, weight: Font.Weight = .bold) -> some View {
        modifier(
            MainTextStyle(color: color, size: size, weight: weight)
        )
    }
}

extension View {
    func mainBorder(color: Color = .borderColor, lineWidth: CGFloat = 3, cornerRadius: CGFloat = 12, paddingH: CGFloat = 8, paddingV: CGFloat = 3) -> some View {
        modifier(
            MainBorder(
                color: color,
                radius: cornerRadius,
                lineWidth: lineWidth,
                paddingH: paddingH,
                paddingV: paddingV,
            )
        )
    }
    
    
    func mainTextStyle(color: Color = Color.selectedPurpleColor, size: CGFloat = 20, weight: Font.Weight = .bold) -> some View {
        modifier(
            MainTextStyle(color: color, size: size, weight: weight)
        )
    }
}

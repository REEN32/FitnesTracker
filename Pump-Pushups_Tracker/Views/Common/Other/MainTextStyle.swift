struct MainTextStyle: ViewModifier {
    let color: Color
    let size: CGFloat
    let weight: Font.Weight
    
    func body(content: Content) -> some View {
        content
            .font(Font.system(size: size, weight: weight))
            .foregroundStyle(color)
    }
   
}

struct ButtonAchivement : View {
    let text: String
    let backgroundColor: Color
    let textColor: Color
    let width: CGFloat
    let height: CGFloat
    let progress: Int
    let maxValue: Int
    let action: () -> Void
    
    init(text: String, backgroundColor: Color = Color.clear, textColor: Color = Color.selectedPurpleColor, width: CGFloat, height: CGFloat, progress: Int, maxValue: Int, action: @escaping () -> Void) {
        self.text = text
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.width = width
        self.height = height
        self.progress = progress
        self.maxValue = maxValue
        self.action = action
    }
    
    var body : some View {
        Button(action: action) {
            ZStack {
                AchivementProgressBar(progress: progress,
                                      maxValue: maxValue,
                                      color: backgroundColor,
                                      width: width,
                                      height: height)
                
                Text(text)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(textColor)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    .padding(.horizontal, width * 0.1)
            }
            
        }
        .frame(width: width, height: height)
    }
}

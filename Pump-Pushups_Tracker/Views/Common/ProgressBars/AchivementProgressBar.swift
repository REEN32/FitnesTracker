struct AchivementProgressBar: View {
    let progress: Int
    let maxValue: Int
    let color: Color
    let width: CGFloat
    let height: CGFloat
    
    var progressPercent: CGFloat {
        CGFloat(progress) / CGFloat(maxValue)
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .fill(color.opacity(0.3))
                .frame(width: width, height: height)
                .cornerRadius(height / 2)
            Rectangle()
                .fill(color)
                .frame(width: width * progressPercent, height: height)
                .cornerRadius(width * progressPercent / 2)
                .animation(.easeInOut(duration: 0.5), value: progress)
        }
        .frame(width: width, height: height)
        .cornerRadius(height / 2)
    }
}

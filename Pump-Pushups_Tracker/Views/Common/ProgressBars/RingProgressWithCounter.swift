struct RingProgressWithCounter: View {
    let progress: Int
    let maxValue: Int
    let color: Color
    let lineWidth: CGFloat
    let width: CGFloat
    let height: CGFloat
    let fontSize: CGFloat
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    color.opacity(0.3),
                    lineWidth: lineWidth
                )
                .frame(width: width, height: height)
            
            Circle()
                .trim(from: 0, to: normalizedProgress())
                .stroke(
                    color,
                    style: StrokeStyle(
                        lineWidth: lineWidth,
                        lineCap: .round
                    )
                    
                )
                .rotationEffect(.degrees(-90))
                .animation(.easeInOut(duration: 0.5), value: progress)
                .frame(width: width, height: height)
            
            Text("\(progress)/\(maxValue)")
                .font(.system(size: fontSize, weight: .bold))
                .foregroundStyle(color)
        }
    }
    
    func normalizedProgress() -> CGFloat {
        CGFloat(progress) / CGFloat(maxValue)
    }
}

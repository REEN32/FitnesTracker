struct RingProgressWithCounter: View {
    let progress: Int
    let maxValue: Int
    let color: Color
    let lineWidth: CGFloat
    
    func normalizedProgress() -> CGFloat {
        CGFloat(progress) / CGFloat(maxValue)
    }
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    color.opacity(0.3),
                    lineWidth: lineWidth
                )
                .frame(width: 150, height: 150)
            
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
                .frame(width: 150, height: 150)
            
            Text("\(progress)/\(maxValue)")
                .font(.system(size: 28, weight: .bold))
                .foregroundStyle(color)
        }
    }
}

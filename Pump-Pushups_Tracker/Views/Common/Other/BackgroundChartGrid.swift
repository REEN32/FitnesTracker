struct BackgroundChartGrid: View {
    let maxWidth: CGFloat
    let maxHeight: CGFloat
    let data: [Int]
    
    var body: some View {
        ZStack {
            VStack(spacing: maxHeight / 6) {
                ForEach(0..<6, id:\.self) { index in
                    HStack {
                        Rectangle()
                            .frame(height: 0.5)
                            .foregroundStyle(Color.gray.opacity(0.3))
                        Text(String(data[index]))
                            .frame(minWidth: 25, maxHeight: 0)
                            .font(.system(size: 10))
                    }
                }
            }
            .frame(height: maxHeight)
        }
        .frame(width: maxWidth * 1)
    }
}

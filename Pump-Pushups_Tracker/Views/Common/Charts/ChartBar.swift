struct ChartBar: View {
    let data: [(barName: String, barValue: Int)]
    let maxWidth: CGFloat
    let maxHeight: CGFloat
    let barWidth: CGFloat
    var barSpacing: CGFloat {
        (maxWidth - (barWidth * CGFloat(data.count))) / CGFloat(data.count)
    }
    let color: Color
    let fontSize: CGFloat
    let fontColor: Color
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            BackgroundChartGrid(maxWidth: maxWidth * 1.09, maxHeight: maxHeight, data: [500, 400, 300, 200, 1000, 0])
                    .padding(.vertical, fontSize * 0.25)
                
                HStack(alignment: .bottom, spacing: barSpacing) {
                    ForEach(data, id: \.barName) { item in
                        VStack {
                            Rectangle()
                                .frame(maxWidth: barWidth, maxHeight: CGFloat(CGFloat(item.barValue) / 500 * (maxHeight * 0.82)))
                            // !!!!! 500 magic number (max value data)
                                .cornerRadius(barWidth / 6)
                                .foregroundStyle(color)
                            Text(item.barName)
                                .font(.system(size: fontSize))
                                .foregroundColor(fontColor)
                        }
                    }
                }
        }
    }
}

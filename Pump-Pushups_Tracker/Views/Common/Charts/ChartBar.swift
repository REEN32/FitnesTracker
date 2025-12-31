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
        ZStack(alignment: .bottom) {
            Divider()
            
            HStack(alignment: .bottom, spacing: barSpacing) {
                ForEach(data, id: \.barName) { item in
                    VStack {
                        Rectangle()
                            .frame(maxWidth: barWidth, maxHeight: CGFloat(item.barValue))
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

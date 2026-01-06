struct StatsView: View {
    let stats: [(String,Int)] = [("Mon",250),("Tue",100),("Wed",40),("Thu",300),("Fri",100),("Sat",70),("Sun",500)]
    
    var body: some View {
        ZStack {
            Color.mainBackground
                .ignoresSafeArea(edges: .all)
            GeometryReader { proxy in
                let paddingH = proxy.size.width * 0.02
                let paddingV = proxy.size.height * 0.0038
                
                VStack {
                    VStack(alignment: .trailing) {
                        Spacer()
                        HStack() {
                            ChartBar(data: stats, maxWidth: proxy.size.width * 0.8, maxHeight: proxy.size.height * 0.25, barWidth: 35, color: Color.blue, fontSize: proxy.size.width * 0.03, fontColor: Color.selectedPurple.opacity(0.7))
                        }
                    }
                    .padding(15)
                    .frame(maxWidth: proxy.size.width, maxHeight: proxy.size.height * 0.3)
                    .mainBorder(paddingH: paddingH, paddingV: paddingV)
                }
            }
        }
    }
}

struct StatsView: View {
    let stats: [(String,Int)] = [("Mon",20),("Tue",30),("Wed",40),("Thu",50),("Fri",60),("Sat",70),("Sun",80)]
    
    var body: some View {
        ZStack {
            Color.mainBackground
                .ignoresSafeArea(edges: .all)
            GeometryReader { proxy in
                let paddingH = proxy.size.width * 0.02
                let paddingV = proxy.size.height * 0.0038
                
                VStack {
                    VStack {
                        Spacer()
                        ChartBar(data: stats, maxWidth: proxy.size.width, maxHeight: 300, barWidth: 35, color: Color.blue, fontSize: 15, fontColor: Color.selectedPurple.opacity(0.7))
                    }
                    .padding(15)
                    .frame(maxWidth: proxy.size.width, maxHeight: proxy.size.height * 0.3)
                    .mainBorder(paddingH: paddingH, paddingV: paddingV)
                }
            }
        }
    }
}

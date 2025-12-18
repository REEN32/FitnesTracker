struct AddModalWindow : View {
    @Binding var showWindow: Bool
    @Binding var count: String
    @Binding var progressValue: Int
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .ignoresSafeArea()
                .onTapGesture {
                    closeWindow()
                }
            
            GeometryReader { mainProxy in
                let multiplyerHeight = 0.16
                let multiplyerWidth = 0.9
                let mainHeight = mainProxy.size.height
                let mainWidth = mainProxy.size.width
                let windowHeight = mainHeight * multiplyerHeight
                let windiwWidth = mainWidth * multiplyerWidth
                
                VStack {
                    HStack {
                        Text("Enter count of pushups")
                            .mainTextStyle()
                            .padding(.top, 8)
                            .padding(.leading, 20)
                        Spacer()
                    }
                    HStack(alignment: .center, spacing: 8) {
                        TextField("Count of push-ups", text: $count)
                            .keyboardType(.numberPad)
                            .frame(width: windiwWidth * 0.56, height: windowHeight * 0.14)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 8)
                            .mainBorder(color: Color.borderColor)
                        ButtonQuickAdd(text: "Enter",
                                       backgroundColor: Color.selectedPurpleColor,
                                       textColor: Color.mainBackground,
                                       width: windiwWidth * 0.26,
                                       height: windowHeight * 0.14) {
                            closeWindow()
                        }
                    }
                }
                .frame(width: mainWidth * multiplyerWidth, height: mainHeight * multiplyerHeight)
                .background(Color.mainBackground)
                .cornerRadius(20)
                .shadow(radius: 20)
                .position(x: mainWidth / 2, y: mainHeight / 2)
            }
        }
        .ignoresSafeArea(.keyboard)
    }
    
    private func closeWindow() {
        if !count.isEmpty {
            AddCountFormatter.addCount(to: &progressValue, what: count)
        }
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            window.endEditing(true)
        }
        
        withAnimation(.spring(duration: 1)) {
            showWindow = false
            count = ""
        }
    }
}


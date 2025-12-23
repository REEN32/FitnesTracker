struct SetModalWindow : View {
    @Binding var showWindow: Bool
    @Binding var value: Int
    @Binding var showScreen: Bool
    
    @State var count: String = ""
    @State var showError: Bool = false
    
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
                            if enterSuccessfully() {
                                value = Int(count)!
                                closeWindow()
                                showScreen = false
                            }
                            else {
                                showError = true
                            }
                        }
                                       .alert("Error: Еhe maximum allowed input is 9999", isPresented: $showError) { }
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
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            window.endEditing(true)
        }
        
        withAnimation(.spring(duration: 1)) {
            showWindow = false
            count = ""
        }
    }
    
    private func enterSuccessfully() -> Bool {
        guard !count.isEmpty else { return false }
        guard let _ = Int(count) else { return false }
        guard Int(count)! <= 9999 else { return false }
        return true
    }
}


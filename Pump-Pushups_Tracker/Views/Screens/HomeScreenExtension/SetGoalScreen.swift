struct SetGoalScreen : View {
    @Binding var showScreen: Bool
    @Binding var maxProgress: Int
    
    @State var selectedGoal: Int = 0
    @State var showCustomAddWindow: Bool = false
    
    let goal = (1...9999).filter { $0 % 5 == 0 || $0 == 9999}
    
    
    var body: some View {
        ZStack {
            Color.mainBackground
                .ignoresSafeArea()
            GeometryReader { proxy in
                VStack {
                    Spacer()
                    HStack {
                        Text("–")
                            .font(.system(size: 30, weight: .semibold))
                            .foregroundStyle(Color.selectedPurpleColor)
                        Picker("Goal", selection: $selectedGoal) {
                            ForEach(goal, id:\.self) { g in
                                Text("\(g)")
                                    .font(.system(size: 30, weight: .semibold))
                                    .foregroundStyle(Color.selectedPurpleColor)
                            }
                        }
                        .pickerStyle(.wheel)
                        Text("–")
                            .font(.system(size: 30, weight: .semibold))
                            .foregroundStyle(Color.selectedPurpleColor)
                    }
                    .frame(width: proxy.size.width * 0.5, height: proxy.size.height * 0.7)
                    VStack(spacing: 18) {
                        ButtonSetGoal(text: "Save Goal", backgroundColor: Color.selectedPurpleColor, textColor: Color.mainBackground, width: .infinity, height: proxy.size.height * 0.07) {
                            maxProgress = selectedGoal
                            showScreen = false
                        }
                        .padding(.horizontal, 8)
                        ButtonSetGoal(text: "Custom goal", width: .infinity, height: proxy.size.height * 0.07) {
                            showCustomAddWindow = true
                        }
                        .padding(.horizontal, 8)
                        ButtonSetGoal(text: "Cancel", width: .infinity, height: proxy.size.height * 0.07) {
                            showScreen = false
                        }
                        .padding(.horizontal, 8)
                        Text("You can change this anytime.")
                            .foregroundStyle(Color.selectedPurpleColor.opacity(0.4))
                    }
                }
                .navigationTitle("Set Your Daily Goal")
            }
            
            if showCustomAddWindow {
                SetModalWindow(showWindow: $showCustomAddWindow, value: $maxProgress, showScreen: $showScreen)
            }
            
        }
    }
}

//#Preview {
//    SetGoalView()
//}

struct HomeView: View {
    var body: some View {
        ZStack {
            Color.mainBackground
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {    // первый (верхний) блок
                    VStack {
                        Text("Daily Push-Ups")
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    VStack {
                        Text("Тут будет график")
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                }
                .padding(15)
                .mainBorder()
                Spacer()
            }
        }
    }
}

#Preview {
    HomeView()
}

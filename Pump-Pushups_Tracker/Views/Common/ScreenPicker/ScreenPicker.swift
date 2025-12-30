struct ScreenPickerView: View {
    let items: [NavigationItem]
    let width: CGFloat
    let height: CGFloat
    let backgroundColor: Color
    let textColor: Color
    
    @Binding var selectedItem: NavigationItem?
    
    init(selected: Binding<NavigationItem?>, item: [NavigationItem], width: CGFloat = .infinity, height: CGFloat = .infinity, backgroundColor: Color = Color.black.opacity(0.05), textColor: Color = Color.selectedPurpleColor) {
        self.items = item
        self._selectedItem = selected
        self.width = width
        self.height = height
        self.backgroundColor = backgroundColor
        self.textColor = textColor
    }
    
    var body: some View {
        HStack {
            ForEach(items, id:\.self) { item in
                Button(action: {
                    guard selectedItem != item else { return }
                    withAnimation(.spring(response: 0.3)) {
                        selectedItem = item
                    }
                }) {
                    VStack {
                        GridRow {
                            Image(systemName: item.icon)
                                .font(.system(size: height * 0.35))
                                .frame(height: height * 0.4)
                                .foregroundStyle(textColor)
                        }
                        GridRow {
                            Text(item.title)
                                .font(.system(size: height * 0.27))
                                .foregroundStyle(textColor)
                        }
                    }
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: height / 2.5)
                        .fill(selectedItem == item ? Color.selectedPurpleColor.opacity(0.1) : Color.clear)
                        .frame(width: width * 0.9 / CGFloat(items.count), height: height)
                )
            }
        }
        .frame(maxWidth: width, maxHeight: height)
        .padding(.vertical, 5)
        .background(
            RoundedRectangle(cornerRadius: height / 2)
                .fill(backgroundColor)
                .stroke(Color.borderColor, style: StrokeStyle(lineWidth: 3))
            
        )
    }
}

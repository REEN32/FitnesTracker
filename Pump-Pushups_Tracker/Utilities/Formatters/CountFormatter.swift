class CountFormatter {
    static func addCount(what operand: String) {
        guard let operand = Int16(operand) else { return }
        guard CoreDataManager.shared.getCount() + operand <= 9999 else { return }
        CoreDataManager.shared.changeCount(count: operand)
    }
}

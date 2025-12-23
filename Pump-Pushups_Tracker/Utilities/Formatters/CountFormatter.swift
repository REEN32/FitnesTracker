class CountFormatter {
    static func addCount(to count: inout Int, what operand: String) {
        guard let _ = Int(operand) else { return }
        guard count + Int(operand)! <= 9999 else { return }
        count += Int(operand)!
    }
}

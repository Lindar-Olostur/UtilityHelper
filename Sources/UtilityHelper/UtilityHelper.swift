// The Swift Programming Language
// https://docs.swift.org/swift-book

import ApphudSDK
import StoreKit
import Foundation
import SwiftUICore

#if os(iOS)
public struct UtilityHelper {
    public static func showMessage() {
        print("Hello from UtilityHelper!")
    }
    
    public static let ler = "Lol"
    
    @MainActor public static var subscriptions: [AppProduct] = []
    
    public enum Products: String {
        case year, week, error
    }
    
    public struct AppProduct: Identifiable {
        public let id = UUID()
        public let item: ApphudProduct
        public let type: Products
        public let price: String
        
        public init(item: ApphudProduct) {
            self.item = item
            self.type = {
                if item.productId.contains("year") || item.productId.contains("annual") {
                    return .year
                } else if item.productId.contains("week") {
                    return .week
                }
                return .error
            }()
            self.price = item.skProduct?.localizedPrice ?? "$0"
        }
    }
    
    public struct TextBuilder: View {
        let string: String
        var size: CGFloat = 16
        var fontName: String = ""
        var weight: Font.Weight = .regular
        var color: Color = .black
        var opacity: Double = 1.0
        var alignment: TextAlignment = .center
        var underlined: Bool = false
        var strikethrough: Bool = false
        
        public init(string: String, size: CGFloat, fontName: String, weight: Font.Weight, color: Color, opacity: Double, alignment: TextAlignment, underlined: Bool, strikethrough: Bool) {
            self.string = string
            self.size = size
            self.fontName = fontName
            self.weight = weight
            self.color = color
            self.opacity = opacity
            self.alignment = alignment
            self.underlined = underlined
            self.strikethrough = strikethrough
        }
        
        public var body: some View {
            Text(string)
                .font(.custom(fontName, size: size).weight(weight))
                .foregroundStyle(color.opacity(opacity))
                .multilineTextAlignment(alignment)
                .underline(underlined)
                .strikethrough(strikethrough)
        }
    }
    
    public struct BigButton<Content: View>: View {
        var height: CGFloat = 52
        var color: Color = .white
        var corners: CGFloat = 0
        let action: () -> Void
        let label: Content
        
        public init(height: CGFloat, color: Color, corners: CGFloat, action: @escaping () -> Void, label: () -> Content) {
            self.height = height
            self.color = color
            self.corners = corners
            self.action = action
            self.label = label()
        }
        
        public var body: some View {
            label
                .frame(maxWidth: .infinity, maxHeight: height)
                .background(color)
                .cornerRadius(corners)
                .contentShape(Rectangle())
                .onTapGesture {
                    action()
                }
        }
    }
}
#endif

public extension SKProduct {
    var localizedPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = priceLocale
        return formatter.string(from: price)!
    }
}

//
//  ProductsBuy.swift
//  UtilityHelper
//
//  Created by Lindar Olostur on 05.02.2025.
//


//import ApphudSDK
//import StoreKit
//import Foundation
//import SwiftUICore
//
//extension SKProduct {
//    var localizedPrice: String {
//        let formatter = NumberFormatter()
//        formatter.numberStyle = .currency
//        formatter.locale = priceLocale
//        return formatter.string(from: price)!
//    }
//}
//
//public class ProductsBuy {
//    @MainActor public static let shared = ProductsBuy()
//    private init() {}
//    
//    public var subscriptions: [AppProduct] = []
//    
//    public enum Products: String {
//        case year, week, error
//    }
//
//    public struct AppProduct: Identifiable {
//        public let id = UUID()
//        public let item: ApphudProduct
//        public let type: Products
//        public let price: String
//        
//        public init(item: ApphudProduct) {
//            self.item = item
//            self.type = {
//                if item.productId.contains("year") || item.productId.contains("annual") {
//                    return .year
//                } else if item.productId.contains("week") {
//                    return .week
//                }
//                return .error
//            }()
//            self.price = item.skProduct?.localizedPrice ?? "$0"
//        }
//    }
//}

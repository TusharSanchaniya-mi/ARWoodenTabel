//
//  Color+Extension.swift
//  ARTextureDemo
//
//  Created by Mindinventory on 20/12/24.
//

import Foundation
import UIKit

// Define an enum for furniture types
enum FurnitureType {
    case sofa
    case table
    case chair
    case bed
    case cabinet
}

struct TextureType {
    let image: String
    let color: UIColor
    let texture: UIImage?
}

struct FurnitureColor {
    
    private init() {}
    static let shared = FurnitureColor()
    
    var tableColors: [String] {
        get {
            var allResult = [
                "Wood_Table_C_2.jpg",
                "Wood_Table_C.jpg",
                "Wood_Table_N.jpg"
            ]
            
            Array(repeating: "", count: 10).enumerated().forEach { (index, item) in
                allResult.append("Wooden_Table_\(index+1).jpg")
            }
//            var allResult = [
//                "Wood_Table_C_2",
//                "Wood_Table_C",
//                "Wood_Table_N"
//            ].map { item in
//                if let bundleFile = Bundle.main.path(forResource: item, ofType: "jpg") {
//                    return bundleFile
//                }
//                return ""
//            }
//            
//            Array(repeating: "", count: 10).enumerated().forEach { (index, item) in
//                if let bundleFile = Bundle.main.path(forResource: "Wooden_Table_\(index+1)", ofType: "jpg") {
//                    allResult.append(bundleFile)
//                }
//            }
            
            return allResult.filter({$0.count > 0})
        }
    }
    
    let tableColorsMain = [
        UIColor(hex: "#3E2A47"), // Dark Purple (Deep Wood Tone)
        UIColor(hex: "#5A3E4B"), // Chestnut
        UIColor(hex: "#4B3621"), // Walnut
        UIColor(hex: "#7F5B3C"), // Caramel
        UIColor(hex: "#C08E57"), // Golden Oak
        UIColor(hex: "#D7B79E"), // Light Beige Wood
        UIColor(hex: "#8B5D3B"), // Medium Walnut
        UIColor(hex: "#9E7D6B"), // Taupe Wood
        UIColor(hex: "#3E2A22"), // Espresso Brown
        UIColor(hex: "#7E5C4D"), // Mahogany
        UIColor(hex: "#5F4B32"), // Warm Chestnut
        UIColor(hex: "#6B4F33"), // Dark Oak
        UIColor(hex: "#A67844"), // Amber Wood
        UIColor(hex: "#6A4E23"), // Antique Oak
        UIColor(hex: "#9C7B4E"), // Rustic Oak
        UIColor(hex: "#B98A47"), // Golden Mahogany
        UIColor(hex: "#D7B59D"), // Light Mahogany
        UIColor(hex: "#8F5B3C"), // Redwood
        UIColor(hex: "#C5A88E"), // Butterscotch Oak
        UIColor(hex: "#9C5A2B"), // Cinnamon Wood
        UIColor(hex: "#7A4B3C"), // Burnt Walnut
        UIColor(hex: "#C27C3C"), // Golden Brown
        UIColor(hex: "#D67F6B"), // Light Rosewood
        UIColor(hex: "#F1E3D6"), // Cream
        UIColor(hex: "#6E4B3D"), // Chocolate Brown
        UIColor(hex: "#8C6A4B"), // Brown Oak
        UIColor(hex: "#4B3A34"), // Dark Espresso
        UIColor(hex: "#D7B3A6"), // Light Cherry
        UIColor(hex: "#AB7A3A"), // Golden Walnut
        UIColor(hex: "#6B4226"), // Mahogany Brown
        UIColor(hex: "#9C6B47"), // Warm Walnut
        UIColor(hex: "#4D3B29"), // Dark Birch
        UIColor(hex: "#D1B29B"), // Warm Beige
        UIColor(hex: "#5D3F2B"), // Mocha Brown
        UIColor(hex: "#A17846"), // Oak with Gold
        UIColor(hex: "#9A7D50"), // Dark Gold
        UIColor(hex: "#8F6D45"), // Wood Blend
        UIColor(hex: "#F2F0E6"), // Creamy Beige
        UIColor(hex: "#755C46"), // Brownish Oak
        UIColor(hex: "#6C4F2D"), // Weathered Wood
        UIColor(hex: "#C28A57"), // Honey Oak
        UIColor(hex: "#D4A05A"), // Yellow Oak
        UIColor(hex: "#C08F5A"), // Amber Walnut
        UIColor(hex: "#4C2C1B"), // Warm Chocolate
        UIColor(hex: "#50331C"), // Rustic Walnut
        UIColor(hex: "#7D5A3E"), // Walnut Chestnut
        UIColor(hex: "#9A7D46"), // Rustic Chestnut
        UIColor(hex: "#B19464"), // Maple Wood
        UIColor(hex: "#8D6748"), // Coffee Bean
        UIColor(hex: "#C9A67A"), // Caramel Oak
        UIColor(hex: "#E1B789"), // Soft Amber
        UIColor(hex: "#D0A77B"), // Honey Brown
        UIColor(hex: "#AF8756"), // Chestnut Oak
        UIColor(hex: "#5B3C3C"), // Brickwood
        UIColor(hex: "#6C4C38"), // Rich Walnut
        UIColor(hex: "#9A7E61"), // Soft Maple
        UIColor(hex: "#C08456"), // Warm Gold Oak
        UIColor(hex: "#2F1A1B"), // Deep Wood Brown
        UIColor(hex: "#52302D"), // Rich Mahogany
        UIColor(hex: "#A15B47"), // Amberwood
        UIColor(hex: "#4A2C1F"), // Oak Bark
        UIColor(hex: "#6A4C39"), // Smoked Chestnut
        UIColor(hex: "#9C6B41"), // Nut Brown
        UIColor(hex: "#7A5C3E"), // Walnut Oak
        UIColor(hex: "#8B5B3C"), // Caramel Chestnut
        UIColor(hex: "#927E6D"), // Light Walnut
        UIColor(hex: "#BB8C5E"), // Rustic Honey
        UIColor(hex: "#B49B73"), // Rustic Maple
        UIColor(hex: "#91673E"), // Copper Oak
        UIColor(hex: "#6F4E37"), // Mahogany Rosewood
        UIColor(hex: "#9B6F3F"), // Burnt Orange Wood
        UIColor(hex: "#C79C6E"), // French Oak
        UIColor(hex: "#BC8A5A"), // Toasted Walnut
        UIColor(hex: "#F1DFB4"), // Pale Birch
        UIColor(hex: "#A48453"), // Walnut Gold
        UIColor(hex: "#9E7D5F"), // Autumn Maple
        UIColor(hex: "#C3A74C"), // Walnut Gold
        UIColor(hex: "#7A5B44"), // Soft Chestnut
        UIColor(hex: "#8E6D4D"), // Hickory
        UIColor(hex: "#9F7F60"), // Rich Oak
        UIColor(hex: "#D89F6A"), // Light Amberwood
        UIColor(hex: "#6F3A26"), // Dark Chestnut
        UIColor(hex: "#9E5B43"), // Autumn Chestnut
        UIColor(hex: "#D9A66C"), // Tawny Oak
        UIColor(hex: "#2C191D"), // Deep Mahogany
        UIColor(hex: "#DFAC8A"), // Pale Mahogany
        UIColor(hex: "#90714C"), // Birchwood
        UIColor(hex: "#7B634A"), // Brandywood
        UIColor(hex: "#5A4E38"), // Light Coffee Oak
        UIColor(hex: "#4A302B"), // Deep Espresso
        UIColor(hex: "#9A7D5F"), // Harvest Oak
        UIColor(hex: "#D4B991"), // Soft Pine
        UIColor(hex: "#B88E55"), // Burnt Maple
        UIColor(hex: "#C69C6D"), // Sandy Oak
        UIColor(hex: "#8F634C"), // Rustic Walnut
        UIColor(hex: "#3C2F2A"), // Coffee Walnut
        UIColor(hex: "#6B4B3F"), // Smoked Oak
        UIColor(hex: "#9F754A"), // Butterscotch Brown
        UIColor(hex: "#B79B75"), // Warm Honey
        UIColor(hex: "#A6754F"), // Maple Nut Brown
        UIColor(hex: "#BC8A63"), // Light Redwood
        UIColor(hex: "#B28A5D"), // Coffee Oak
        UIColor(hex: "#D1B79E"), // Warm Maple
        UIColor(hex: "#8A5E42"), // Rich Oak
        UIColor(hex: "#D6A75D"), // Maple Wood
        UIColor(hex: "#B78946"), // Sandstone Oak
        UIColor(hex: "#C19363"), // Soft Walnut
        UIColor(hex: "#6F4A33"), // Caramel Chestnut
        UIColor(hex: "#9C4F30")  // Burnt Oak
    ]

    let glassColors: [UIColor] = [
        UIColor(hex: "#D9E3F0"), // Clear Glass (Light Blue Tint)
        UIColor(hex: "#A4C6E1"), // Soft Frosted Glass
        UIColor(hex: "#B0E0E6"), // Powder Blue Glass
        UIColor(hex: "#88B4C4"), // Cloudy Glass
        UIColor(hex: "#B5D3E7"), // Frosted Glass (Light Blue)
        UIColor(hex: "#C9E4F1"), // Sky Glass
        UIColor(hex: "#8CDAF0"), // Ocean Blue Glass
        UIColor(hex: "#81A9C5"), // Water Glass
        UIColor(hex: "#ADC9E1"), // Ice Blue Glass
        UIColor(hex: "#A7D8E8"), // Transparent Glass
        UIColor(hex: "#C8C8C8"), // Smoky Glass
        UIColor(hex: "#D1D3D4"), // Foggy Glass
        UIColor(hex: "#A8BCC8"), // Frosted Window Glass
        UIColor(hex: "#BCC9D7"), // Slate Glass
        UIColor(hex: "#D8D8D8"), // Misty Glass
        UIColor(hex: "#D9D0C7"), // Translucent Glass (Light Tan)
        UIColor(hex: "#88A0B9"), // Clouded Glass
        UIColor(hex: "#E0E0E0"), // Frosted White Glass
        UIColor(hex: "#A0AAB1"), // Blue-Tinted Glass
        UIColor(hex: "#9F9F9F"), // Light Grey Glass
        UIColor(hex: "#99AABB"), // Crystal Glass
        UIColor(hex: "#82B0C1"), // Subtle Blue Glass
        UIColor(hex: "#7E9B9D"), // Charcoal Glass
        UIColor(hex: "#D7E1E3"), // Light Aqua Glass
        UIColor(hex: "#B9B9B9"), // Shimmering Glass
        UIColor(hex: "#C1C1C1"), // Silvery Glass
        UIColor(hex: "#C0D0E0"), // Cloudy Transparent Glass
        UIColor(hex: "#D0E6F2"), // Crystal Clear Blue
        UIColor(hex: "#D9D9D9"), // Clear Glass (Neutral)
        UIColor(hex: "#A5B5C2"), // Ice Crystal Glass
        UIColor(hex: "#F5F5F5"), // Misty White Glass
        UIColor(hex: "#5C6B73"), // Grey-Tinted Glass
        UIColor(hex: "#A9D8E4"), // Aqua Glass
        UIColor(hex: "#6A7C89"), // Dark Glass
        UIColor(hex: "#F0F0F0"), // Transparent White Glass
        UIColor(hex: "#C6D9EC"), // Sky Blue Glass
        UIColor(hex: "#98B6B2"), // Light Seafoam Glass
        UIColor(hex: "#A1B9D4"), // Steel Glass
        UIColor(hex: "#C4D9F0"), // Ocean Breeze Glass
        UIColor(hex: "#6D8B9D"), // Steel-Tinted Glass
        UIColor(hex: "#92A9D3"), // Clear Light Blue Glass
        UIColor(hex: "#E1F1F6"), // Light Misty Blue Glass
        UIColor(hex: "#F0F5F9"), // Very Light Glass
        UIColor(hex: "#A6C2D2"), // Soft Ocean Glass
        UIColor(hex: "#6B7C8C"), // Shaded Glass
        UIColor(hex: "#DBF2F9"), // Cool Crystal Glass
        UIColor(hex: "#E3F6FC"), // Clear Sky Glass
        UIColor(hex: "#ADC9D7"), // Blue Sea Glass
        UIColor(hex: "#B4CBE3"), // Light Foggy Glass
        UIColor(hex: "#7E8C9A"), // Smoky Blue Glass
        UIColor(hex: "#93A9C9"), // Dusty Blue Glass
        UIColor(hex: "#A8BCC8"), // Aqua Frosted Glass
        UIColor(hex: "#D9E4F1"), // Soft Frosted Blue Glass
        UIColor(hex: "#F2F2F2"), // Soft White Glass
        UIColor(hex: "#B5C9D6"), // Silvery Blue Glass
        UIColor(hex: "#A3B1B9"), // Misty Transparent Glass
        UIColor(hex: "#CED7E0"), // Greyish Glass
        UIColor(hex: "#9DB7D1"), // Soft Cloud Glass
        UIColor(hex: "#D1D3D5"), // Neutral Frosted Glass
        UIColor(hex: "#B1D1E5"), // Shiny Blue Glass
        UIColor(hex: "#D8D8E0"), // Pale Frosted Glass
        UIColor(hex: "#A6B7D4"), // Frosted Glass (Steel Tint)
        UIColor(hex: "#B9D3F0"), // Light Blue Window Glass
        UIColor(hex: "#7B7B7B"), // Transparent Grey Glass
        UIColor(hex: "#A1B0B3"), // Pale Blue-Tinted Glass
        UIColor(hex: "#B5BEC8"), // Pearl Grey Glass
        UIColor(hex: "#B1C8D6"), // Crystal Clear Aqua Glass
        UIColor(hex: "#8DA4B7"), // Cloudy Clear Glass
        UIColor(hex: "#C6C6C6"), // Light Smoky Glass
        UIColor(hex: "#BCC1C5"), // Glistening Glass
        UIColor(hex: "#DAE1F0"), // Pale Glass
        UIColor(hex: "#E1E8F3"), // Crystal Blue Glass
        UIColor(hex: "#A5B7D1"), // Gentle Sea Glass
        UIColor(hex: "#BCC7D7"), // Misty Blue Window Glass
        UIColor(hex: "#E3F1FB"), // Clear White Frosted Glass
        UIColor(hex: "#8B9DB9"), // Dark Misty Glass
        UIColor(hex: "#ADC6D5"), // Luminous Glass
        UIColor(hex: "#D2D8E7"), // Transparent Aqua Glass
        UIColor(hex: "#B7D1F0"), // Clear Ocean Glass
        UIColor(hex: "#F7F8F9"), // Pure Transparent Glass
        UIColor(hex: "#C5D8E9"), // Clear Misty Glass
        UIColor(hex: "#88B3C4"), // Tinted Glass
        UIColor(hex: "#A2BCC4"), // Slate Glass Tint
        UIColor(hex: "#D8D8DB"), // Pearl Glass
        UIColor(hex: "#BCC2D1"), // Pure Frosted Glass
        UIColor(hex: "#93A8C1"), // Cloudy Clear Glass
        UIColor(hex: "#E2F0F9"), // Ice Blue Glass
        UIColor(hex: "#B7CBE5"), // Light Crystal Glass
        UIColor(hex: "#A8BCC7"), // Icy Grey Glass
        UIColor(hex: "#6E7C87"), // Frosted Steel Glass
        UIColor(hex: "#B3C2D4"), // Crystal Window Glass
        UIColor(hex: "#C6D2D9"), // Clear Crystal Glass
        UIColor(hex: "#9CA8BC"), // Grey Sea Glass
        UIColor(hex: "#D9E3F1"), // Soft Light Blue Glass
        UIColor(hex: "#B8D1E3"), // Soft Crystal Glass
        UIColor(hex: "#D1D8DF"), // Transparent Misty Glass
        UIColor(hex: "#A0B6CB"), // Shimmering Clear Glass
        UIColor(hex: "#A9B9C8"), // Misty Crystal Glass
        UIColor(hex: "#D3E2F0"), // Ice Crystal Glass
        UIColor(hex: "#9FB5C7"), // Frosted Ocean Glass
        UIColor(hex: "#5E6D7B"), // Foggy Glass
        UIColor(hex: "#8A9CA7"), // Cool Crystal Glass
        UIColor(hex: "#93A1B5"), // Misty Blue Glass
        UIColor(hex: "#9FBDD8"), // Cloudy Glass Reflection
        UIColor(hex: "#D1D6E2"), // Soft Blue Frosted Glass
        UIColor(hex: "#B9D1EB"), // Fresh Transparent Glass
        UIColor(hex: "#99A8B9"), // Soft Grey Glass
        UIColor(hex: "#8A9DAF"), // Misty Grey Glass
        UIColor(hex: "#BCC8D4"), // Soft Blue Crystal Glass
        UIColor(hex: "#D9DFF5"), // Soft Frosted Crystal
        UIColor(hex: "#D4DDE7"), // Crystal Mist
        UIColor(hex: "#B3BCC7"), // Bluish Glass
        UIColor(hex: "#E4F2FA"), // Clear Ice Glass
        UIColor(hex: "#9BB8D1"), // Crystal Blue Tint
        UIColor(hex: "#D1D4DB"), // Pale Crystal Glass
        UIColor(hex: "#DAE3F2"), // Light Clear Glass
        UIColor(hex: "#9DA9B9")  // Misty Window Glass
    ]
}


extension UIColor {
    convenience init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        if hexSanitized.hasPrefix("#") {
            hexSanitized.remove(at: hexSanitized.startIndex)
        }
        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

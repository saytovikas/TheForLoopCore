import UIKit

class RazeCore {
    
    
    /// Get UIColor value bay passing Hexadecimal string of RGB color value along with optional value of Alpha
    /// - Warning: The "#" symbol is stripped from the beginning of the string submitted here
    /// - Parameters:
    ///   - hexString: 6-digit Hex String of RGB color value. Can be prefixed with '#'.
    ///   - alpha: Optional parameter with default value of 1.0. Accepted values 0.0-1.0
    /// - Returns: Returns corrosponding UIColor value of `hexString`
    class func colorFromHexString(_ hexString: String, alpha: CGFloat = 1.0) -> UIColor {
        
        let r, g, b: CGFloat
        let offset = hexString.hasPrefix("#") ? 1 : 0
        let start = hexString.index(hexString.startIndex, offsetBy: offset)
        let hexColor = String(hexString[start...])
        let scanner = Scanner(string: hexColor)
        
        var hexNumber: UInt64 = 0
        
        if scanner.scanHexInt64(&hexNumber) {
            r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
            g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
            b = CGFloat(hexNumber & 0x0000ff) / 255
            return UIColor(red: r, green: g, blue: b, alpha: alpha)
        }
        
        return UIColor(red: 0, green: 0, blue: 0, alpha: alpha)
    }
}

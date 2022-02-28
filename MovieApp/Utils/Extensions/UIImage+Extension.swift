//
//  UIImage+Extension.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 27/02/22.
//

import UIKit

extension UIImage {
    
    public class func URLimage(url: String) -> UIImage? {
        // Validate URL
        guard let bundleURL = URL(string: url) else {
            print("SwiftGif: This image named \"\(url)\" does not exist")
            return nil
        }
        
        // Validate data
        guard let imageData = try? Data(contentsOf: bundleURL) else {
            print("SwiftGif: Cannot turn image named \"\(url)\" into NSData")
            return nil
        }
        
        return UIImage(data: imageData)
    }
    
}

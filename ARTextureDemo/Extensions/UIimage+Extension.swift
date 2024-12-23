//
//  UIimage+Extension.swift
//  ARTextureDemo
//
//  Created by Mindinventory on 17/12/24.
//

import Foundation
import UIKit
import SDWebImage


extension UIImageView {
    func loadLocalGifImage(fileName: String) {
        if let gifURL = Bundle.main.url(forResource: fileName, withExtension: "gif") {
            self.sd_setImage(with: gifURL, completed: nil)
        }
    }
}

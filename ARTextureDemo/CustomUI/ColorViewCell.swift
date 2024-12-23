//
//  ColorViewCell.swift
//  ARTextureDemo
//
//  Created by Mindinventory on 20/12/24.
//

import UIKit
import SDWebImage

class ColorViewCell: UICollectionViewCell {

    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var bgImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.bgImageView.image = UIImage(named: "placeholder") ?? UIImage()
        self.colorView.makeRoundedWithShadow()
        self.bgImageView.makeRoundedWithShadow()
        self.bgImageView.clipsToBounds = true
        self.colorView.clipsToBounds = true
    }
    
    func configureView(color: String) {
        self.colorView.backgroundColor = .clear
        self.bgImageView.isHidden = false
        if self.bgImageView.tag == 0 {
            self.bgImageView.tag = 1
            DispatchQueue.main.asyncAfter(deadline: .now()+1.0, execute: {
                self.bgImageView.image = UIImage(named: color) ?? UIImage()
            })
        }
    }
    
    func configureViewForGlass(color: UIColor) {
        self.bgImageView.isHidden = true
        self.colorView.backgroundColor = color
    }

}

extension UIView {
    func makeRoundedWithShadow(cornerRadius: CGFloat? = nil, shadowOpacity: Float = 0.3, shadowRadius: CGFloat = 5, shadowOffset: CGSize = CGSize(width: 0, height: 2)) {
        // Set corner radius
        self.layer.cornerRadius = cornerRadius ?? self.frame.size.width / 2
        self.clipsToBounds = true
        
        // Set shadow properties
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOffset = shadowOffset
        self.layer.masksToBounds = false
    }
}

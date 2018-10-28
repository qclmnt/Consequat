//
//  COImageCustomizationViewControllerViewModel.swift
//  Consequat
//
//  Created by Quentin CLEMENT on 28/10/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import QCViewModel

class COImageCustomizationViewControllerViewModel: QCViewControllerViewModel {
    
    // MARK: - Properties
    
    lazy var emojis = ["🤯", "😀", "🎩", "👓", "🕶", "👑", "⛑", "🏅", "♥️", "📍"]
    let image: UIImage
    
    // MARK: - Initialization
    
    init(image: UIImage) {
        self.image = image
    }
    
    // MARK: - Create emoji
    
    func addEmoji(on view: UIView?) {
        guard let onView = view,
            let emojiString = self.emojis.randomElement() else {return}
    
        let emoji = emojiString.image()
        let emojiImageView = COGestureImageView(image: emoji)
        emojiImageView.frame = CGRect(x: onView.frame.size.width/2-emojiImageView.frame.width/2,
                                      y: onView.frame.size.height/3-emojiImageView.frame.height/2,
                                      width: emojiImageView.frame.size.width,
                                      height: emojiImageView.frame.size.height)
        
        emojiImageView.addPanPinchRotateGestures()
        onView.addSubview(emojiImageView)
    }
    
}

extension String {
    func image() -> UIImage? {
        let size = CGSize(width: 100, height: 100)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        UIColor.clear.set()
        let center = CGPoint(x: size.width/2, y: size.height/2)
        let rect = CGRect(origin: center, size: size)
        UIRectFill(CGRect(origin: center, size: size))
        (self as NSString).draw(in: rect, withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 40)])
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}

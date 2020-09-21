//
//  TopViewCell.swift
//  XCodePreview-Sample-UIKit
//
//  Created by kawaharadai on 2020/09/21.
//

import UIKit

final class TopViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!

    static var identifier: String {
        String(describing: self)
    }

    static func nib() -> UINib {
        UINib(nibName: identifier, bundle: nil)
    }

    func apply(title: String, backgroundColor: UIColor, thumbnailImage: UIImage) {
        titleLabel.text = title
        self.backgroundColor = backgroundColor
        thumbnailImageView.image = thumbnailImage
    }
    
}

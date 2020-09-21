//
//  TopViewCell.swift
//  XCodePreview-Sample-UIKit
//
//  Created by kawaharadai on 2020/09/21.
//

import UIKit
import SwiftUI

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

// MARK: UIViewをプレビューするために必要なコード
// プレビューするViewをUIViewRepresentableでラップするためのstruct
struct CellWrapper: UIViewRepresentable {
    typealias UIViewType = TopViewCell

    // プレビュー対象の初期化（インスタンス化）
    func makeUIView(context: Context) -> TopViewCell {
        TopViewCell.nib().instantiate(withOwner: self, options: nil).first as! TopViewCell
    }

    // プレビュー対象の更新（更新結果がプレビューに反映される）
    // LifeCycleは関係ない
    func updateUIView(_ uiView: TopViewCell, context: Context) {
        uiView.apply(title: "テストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテスト", backgroundColor: .red, thumbnailImage: UIImage(named: "1")!)
    }
}

struct TopViewCell_Previews: PreviewProvider {
    static var previews: some View {
        CellWrapper()
            .previewDisplayName("赤いセル")
            .previewLayout(.fixed(width: 375, height: 100)) // 端末サイズで制限をかけない場合は外部からサイズを指定する（SuperViewのサイズ指定が前提のため、中の制約の結果、SuperViewのサイズが決まる作りの場合は正しく見れない）
    }
}

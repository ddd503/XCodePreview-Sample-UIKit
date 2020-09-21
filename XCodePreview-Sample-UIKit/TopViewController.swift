//
//  TopViewController.swift
//  XCodePreview-Sample-UIKit
//
//  Created by kawaharadai on 2020/09/21.
//

import UIKit

final class TopViewController: UIViewController {

    private var dataSource: [(title: String, color: UIColor, thumbnailImageName: String)] =
        [("赤色", .red, "1"),
         ("青色", .blue, "2"),
         ("緑色", .green, "3"),
         ("黄色", .yellow, "4"),
         ("茶色", .brown, "5"),
         ("紫色", .purple, "6"),
         ("水色", .cyan, "7"),
         ("グレー", .gray, "8"),
         ("ライトグレー", .lightGray, "9"),
         ("オレンジ", .orange, "10")]

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.register(TopViewCell.nib(), forCellReuseIdentifier: TopViewCell.identifier)
            tableView.tableFooterView = UIView()
        }
    }

    init() {
        super.init(nibName: "TopViewController", bundle: nil)
    }

    func apply(dataSource: [(title: String, color: UIColor, thumbnailImageName: String)]) {
        self.dataSource = dataSource
        tableView.reloadData()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TopViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TopViewCell.identifier, for: indexPath) as! TopViewCell
        let resource = dataSource[indexPath.row]
        cell.apply(title: resource.title,
                   backgroundColor: resource.color,
                   thumbnailImage: UIImage(named: resource.thumbnailImageName)!)
        return cell
    }
}

// MARK: UIViewControllerをプレビューするために必要なコード

import SwiftUI

@available(iOS 13.0.0, *)
// 実際にプレビューを表示するPreviewProvider内で用意したUIViewControllerRepresentableを返す → プレビューが表示できる
struct TopViewController_Previews: PreviewProvider {
    // プレビューするViewControllerをUIViewControllerRepresentableでラップするためのstruct
    struct ViewControllerWrapper: UIViewControllerRepresentable {
        typealias UIViewControllerType = TopViewController

        // プレビュー対象の初期化
        func makeUIViewController(context: Context) -> TopViewController {
            TopViewController()
        }

        // プレビュー対象の更新（更新結果がプレビューに反映される）
        // LifeCycleは関係ない
        func updateUIViewController(_ uiViewController: TopViewController, context: Context) {
            let dataSource: [(title: String, color: UIColor, thumbnailImageName: String)] =
                [("赤色赤色赤色赤色赤色赤色赤色", .red, "1"),
                 ("青色青色青色", .blue, "2"),
                 ("緑色", .green, "3"),
                 ("黄色", .yellow, "4"),
                 ("茶色", .brown, "5"),
                 ("紫色", .purple, "6"),
                 ("水色", .cyan, "7"),
                 ("グレー", .gray, "8"),
                 ("ライトグレー", .lightGray, "9"),
                 ("オレンジ", .orange, "10")]
            // 画面更新の呼び出し
            uiViewController.apply(dataSource: dataSource)
        }
    }

    static var previews: some View {
        // 複数端末でのプレビューはGroupでまとめる必要がある
        Group {
            ForEach(["iPhone SE", "iPhone Xs Max"], id: \.self) { deviceName in
                ViewControllerWrapper()
                    .previewDevice(PreviewDevice(rawValue: deviceName))
                    .previewDisplayName(deviceName)
            }
        }
    }
}

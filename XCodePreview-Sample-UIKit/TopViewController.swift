//
//  TopViewController.swift
//  XCodePreview-Sample-UIKit
//
//  Created by kawaharadai on 2020/09/21.
//

import UIKit
import SwiftUI

class TopViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    let titleText: String

    init(titleText: String) {
        self.titleText = titleText
        super.init(nibName: "TopViewController", bundle: nil)
    }

    func apply(titleText: String) {
        titleLabel.text = titleText
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = titleText
    }
}

struct Wrapper: UIViewControllerRepresentable {
    typealias UIViewControllerType = TopViewController

    func makeUIViewController(context: Context) -> TopViewController {
        TopViewController(titleText: "")
    }

    func updateUIViewController(_ uiViewController: TopViewController, context: Context) {
        uiViewController.apply(titleText: "labelのテキストを書き換えてみる")
    }
}

struct TopViewController_Previews: PreviewProvider {
    static var previews: some View {
        Wrapper()
    }
}

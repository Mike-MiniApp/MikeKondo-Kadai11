//
//  PrefectureListViewController.swift
//  MikeKondo-Kadai11
//
//  Created by 近藤米功 on 2022/08/22.
//

import UIKit

protocol PrefectureListViewControllerDelegate: AnyObject {
    func didSelectPrefecture(name: String)
}

class PrefectureListViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    private let prefectures = ["北海道", "青森県", "岩手県", "宮城県", "秋田県", "山形県", "福島県", "茨城県", "栃木県", "群馬県", "埼玉県", "千葉県", "東京都", "神奈川県", "新潟県", "富山県", "石川県", "福井県", "山梨県", "長野県", "岐阜県", "静岡県", "愛知県", "三重県", "滋賀県", "京都府", "大阪府", "兵庫県", "奈良県", "和歌山県", "鳥取県", "島根県", "岡山県", "広島県", "山口県", "徳島県", "香川県", "愛媛県", "高知県", "福岡県", "佐賀県", "長崎県", "熊本県", "大分県", "宮崎県", "鹿児島県", "沖縄県"]

    var delegate: PrefectureListViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: PrefectureTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: PrefectureTableViewCell.identifier)
    }

    @IBAction private func didTapCancelButton(_ sender: Any) {
        dismiss(animated: true)
    }
}

extension PrefectureListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        prefectures.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PrefectureTableViewCell.identifier, for: indexPath) as? PrefectureTableViewCell else { fatalError("The dequeued cell is not instance") }
        cell.configure(name: prefectures[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectPrefecture(name: prefectures[indexPath.row])
        dismiss(animated: true)
    }
}

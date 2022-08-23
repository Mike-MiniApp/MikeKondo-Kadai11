//
//  PrefectureTableViewCell.swift
//  MikeKondo-Kadai11
//
//  Created by 近藤米功 on 2022/08/22.
//

import UIKit

class PrefectureTableViewCell: UITableViewCell {
    @IBOutlet private weak var prefectureNameLabel: UILabel!
    static let identifier = "PrefectureCell"
    static let nibName = "PrefectureTableViewCell"

    func configure(name: String) {
        prefectureNameLabel.text = name
    }
}

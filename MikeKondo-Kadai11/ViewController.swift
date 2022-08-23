//
//  ViewController.swift
//  MikeKondo-Kadai11
//
//  Created by 近藤米功 on 2022/08/18.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var prefectureNameLabel: UILabel!

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "change":
            guard let navigation = segue.destination as? UINavigationController else { return }

            guard let select = navigation.topViewController as? PrefectureListViewController else { return }
            select.delegate = self
        default:
            break
        }
    }
}

extension ViewController: PrefectureListViewControllerDelegate {
    func didSelectPrefecture(name: String) {
        prefectureNameLabel.text = name
    }
}

//
//  ZHYMainViewController.swift
//  ZHYRemotePlayer
//
//  Created by John Henry on 2017/1/23.
//  Copyright © 2017年 John Henry. All rights reserved.
//

import UIKit

final class ZHYMainViewController: UIViewController {

    let scanButton = UIButton.init(type: .custom)
    let operationView = UIView.init()
    let deviceListView = UITableView.init(frame: .zero, style: .plain)

    // MARK: Overridden

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        scanButton.setTitle("Scan", for: .normal)
        scanButton.backgroundColor = .blue
        scanButton.addTarget(self, action: #selector(scanButtonDidTouchUpInside(_:)), for: .touchUpInside)

        operationView.backgroundColor = .red
        operationView.addSubview(scanButton)

        view.addSubview(operationView)

        deviceListView.dataSource = self
        deviceListView.delegate = self
        view.addSubview(deviceListView)
    }

    override func viewWillLayoutSubviews() {
        let operationViewHeight: CGFloat = 160.0;
        operationView.frame = CGRect.init(origin: .zero, size: CGSize.init(width: view.frame.width, height: operationViewHeight))

        let scanButtonEdge = UIEdgeInsets.init(top: 20, left: 20, bottom: 20, right: 20)
        let scanButtonWidth = operationView.frame.width - scanButtonEdge.left - scanButtonEdge.right
        let scanButtonHeight = operationView.frame.height - scanButtonEdge.top - scanButtonEdge.bottom
        scanButton.frame = CGRect.init(x: scanButtonEdge.left, y: scanButtonEdge.top, width: scanButtonWidth, height: scanButtonHeight)

        let deviceListHeight: CGFloat = view.frame.height - operationViewHeight;
        let deviceListWidth = operationView.frame.width
        deviceListView.frame = CGRect.init(x: 0, y: operationViewHeight, width: deviceListWidth, height: deviceListHeight)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    // MARK: Actions

    @objc final private func scanButtonDidTouchUpInside(_: AnyObject) {

    }
}

extension ZHYMainViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "cellIdentifier"

        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)

        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: cellIdentifier)
        }

        cell?.textLabel?.text = String.init(indexPath.row)

        return cell!;
    }
}

extension ZHYMainViewController: UITableViewDelegate {

}

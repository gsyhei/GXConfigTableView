//
//  GXConfigTableViewController.swift
//  GXConfigTableViewVCSample
//
//  Created by Gin on 2023/10/31.
//

import UIKit

public class GXConfigTableViewController: UIViewController {
    public var tableView: UITableView?

    public var dataSource: GXConfigTableModel? {
        didSet {
            if let model = self.dataSource {
                self.configTableView(model: model)
            }
        }
    }

    public override var preferredScreenEdgesDeferringSystemGestures: UIRectEdge {
        return .bottom
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
    }

    private func configTableView(model: GXConfigTableModel) {
        if let letTv = self.tableView {
            letTv.removeFromSuperview()
        }
        let tv = UITableView(frame: self.view.bounds, style: model.type)
        tv.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: CGFloat.leastNormalMagnitude))
        tv.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tv.backgroundColor = model.backgroundColor
        tv.dataSource = self
        tv.delegate = self
        self.view.addSubview(tv)
        tv.reloadData()
        self.tableView = tv
    }

    public func gx_tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, model: GXConfigTableRowCustomModel) -> UITableViewCell  {
        return UITableViewCell()
    }
}

extension GXConfigTableViewController: UITableViewDataSource, UITableViewDelegate {
    // MARK - UITableViewDataSource
    public func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataSource?.sectionList.count ?? 0
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource?.sectionList[section].rowList.count ?? 0
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = self.dataSource?.sectionList[indexPath.section].rowList[indexPath.row]

        if let inputModel = model as? GXConfigTableRowInputModel {
            var cell = tableView.dequeueReusableCell(withIdentifier: inputModel.reuseIdentifier) as? GXConfigTableRowInputCell
            if cell == nil {
                cell = GXConfigTableRowInputCell(style: inputModel.style, reuseIdentifier: inputModel.reuseIdentifier)
            }
            cell?.bind(model: inputModel, type: GXConfigTableRowInputModel.self)

            return cell!
        }
        else if let switchModel = model as? GXConfigTableRowSwitchModel {
            var cell = tableView.dequeueReusableCell(withIdentifier: switchModel.reuseIdentifier) as? GXConfigTableRowSwitchCell
            if cell == nil {
                cell = GXConfigTableRowSwitchCell(style: switchModel.style, reuseIdentifier: switchModel.reuseIdentifier)
            }
            cell?.bind(model: switchModel, type: GXConfigTableRowSwitchModel.self)

            return cell!
        }
        else if let avatarModel = model as? GXConfigTableRowAvatarModel {
            var cell = tableView.dequeueReusableCell(withIdentifier: avatarModel.reuseIdentifier) as? GXConfigTableRowDefaultCell
            if cell == nil {
                cell = GXConfigTableRowDefaultCell(style: avatarModel.style, reuseIdentifier: avatarModel.reuseIdentifier)
            }
            cell?.bind(model: avatarModel, type: GXConfigTableRowAvatarModel.self)

            return cell!
        }
        else if let customModel = model as? GXConfigTableRowCustomModel {
            let cell = self.gx_tableView(tableView, cellForRowAt: indexPath, model: customModel)
            return cell
        }
        else if let defaultModel = model {
            var cell = tableView.dequeueReusableCell(withIdentifier: defaultModel.reuseIdentifier) as? GXConfigTableRowDefaultCell
            if cell == nil {
                cell = GXConfigTableRowDefaultCell(style: defaultModel.style, reuseIdentifier: defaultModel.reuseIdentifier)
            }
            cell?.bind(model: defaultModel, type: GXConfigTableRowDefaultModel.self)

            return cell!
        }
        return UITableViewCell()
    }
    // MRAK: - UITableViewDelegate
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let group = self.dataSource[section]
//        guard group.headerTitle.count > 0 else { return nil }
//        let view = tableView.dequeueReusableHeaderFooterView(GXTableViewHeaderFooterView.self)
//        view?.titleLabel.text = group.headerTitle
//        return view
        return nil
    }
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return self.dataSource?.sectionList[section].headerHeight ?? 0
    }
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return self.dataSource?.sectionList[section].footerHeight ?? 0
    }
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.dataSource?.sectionList[indexPath.section].rowList[indexPath.row].rowHeight ?? 0
    }
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.dataSource?.sectionList[indexPath.section].rowList[indexPath.row].action?()
    }
}

//
//  GXConfigTableRowSwitchCell.swift
//  GXConfigTableViewVCSample
//
//  Created by Gin on 2023/10/31.
//

import UIKit

public class GXConfigTableRowSwitchCell: GXConfigTableRowDefaultCell {

    lazy var switchView: UISwitch = {
        let switchView = UISwitch(frame: .zero)
        switchView.addTarget(self, action: #selector(self.switchChange(_:)), for: .valueChanged)
        return switchView
    }()

    public func bind<T: GXConfigTableRowSwitchModel>(model: T, type: T.Type) {
        super.bind(model: model, type: GXConfigTableRowSwitchModel.self)

        self.switchView.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: model.switchSize)
        self.switchView.sizeToFit()
        (self.switchView.rx.isOn <-> model.isOn).disposed(by: disposeBag)
        self.accessoryView = self.switchView
    }

    @objc func switchChange(_ sender: UISwitch) {
        guard let switchModel = model as? GXConfigTableRowSwitchModel else { return }
        switchModel.switchAction?(sender.isOn)
    }

}

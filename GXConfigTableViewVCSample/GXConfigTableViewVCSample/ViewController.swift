//
//  ViewController.swift
//  GXConfigTableViewVCSample
//
//  Created by Gin on 2023/10/31.
//

import UIKit

class ViewController: GXConfigTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "GXConfigTableViewVCSample"

        let model = GXConfigTableModel()
        model.style = .insetGrouped
        model.backgroundColor = UIColor(white: 0.9, alpha: 1)

        let section0 = GXConfigTableSectionModel()

        let sectionHeader0 = GXConfigTableSectionViewModel()
        sectionHeader0.title = "headerTitle0"
        sectionHeader0.detail = "headerDetail0"
        sectionHeader0.height = 30.0
        section0.header = sectionHeader0

        let sectionFooter0 = GXConfigTableSectionViewModel()
        sectionFooter0.title = "footerTitle0"
        sectionFooter0.detail = "footerDetail0"
        sectionFooter0.height = 30.0
        section0.footer = sectionFooter0


        let row0 = GXConfigTableRowAvatarModel()
        row0.style = .default
        row0.titleNumberOfLines = 0
        row0.rowHeight = 60.0
        row0.title.accept("row0 title\nrow0 title2")
        row0.detail.accept("row00 detail")
        row0.image.accept(UIImage(named: "m_wallet"))
        row0.avatarImage.accept(UIImage(named: "m_cart"))
        row0.avatarSize = CGSize(width: 30, height: 30)
        row0.action = {
            NSLog("action: row0")
        }

        let row00 = GXConfigTableRowDefaultModel()
        row00.title.accept("row00 title\nrow0 title2")
        row00.detail.accept("row00 detail")
        row00.titleNumberOfLines = 2
        row00.detailNumberOfLines = 1
        row00.rowHeight = 60.0
        row00.image.accept(UIImage(named: "m_cart"))
        row00.action = {
            NSLog("action: row00")
        }

        let row02 = GXConfigTableRowDefaultModel()
        row02.style = .subtitle
        row02.rowHeight = 70.0
        row02.title.accept("row0 title")
        row02.detail.accept("row0 detail")
        row02.image.accept(UIImage(named: "m_order"))
        row02.action = {
            NSLog("action: row02")
        }

        let row01 = GXConfigTableRowInputModel()
        row01.title.accept("row1 title")
        row01.image.accept(UIImage(named: "m_message"))
        row01.input.accept(nil)
        row01.inputPlaceholder = "placeholder"

        section0.rowList = [row0, row00, row02, row01]

        let section1 = GXConfigTableSectionModel()
        let sectionHeader1 = GXConfigTableSectionViewModel()
        sectionHeader1.title = "headerTitle1"
        sectionHeader1.detail = "headerDetail1"
        sectionHeader1.height = 30.0
        section1.header = sectionHeader1

        let sectionFooter1 = GXConfigTableSectionViewModel()
        sectionFooter1.title = "footerTitle1"
        sectionFooter1.detail = "footerDetail1"
        sectionFooter1.height = 30.0
        section1.footer = sectionFooter1

        let row10 = GXConfigTableRowDefaultModel()
        row10.title.accept("row0 title")
        row10.detail.accept("row0 detail")

        let row11 = GXConfigTableRowSwitchModel()
        row11.title.accept("row1 title")
        row11.image.accept(UIImage(named: "m_wallet"))
        row11.isOn.accept(true)
        row11.switchAction = { isOn in
            NSLog("switchAction: \(isOn)")
        }

        let row12 = GXConfigTableRowCustomModel()

        section1.rowList = [row10, row11, row12]

        let section2 = GXConfigTableSectionModel()
        let sectionHeader2 = GXConfigTableSectionViewModel()
        sectionHeader2.title = "headerTitle1"
        sectionHeader2.detail = "headerDetail1"
        sectionHeader2.height = 30.0
        section2.header = sectionHeader2

        let sectionFooter2 = GXConfigTableSectionViewModel()
        sectionFooter2.title = "的啊时间跨度哈加快速度哈卡手机德哈卡手机打哈手机扩大花洒打卡机阿达阿达是的。"
        sectionFooter2.detail = "footerDetail1"
        sectionFooter2.height = 50.0
        sectionFooter2.titleNumberOfLines = 2
        section2.footer = sectionFooter2

        let row20 = GXConfigTableRowButtonModel()
        row20.title.accept("退出登录")
        row20.titleColor = .red

        section2.rowList = [row20]

        model.sectionList = [section0, section1, section2]
        self.dataSource = model
    }

    override func gx_tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, model: GXConfigTableRowCustomModel) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: model.reuseIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: model.style, reuseIdentifier: model.reuseIdentifier)
        }
        cell?.textLabel?.text = "Custom Cell"

        return cell!
    }

}


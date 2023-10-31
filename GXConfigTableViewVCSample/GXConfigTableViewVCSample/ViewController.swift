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
        model.backgroundColor = UIColor(white: 0.95, alpha: 1)

        let section0 = GXConfigTableSectionModel()
        section0.headerTitle = "headerTitle 0"
        section0.headerHeight = 30.0
        
        let row00 = GXConfigTableRowDefaultModel()
        row00.title.accept("row0 title")
        row00.detail.accept("row0 detail")
        row00.action = {

        }

        let row01 = GXConfigTableRowInputModel()
        row01.title.accept("row1 title")
        row01.input.accept(nil)
        row01.inputPlaceholder = "placeholder"

        section0.rowList = [row00, row01]

        let section1 = GXConfigTableSectionModel()
        section1.headerTitle = "headerTitle 1"
        let row10 = GXConfigTableRowDefaultModel()
        row10.title.accept("row0 title")
        row10.detail.accept("row0 detail")

        let row11 = GXConfigTableRowSwitchModel()
        row11.title.accept("row1 title")
        row11.isOn.accept(true)

        section1.rowList = [row10, row11]

        model.sectionList = [section0, section1]

        self.dataSource = model
    }


}


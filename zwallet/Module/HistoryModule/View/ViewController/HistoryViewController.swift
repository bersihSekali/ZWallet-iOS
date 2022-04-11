//
//  HistoryViewController.swift
//  zwallet
//
//  Created by user217931 on 4/6/22.
//

import UIKit

class HistoryViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    let dataSource = HistoryDataSource()

    var presenter: HistoryPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupTableView()

        self.presenter?.loadHistory()
    }

    func setupTableView() {
        self.tableView.register(UINib(nibName: "HeaderCell", bundle: Bundle(identifier: "com.casestudy.History")), forCellReuseIdentifier: "HeaderCell")
        self.tableView.register(UINib(nibName: "TransactionCell", bundle: Bundle(identifier: "com.casestudy.Core")), forCellReuseIdentifier: "TransactionCell")

        self.tableView.dataSource = self.dataSource
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.presenter?.dismiss(viewController: self)
    }
    
}

extension HistoryViewController: HistoryView {
    func showTransaction(transaction: [TransactionEntity]) {
        self.dataSource.transaction = transaction
        self.tableView.reloadData()
    }
}

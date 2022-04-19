//
//  BrokerTableViewController.swift
//  BrokerNetwork
//
//  Created by neosoft on 15/04/22.
//

import UIKit

class BrokerTableViewController: UITableViewController {
    
    let brokerNibName = "BrokerTableViewController"
    let brokerCell = "BrokerTableCell"
    var viewModel: BrokerViewModelType!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupTableview()
    }
    
    init(viewModel: BrokerViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: brokerNibName, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.viewModel.getResponse()
        self.setupObservers()
    }
    
    private func setupObservers(){
        self.viewModel.tableShouldReload.bindAndFire { bool in
            if bool{
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    private func setupNavigationBar(){
        self.navigationController?.isNavigationBarHidden = false
        let navigationView = UIBarButtonItem(customView: tableHeaderView())
        navigationItem.leftBarButtonItem = navigationView
        
    }
    
    private func setupTableview(){
        let brokerTableCell = UINib(nibName: "BrokerTableViewCell", bundle: nil)
        tableView.register(brokerTableCell, forCellReuseIdentifier: brokerCell)

        tableView.allowsSelection = false
//        tableView.tableHeaderView = tableHeaderView()
//        tableView.tableFooterView = UIView(frame: .zero)
        tableView.separatorStyle = .none
        
        let dismissKeyboardTap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(dismissKeyboardTap)
    }
    
    @objc func dismissKeyboard(){
        self.resignFirstResponder()
        self.view.endEditing(true)
    }
    
    private func tableHeaderView() -> UIView{
        let view = UIView()
        view.backgroundColor = .white
        
        let listLabel = UILabel()
        listLabel.text = "LIST"
        listLabel.textAlignment = .left
        listLabel.textColor = .black
        listLabel.font = UIFont(name: "System-Bold", size: listLabel.bounds.size.height - 2)
        
        view.addSubview(listLabel)
        listLabel.translatesAutoresizingMaskIntoConstraints = false
        listLabel.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        listLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        listLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 8).isActive = true
        listLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        return view
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.getTotalNumberOfBrokers()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: brokerCell, for: indexPath) as! BrokerTableViewCell
        let _brokerData = self.viewModel.getBrokerAt(index: indexPath.row)
        cell.setupBrokerDataCell(brokerData: _brokerData)
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height * 0.65
    }
    
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        return tableHeaderView()
//    }
//
//    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return view.frame.height * 0.10
//    }
}

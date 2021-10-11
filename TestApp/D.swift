//
//  D.swift
//  TestApp
//
//  Created by Abdullah Mohammad Daihan on 26/8/21.
//

import UIKit

class D: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var contacts: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0...22 {
            contacts.append("\(i)")
        }
    }
    
    @IBAction func reloaD(_ sender: UIBarButtonItem) {
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
}

extension D:UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("\(#function) \(indexPath.row)")
        let cell = tableView.dequeueReusableCell(withIdentifier: "newTableCell", for: indexPath) as! CustomTableViewCell
        cell.textLabel?.text = contacts[indexPath.row]
        cell.index = indexPath.row
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
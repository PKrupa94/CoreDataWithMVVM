//
//  UserListViewController.swift
//  PMVVM
//
//  Created by krupa on 1/20/18.
//  Copyright © 2018 sa. All rights reserved.
//

import UIKit
import CoreData

class UserListVC: UIViewController {
    
    @IBOutlet weak var userTableView:UITableView!
    
    var arrUserList:[NSManagedObject]!
    var selectedUser:NSManagedObject?
    
    //--------------------------------------------------------------
    //MARK:ViewLife cycle
    //--------------------------------------------------------------

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        arrUserList = DataModel.fetchUserInfo()
        selectedUser = nil
        userTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//--------------------------------------------------------------
//MARK:UITableView Delegate & Datasource
//--------------------------------------------------------------

extension UserListVC:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrUserList.count > 0 ? arrUserList.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let user = arrUserList[indexPath.row]
        cell.textLabel?.text = user.value(forKey: "firstName") as? String
        cell.detailTextLabel?.text = user.value(forKey: "lastName") as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedUser = arrUserList[indexPath.row]
        self.performSegue(withIdentifier:"push", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle.rawValue == 1{
            DataModel.deleteData(manageObject:arrUserList[indexPath.row])
            arrUserList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .middle)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "push" {
            if let registrationVc = segue.destination as? RegistrationVC {
                registrationVc.userObject = selectedUser
            }
        }
    }
}

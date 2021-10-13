//
//  CategoryPickerViewController.swift
//  MyLocations
//
//  Created by Mac on 28.09.2021.
//

import UIKit

class CategoryPickerViewController: UITableViewController {
    var selectedCategoryName = ""
    var selectedIndexPath = IndexPath()
    
    let categories = ["No Category",
                      "Apple Store",
                      "Bar",
                      "Bookstore",
                      "Club",
                      "Grocery Store",
                      "Historic Building",
                      "House",
                      "Icecream Vendor",
                      "Landmark",
                      "Park"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for index in 0..<categories.count {
            if categories[index] == selectedCategoryName {
                selectedIndexPath = IndexPath(row: index, section: 0)
                break
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let categoryName = categories[indexPath.row]
        cell.textLabel?.text = categoryName
        
        if categoryName == selectedCategoryName {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row != selectedIndexPath.row {
            if let newCell = tableView.cellForRow(at: indexPath) {
                newCell.accessoryType = .checkmark
            }
            if let oldCell = tableView.cellForRow(at: selectedIndexPath) {
                oldCell.accessoryType = .none
            }
            selectedIndexPath = indexPath
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PickedCategory" {
            let cell = sender as! UITableViewCell
            if let indexPath = tableView.indexPath(for: cell) {
                selectedCategoryName = categories[indexPath.row]
            }
        }
    }
    
}

//
//  SearchTableViewController.swift
//  ShareATextbook
//
//  Created by Cheryl Heng on 4/7/17.
//  Copyright © 2017 Chia Li Yun. All rights reserved.
//

import UIKit


class SearchTableViewController: UITableViewController, UISearchResultsUpdating {
    
    var books = ["Math", "English", "Science", "Chinese",
                 "Malay","Math", "English", "Science","Math", "English", "Science","Math", "English", "Science","Math", "English", "Science"]
    var filteredBooks = [String]()
    
    var searchController : UISearchController!
    var resultsController = UITableViewController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        self.tableView.bounces = true
        
        self.resultsController.tableView.dataSource = self
        self.resultsController.tableView.delegate = self
        
        self.searchController = UISearchController(searchResultsController: self.resultsController)
        self.tableView.tableHeaderView = self.searchController.searchBar
        self.searchController.searchResultsUpdater = self
        
        

    }
    
    func updateSearchResults(for searchController: UISearchController) {
        //filter array
        self.filteredBooks = self.books.filter { (book:String) -> Bool in
            if book.contains(self.searchController.searchBar.text!){
                return true
            } else{
                return false
            }
        
    }
        //update results TableView
        self.resultsController.tableView.reloadData()
    }

    // MARK: - Table view data source

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.tableView{
        return self.books.count
    }
        else    {
            return self.filteredBooks.count
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        if tableView == self.tableView{
        cell.textLabel?.text = self.books[indexPath.row]
        } else {
            cell.textLabel?.text = self.filteredBooks[indexPath.row]
        }
        return cell
        
    }
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

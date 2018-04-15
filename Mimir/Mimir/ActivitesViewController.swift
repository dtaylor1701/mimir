//
//  ActivityViewController.swift
//  Mimir
//
//  Created by David Taylor on 3/8/18.
//  Copyright © 2018 Hyper Elephant. All rights reserved.
//

import UIKit
import DecisionEngine

class ActivitesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var mimir: Mimir!

    var selectedActivity: Activity?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let rootController = self.tabBarController as! RootTabBarController
        self.mimir = rootController.mimir
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return mimir.activities.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = mimir.activities[indexPath.row].name

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            mimir.removeActivity(at: indexPath.row)
            Store.storeActivities(activties: mimir.activities)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? AddActivityViewController {
            destination.mimir = mimir
        }
        else if let detailsController = segue.destination as? ActivityDetailsViewController {
            detailsController.setActivity(selectedActivity!)
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedActivity = mimir.activities[indexPath.row]
        performSegue(withIdentifier: "activityDetail", sender: self.storyboard)
    }
    
    @IBAction func unwindToActivitiesViewController(segue: UIStoryboardSegue){
        tableView.reloadData()
        if(segue.source is ActivityDetailsViewController){
            Store.storeActivities(activties: mimir.activities)
        }
    }
 

}

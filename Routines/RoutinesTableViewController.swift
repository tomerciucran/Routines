//
//  RoutinesTableViewController.swift
//  Routines
//
//  Created by Tomer Ciucran on 12/10/16.
//  Copyright © 2016 tomercuicran. All rights reserved.
//

import UIKit

class RoutinesTableViewController: UITableViewController {
    
    var routines: [Routine]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        if let routines = RoutinesListParser.parse() {
            self.routines = routines
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return routines?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RoutineTableViewCell.identifier, for: indexPath) as! RoutineTableViewCell
        guard let item = routines?[indexPath.row] else {
            return cell
        }
        cell.configure(item: item)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let item = routines?[indexPath.row] else {
            return
        }
        performSegue(withIdentifier: Segues.showDetailSegue, sender: item)
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            routines?.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? RoutineDetailTableViewController, segue.identifier == Segues.showDetailSegue,
            let item = sender as? Routine {
            destinationViewController.routine = item
        }
    }
 

}

//
//  TaskListViewController.swift
//  iOS102Unit1ScavengerHunt
//
//  Created by Raymond Chen on 7/3/24.
//

import UIKit

class TaskListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var emptyStateLabel: UILabel!
    
    var tasks = [Task]() {
        didSet {
            emptyStateLabel.isHidden = !tasks.isEmpty
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // UI candy: Hide 1st / top cell separator
        tableView.tableHeaderView = UIView()

        tableView.dataSource = self

        // Populate mocked data
        // Comment out this line if you want the app to load without any existing tasks.
        tasks = Task.mockedTasks
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // This will reload data in order to reflect any changes made to a task after returning from the detail screen.
        tableView.reloadData()
    }
}


extension TaskListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as? TaskCell else {
            fatalError("Unable to dequeue Task Cell")
        }

        cell.configure(with: tasks[indexPath.row])

        return cell
    }
}

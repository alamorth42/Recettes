//
//  ViewController.swift
//  cuisine
//
//  Created by Achille Lamorthe on 29/04/2019.
//  Copyright © 2019 Achille Lamorthe. All rights reserved.
//

import UIKit

struct data {
    let image: UIImage?
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    var name = [data]()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! teste
        cell.test()
        cell.imageView1.image = name[indexPath.row].image
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        name = [data.init(image: #imageLiteral(resourceName: "Nems")), data.init(image: #imageLiteral(resourceName: "Couscous")), data.init(image: #imageLiteral(resourceName: "Fajitas"))]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let SelectedCell = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        SelectedCell?.img = name[indexPath.row].image!
        self.navigationController?.pushViewController(SelectedCell!, animated: true)
    }
    
}


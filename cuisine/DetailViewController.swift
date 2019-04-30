//
//  DetailViewController.swift
//  cuisine
//
//  Created by Achille Lamorthe on 29/04/2019.
//  Copyright © 2019 Achille Lamorthe. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var image: UIImageView!
    var etape1: String = ""
    var etape2: String = ""
    var etape: [String] = []
    
    func parseHtml(page : String, debut : String, fin : String) -> String{
        var valeur : String = ""
        let scan = Scanner(string: page)
        if scan.scanUpTo(debut, into: nil){
            scan.scanString(debut, into: nil)
            var suite : NSString?
            if(scan.scanUpTo(fin, into: &suite)){
                valeur = String(describing: suite!)
            }
        }
        return (valeur)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! detailcell
//        var etape: [String] = []
//        etape = cell.labeltest()
        print(indexPath.row)
        print(self.etape)
        while (etape == []) {
            sleep(UInt32(0.1))
        }
        cell.recetteLabel.text = self.etape[indexPath.row]
        return cell
    }
    
    let url = URL(string: "https://github.com/alamorth42/Recettes/blob/master/recettes")
    var img = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        image.image = img
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print(error!)
            }
            else {
                var pagehtml : String
                let htmlContent = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                pagehtml = String(describing: htmlContent)
                //                print(pagehtml)
                self.etape1 = self.parseHtml(page: pagehtml, debut : "etapes 1", fin : "etapes 2")
                self.etape2 = self.parseHtml(page: pagehtml, debut : "etapes 2", fin : "fin")
                //              DispatchQueue.main.async {
                //                    // Update the UI
                self.etape.append(self.etape1)
                self.etape.append(self.etape2)
                //            }
            }
        }
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

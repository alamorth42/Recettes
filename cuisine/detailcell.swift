//
//  detailcell.swift
//  cuisine
//
//  Created by Achille Lamorthe on 29/04/2019.
//  Copyright © 2019 Achille Lamorthe. All rights reserved.
//

import UIKit

class detailcell: UITableViewCell {

    @IBOutlet weak var recetteLabel: UILabel!
    let url = URL(string: "https://github.com/alamorth42/Recettes/blob/master/recettes")
    func parseHtml(page : String, debut : String, fin : String) -> String{
        var valeur : String = ""
        let scan = Scanner(string: page)
        if scan.scanUpTo(debut, into: nil) {
            scan.scanString(debut, into: nil)
            var suite : NSString?
            if (scan.scanUpTo(fin, into: &suite)){
                valeur = String(describing: suite!)
            }
        }
        return (valeur)
    }

//    func labeltest() -> [String]{
//        recetteLabel.text = "salut"
//        var etape1: String = ""
//        var etape2: String = ""
//        var etape: [String] = []
//        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
//            if error != nil{
//                print(error!)
//            }
//            else{
//                var pagehtml : String
//                let htmlContent = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
//                pagehtml = String(describing: htmlContent)
////                print(pagehtml)
//                etape1 = self.parseHtml(page: pagehtml, debut : "etapes 1", fin : "etapes 2")
//                etape2 = self.parseHtml(page: pagehtml, debut : "etapes 2", fin : "fin")
//  //              DispatchQueue.main.async {
////                    // Update the UI
//                    etape.append(etape1)
//                    etape.append(etape2)
//    //            }
//            }
//        }
//        task.resume()
//        return etape
//    }
}

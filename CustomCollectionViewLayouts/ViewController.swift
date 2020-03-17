//
//  ViewController.swift
//  CustomCollectionViewLayouts
//
//  Created by Salma Hassan on 3/12/20.
//  Copyright © 2020 salma. All rights reserved.
//

import UIKit

enum Layouts : String, CaseIterable {
    case StretchyHeader = "Stretchy Header"
    case StickeyHeader = "Stickey Header"
}

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView : UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension ViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Layouts.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
            else { return UITableViewCell()}
        cell.textLabel?.text = Layouts.allCases[indexPath.row].rawValue
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DispatchQueue.main.async {
            switch Layouts.allCases[indexPath.row] {
            case .StretchyHeader:
                let vc = StretchyHeaderVC()
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
                
            case .StickeyHeader:
                let vc = stickeyHeaderVC()
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            
            }
        }
    }
    
    
}


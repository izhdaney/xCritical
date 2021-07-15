//
//  SplashViewController.swift
//  xCritical
//
//  Created by Ilya Zhdaney on 09.07.2021.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        makeServiceCall()

        // Do any additional setup after loading the view.
    }
    
    private func makeServiceCall() {
        let nextVC = LoginViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

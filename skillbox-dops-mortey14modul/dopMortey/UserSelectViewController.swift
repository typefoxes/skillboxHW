

import UIKit
import RealmSwift

class UserSelectViewController: UIViewController {

    var name = ""
    var gender = ""
    var location = ""
    var status = ""
    var species = ""
    
    @IBAction func userName(_ sender: Any) {
        
    }
    @IBAction func userGender(_ sender: Any) {
    }
    
    @IBAction func userSpecies(_ sender: Any) {
    }
    @IBAction func userStatus(_ sender: Any) {
    }
    @IBAction func userLocation(_ sender: Any) {
    }
    @IBAction func saveButton(_ sender: Any) {
    }

    
    @IBOutlet weak var nameU: UITextField!
    @IBOutlet weak var genderU: UITextField!
    @IBOutlet weak var locationU: UITextField!
    @IBOutlet weak var statusU: UITextField!
    @IBOutlet weak var speciesU: UITextField!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        nameU.placeholder = name
        genderU.placeholder = gender
        locationU.placeholder = location
        statusU.placeholder = status
        speciesU.placeholder = species
    }
  

}

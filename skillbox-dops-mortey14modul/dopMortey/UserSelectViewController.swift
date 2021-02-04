

import UIKit
import RealmSwift

class UserSelectViewController: UIViewController {
    
    let realm = try! Realm()
    
    var name = ""
    var gender = ""
    var location = ""
    var status = ""
    var species = ""
    
    @IBAction func userName() { }
    @IBAction func userGender() { }
    @IBAction func userSpecies() { }
    @IBAction func userStatus() { }
    @IBAction func userLocation() { }
    @IBAction func saveButton() { }
    
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

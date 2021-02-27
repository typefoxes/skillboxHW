

import UIKit
import RealmSwift

class UserSelectViewController: UIViewController {
    
    private let realm = try! Realm()
    private var personage: MorteyData?
        
    func setId(_ name: String) { personage = realm.objects(MorteyData.self).filter("name = %@", name).first }
    
    var name = ""
    var gender = ""
    var location = ""
    var status = ""
    var species = ""
    
    @IBAction func userName() { try! realm.write { personage?.name = nameU.text! } }
    @IBAction func userGender() { try! realm.write { personage?.name = genderU.text! } }
    @IBAction func userSpecies() { try! realm.write { personage?.name = speciesU.text! } }
    @IBAction func userStatus() { try! realm.write { personage?.name = statusU.text! } }
    @IBAction func userLocation() { try! realm.write { personage?.name = locationU.text! } }
   
    @IBAction func saveButton() {
        func changeName() {
        personage?.name = nameU.text ?? ""
    }
    func save() {
        try! realm.write {
            realm.add(personage!, update: .modified)
        }
    }
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



import UIKit

class ViewController: UIViewController {
//  Задание1:  Функция считается чистой, когда не производит никаких побочных эффектов и когда она не полагается на какое-либо внешнее состояние. Основная мысль заключается в том, что она всегда будет производить один и тот же результат для заданного набора входных данных - независимо от того, когда и сколько раз она вызывается.
// Задание 9:
//    - infix определять свою логику для бинарных операторов (+-)
//    - prefix определить свою логику для унарного минуса (только один операнд)
//    - postfix определить свою логику оператора, который следует за операндом (b!) (только один операнд)
    
    @IBAction func clearButton() {
        label.text = "\(numbers) + \(names)"
        label.backgroundColor = .white
        view.backgroundColor = .white
    }
    @IBOutlet weak var label: UILabel!
    
    @IBAction func task4() {
        task40()
    }
    @IBAction func task3() {
        task30()
    }
    @IBAction func task5() {
        task50()
    }
    
    @IBAction func task6() {
        task60 { self.label.text = "2 second later" }
        }
        
    @IBAction func task7() {
        task70(f1: { self.view.backgroundColor = .red }, f2: { self.label.backgroundColor = .yellow })()
    }
    @IBAction func task8() {
        let sortedArray = task80(array: numbers, by: partTask8)
        label.text = "\(sortedArray)"

        }
    
    
    
    let numbers: [Int] = [2, 5, 1, 5, 3]
    let names: [String] = ["Lena", "Masha", "Kate", "Nick"]
  
    func task30() {
    let task3 = numbers.sorted(by: <)
        label.text = "\(task3)"
    }
    func task40() {
        let task4 = numbers.map { String($0) }
        label.text = "\(task4)"

    }
    func task50() {
        let task5 = names.reduce("") {
            names, name in name + " " + names
        }
        label.text = task5
    }
    func task60(execute: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: execute)
}
    
    func task70(f1: @escaping () -> Void, f2: @escaping () -> Void) -> () -> Void {
        return {
            f1()
            f2()
        }
    }
   func partTask8(x1: Int, x2: Int)->Bool{
    return x2 > x1
    }

    func task80(array: [Int], by: (Int, Int) -> Bool) -> [Int]{
        return array.sorted(by: by)
    }
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
 
    }
    
    
}


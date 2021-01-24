

import UIKit

class ViewController: UIViewController {
//  Задание1:  pure function - «чистая функция», она не изменяет тип данных, которые были у нее на входе.Это делает код более лаконичным, с ней не нужно копипастить код, можно просто вызвать функцию.
// Задание 9: infix - оператор который, работает с между двумя аргументами (необязательно с числами).
    //• Infix: (x) + (y)
    //• Prefix: + (x) (y)
    //• Postfix: (x) (y) +
    
    @IBAction func clearButton(_ sender: Any) {
        label.text = "\(numbers) + \(names)"
        label.backgroundColor = .white
        view.backgroundColor = .white
    }
    @IBOutlet weak var label: UILabel!
    
    @IBAction func task4(_ sender: Any) {
        task4()
    }
    @IBAction func task3(_ sender: Any) {
        task3()
    }
    @IBAction func task5(_ sender: Any) {
        task5()
    }
    
    @IBAction func task6(_ sender: Any) {
        task6 {
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: { self.label.text = "2 second later"})
            }
        }
        
    @IBAction func task7(_ sender: Any) {
        task7(f1: { self.view.backgroundColor = .red }, f2: { self.label.backgroundColor = .yellow })()
    }
    @IBAction func task8(_ sender: Any) {
        let sortedArray = task8(array: numbers, by: partTask8)
        label.text = "\(sortedArray)"
        }
    
    
    
    let numbers: [Int] = [2, 4, 1, 5, 3]
    let names: [String] = ["Lena", "Masha", "Kate", "Nick"]
  
    func task3() {
    let task3 = numbers.sorted(by: <)
        label.text = "\(task3)"
    }
    func task4() {
        let task4 = numbers.map { String($0) }
        label.text = "\(task4)"

    }
    func task5() {
        let task5 = names.reduce("") {
            names, name in name + " " + names
        }
        label.text = task5
    }
    func task6(compleion: () -> Void) {
        compleion()
    }
    
    func task7(f1: @escaping () -> Void, f2: @escaping () -> Void) -> () -> Void {
        return {
            f1()
            f2()
        }
    }
    func partTask8(x1: Int, x2: Int)->Bool{
        let x1 = numbers[0]
        let x2 = numbers[1]
        return x2 > x1 ? true : false
    }

    func task8(array: [Int], by: (Int, Int) -> Bool) -> [Int]{
        return array.sorted(by: by)
    }
   
  
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "\(numbers) + \(names)"
        label.backgroundColor = .white
        view.backgroundColor = .white
 
    }
    
    
}


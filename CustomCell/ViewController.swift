import UIKit
class ViewController: UIViewController {
    lazy var personList : [Person] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
private func getData()
{
    personList.removeAll()
    personList.append(Person(Id: "p01", firstName: "Jyothi", lastName: "Thomas", gender: Gender.Female, salary: 1000))
    personList.append(Person(Id: "p02", firstName: "James", lastName: "Thomas", gender: Gender.Female, salary: 1040))
    personList.append(Person(Id: "p01", firstName: "Annos", lastName: "James", gender: Gender.Male, salary: 100))
    }
}
extension ViewController: UITableViewDataSource,UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {        return self.personList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonTableViewCell", for: indexPath) as! PersonTableViewCell
        let person = personList[indexPath.row]
        cell.lblFirstName.text = person.firstName
          cell.lblLastName.text = person.lastName
        cell.lblSalary.text = "$ \(person.salary)"
        
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(100.0)
    }
}

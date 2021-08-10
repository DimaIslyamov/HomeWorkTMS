//
//  StudentViewController.swift
//  homeWorkLesson16
//
//  Created by Moobat on 8.08.21.
//

import UIKit

class StudentViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    let arrayOfStudentsName = ["Hiden Cristianson",
                               "Jon Travolta",
                               "Dani Daniro",
                               "Mark Wolberg",
                               "Kianu Rivz",
                               "Darth Vader",
                               "Obi Van Kenobi",
                               "Mikki Rurg",
                               "Jony Deph",
                               "Brath Pit",
                               "Skala Djonson",
                               "Vin Dizel",
                               "Poul Woker",
                               "Kitayoza Van",
                               "Djaki Chan",
                               "Ilia Murovez",
                               "Aliocha Popovich",
                               "Hiden Cristianson",
                               "Travolta Naru",
                               "Magist Yoda",
                               "Kate Ruznikova",
                               "Dima Islyamov",
                               "Andrey Zhukov",
                               "Anton Lesik",
                               "Vitia Boyko",
                               "Ilia Boyko",
                               "Sasha Maksimuk",
                               "Nikita Panasik",
                               "Youra Frilans",]
    
    
    
    var listOfStudents: [Students] = []
    var sordtStudents: Dictionary<String, Any> = [:]
    var sorted: [String] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        listOfStudents = listOfStudents.sorted(by: {$0.name < $1.name})
        setStudentInfo()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "TaskTreeTableViewCell", bundle: nil), forCellReuseIdentifier: "TaskTreeTableViewCell")
        
        sortedStudent()
        sorted = sordtStudents.keys.sorted()
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    
    func setStudentInfo() {
        for index in 0...28 {
            let student: Students = Students(name: arrayOfStudentsName[index])
            listOfStudents.append(student)
        }
    }
    
    
    func sortedStudent() {
        sordtStudents["Grup A"] = listOfStudents.filter({$0.avgMark >= 4.5})
        sordtStudents["Grup B"] = listOfStudents.filter({$0.avgMark > 4.0 && $0.avgMark < 4.5})
        sordtStudents["Grup C"] = listOfStudents.filter({$0.avgMark > 3.0 && $0.avgMark < 4.0})
        sordtStudents["Grup D"] = listOfStudents.filter({$0.avgMark < 3.0})
    }
    
    
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    

}




// MARK: - Extension

extension StudentViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sorted.count
    }
    
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sorted = sordtStudents.keys.sorted()
        return sorted[section]
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let student = sordtStudents[sorted[section]] as? [Students] else {
            return 0 }
        return student.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTreeTableViewCell")     as? TaskTreeTableViewCell,
              let students = sordtStudents[sorted[indexPath.section]] as? [Students] else {
            return UITableViewCell()
        }
        
        cell.setLabels(name: students[indexPath.row].name, avgMark: students[indexPath.row].avgMark)
        
        return cell
    }
    
    
    
}


extension StudentViewController: UITableViewDelegate {
    
    
}

//: Playground - noun: a place where people can play

import Foundation

struct date {
    var day : Int
    var month : Int
    var year : Int
}
class People {
    // static var count: Int
    internal var name: String
    internal var idCode: Int
    internal var birthday: date
    init(name:String,idCode:Int,birthday :date) {
        //        var count+=count+1
        self.name = name
        self.idCode = idCode
        self.birthday = birthday
    }
    func getPeople() -> String {
        return " Name: \(name) \n Code ID: \(idCode) \n Birthday: \(birthday.day) / \(birthday.month) / \(birthday.year) "
    }
    
    func setPeople(name: String, birthday: date, idCode: Int) {
        self.name = name
        self.birthday = birthday
        self.idCode = idCode
    }
    func PrintInfo() {
        print("NAME: \(name)")
        print("ID CODE: \(idCode)")
        print("BIRTHDAY: \(birthday.day) / \(birthday.month) / \(birthday.year)")
    }
}
class  Staff: People {
    internal var idDepartment: Int
    internal var joinedDate: date
    internal var level: Int
    
    enum Level: Int {
        case hieutruong
        case hieupho
        case truongkhoa
        case trogiang
        case giangvien
        
        var chucdanh: String {
            switch self {
            case .hieutruong:
                return "Hieu Truong"
            case .hieupho:
                return "Hieu Pho"
            case .truongkhoa:
                return "Truong Khoa"
            case .trogiang:
                return "Tro Giang"
            case .giangvien:
                return "Giang Vien"
            }
        }
    }
    var checkStaff = 0
    func checkLevel(level: Int) -> Level {
        checkStaff += 1
        guard let levelStaff = Level(rawValue: checkStaff) else {
            switch checkStaff {
            case 4:
                return .hieutruong
            case 3:
                return .hieupho
            case 2:
                return .truongkhoa
            case 1:
                return .trogiang
            default:
                return .giangvien
            }
        }
        
        return levelStaff
    }
    init(name: String,  idCode: Int,birthday: date, idDepartment: Int, joinedDate: date, level: Int) {
        self.idDepartment = idDepartment
        self.joinedDate = joinedDate
        self.level = level
        super.init(name: name, idCode: idCode, birthday: birthday)
    }
    func getDepartment() -> String {
        return "Department ID: \(idDepartment) \n Joined Date: \(joinedDate.day) / \(joinedDate.month) / \(joinedDate.year)\n Level: \(level)"
    }
    func setDepartment(idDepartment: Int, joinedDate: date, level: Int) {
        self.idDepartment = idDepartment
        self.joinedDate = joinedDate
        self.level = level
    }
    override func PrintInfo() {
        super.PrintInfo()
        print("Department ID: \(idDepartment)")
        print("Joined Date: \(joinedDate.day) / \(joinedDate.month) / \(joinedDate.year)")
        print("Level: (\(level) - \(checkLevel(level: level).chucdanh))")
    }
    
}
//let birthday = date(day: 4, month: 3, year: 2004)
//let jonededday = date(day: 4, month: 12, year: 2004)
//
//
//let c = staff(name: "Hien", idCode: 323, birthday: birthday, idDepartment: 943, joinedDate: jonededday, level: 2)
//c.PrintInfo()


class Student: People {
    private var grade: Int
    private var numberOfProject: Int
    private var scoreOfEachProject: [Int]
    
    init(name: String, birthday: date, idCode: Int, grade: Int, numberOfProject: Int, scoreOfEachProject: [Int]) {
        self.grade = grade
        self.numberOfProject = scoreOfEachProject.count
        self.scoreOfEachProject = scoreOfEachProject
        super.init(name: name,idCode: idCode, birthday: birthday )
    }
    
    func setStudent(grade:Int,numberOfProject:Int,scoreOfEachProject:[Int]) {
        self.grade = grade
        self.numberOfProject = numberOfProject
        self.scoreOfEachProject = scoreOfEachProject
        
    }
    func getStudent() -> String {
        return "Grade: \(grade) \n Number Of Project: \(numberOfProject) \n Score Of Each Project: \(scoreOfEachProject)"
    }
    
    func calculateAverageScore(student: Student) -> Float {
        var average:Int = 0
        let scoreOfEachProject = student.scoreOfEachProject
        for item in scoreOfEachProject {
            average += item
        }
        return Float(average) / Float(scoreOfEachProject.count)
    }
    
    override func PrintInfo() {
        super.PrintInfo()
        print("Grade: \(grade)")
        print("Number Of Project: \(numberOfProject)")
        print("Score Of Each Project:\(scoreOfEachProject)")
        print("         ----------****----------         ")
        
    }
    
}
//    let birthday2 = date(day: 4, month: 3, year: 2004)
let st1 = Student(name: "Hien", birthday: date(day: 4, month: 3, year: 2004), idCode: 432, grade: 2, numberOfProject: 5, scoreOfEachProject: [3,5,6,7,8])
//    st1.PrintInfo()
//    st1.calculateAverageScore(student: st1)
enum Subject: Int {
    case MATHS
    case PHYS
    case ENGLISH
    
    var monhoc: String {
        switch self {
        case .MATHS:
            return "MATHS"
        case .PHYS:
            return "PHYS"
        case .ENGLISH:
            return "ENGLISH"
        }
    }
}

enum SecondSubject: Int {
    case MATHS
    case PHYS
    case ENGLISH
    
    var monhoc: String {
        switch self {
        case .MATHS:
            return "Maths"
        case .PHYS:
            return "PHYS"
        case .ENGLISH:
            return "ENGLISH"
        }
    }
}
class Teacher: Staff {
    private var classAT: Int
    private var subject: String
    private var secondSubject: String
    
    
    init(name: String, idCode: Int, birthday: date, classAT: Int, subject: String, secondSubject: String, idDepartment: Int, joinedDate: date, level: Int) {
        self.classAT = classAT
        self.subject = subject
        self.secondSubject = secondSubject
        super.init(name: name, idCode: idCode, birthday: birthday, idDepartment: idDepartment, joinedDate: joinedDate, level: level)
    }
    
    
    func getTeacher() -> String {
        return "Class: \(classAT) \n Subject: \(subject)\n Second Subject: \(secondSubject)"
    }
    
    func setTeacher(classAT: Int, subject: String, secondSubject: String) {
        self.classAT = classAT
        self.subject = subject
        self.secondSubject = secondSubject
    }
    
    override func PrintInfo() {
        super.PrintInfo()
        print("Class: \(classAT)")
        print("Subject: \(subject)")
        print("Second Subject: \(secondSubject)")
    }
    
}




//    func randomName(_ n: Int) -> String
//    {
//        let a = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"
//
//        var s = ""
//
//        for _ in 0..<n
//        {
//            let r = Int(arc4random_uniform(UInt32(a.characters.count)))
//
//            s += String(a[a.index(a.startIndex, offsetBy: r)])
//        }
//
//        return s
//    }
func random(min: Int, max: Int) -> Int {
    return Int(min + Int(arc4random_uniform(UInt32(max - min + 1))))
}
var listFirstName: [String] = ["Trương", "Trần", "Trưng", "Trịnh", "Trang", "Trùm"]
var listLastName: [String] = ["Hiền", "Hải", "Huy", "Hưng", "Hoàng", "Hồng"]

func createName() -> String {
    return "\(listFirstName[random(min: 0, max: listFirstName.count - 1)]) \(listLastName[random(min: 0, max: listLastName.count - 1)])"
}
func dayInMonth(month: Int, year: Int) -> Int {
    switch month {
    case 4, 6, 9, 11:
        return 30
    case 1, 3, 5, 7, 8, 10, 12:
        return 31
    default:
        return (year % 4 == 0) || (year % 400 == 0 && year % 100 != 0) ? 29 : 28
    }
}
func createBirthday() -> date {
    let month = random(min: 1, max: 12)
    let year = random(min: 1900, max: 2000)
    return date(day: dayInMonth(month: month, year: year), month: month, year: year)
}
func createJoinedDateStaff() -> date {
    let month = random(min: 1, max: 12)
    let year = random(min: 2012, max: 2018)
    return date(day: dayInMonth(month: month, year: year), month: month, year: year)
}
extension Array {
    var shuffled: Array {
        var elements = self
        return elements.shuffle()
    }
    @discardableResult
    mutating func shuffle() -> Array {
        let count = self.count
        indices.lazy.dropLast().forEach {
            swapAt($0, Int(arc4random_uniform(UInt32(count - $0))) + $0)
        }
        return self
    }
    func choose(_ n: Int) -> Array { return Array(shuffled.prefix(n)) }
}
var scores = Array(0...9)
let shuffledScore = scores.shuffled

func createGrade() -> Int {
    return random(min: 1, max: 12)
}


func createlevel() -> Int {
    return random(min: 1, max: 4)
}

func createClassAT() -> Int {
    return random(min: 1, max: 12)
}

func createSubject() -> Subject {
    let randomSubject = random(min: 1, max: 3)
    guard let rs = Subject(rawValue: randomSubject)  else {
        return .MATHS
    }
    return rs
}

func createSecondSubject() -> SecondSubject {
    let rand = random(min: 1, max: 3)
    guard let rs = SecondSubject(rawValue: rand)  else {
        return .MATHS
    }
    return rs
}
func createNumberOfProject() -> Int {
    return random(min: 1, max: 15)
}
func createScoreOfEachProject() -> [Int] {
    return scores.choose(createNumberOfProject())
}
var n = createNumberOfProject()
let randomScores = scores.choose(n)
//func createData() -> [People] {
//    var result: [People] = []
//    for indexPeople in 0...5 {
//        let staff = Student(name: createName(), birthday: createBirthday(), idCode: indexPeople, grade:3.0, numberOfProject:n, scoreOfEachProject: randomScores)
//        result.append(contentsOf: staff)
//    }
//    return result
//}
var peoples: [People] = []

func createData() {
    for idStaff in 1...5 {
        let staff = Staff(name: createName(), idCode: idStaff, birthday: createBirthday(), idDepartment: idStaff, joinedDate: createJoinedDateStaff(), level: createlevel())
        peoples.append(staff)
    }
    for idStudent in 1...5 {
        let student = Student(name: createName(), birthday: createBirthday(), idCode: idStudent, grade: createGrade(), numberOfProject: createNumberOfProject(), scoreOfEachProject: randomScores)
        peoples.append(student)
    }
    for idTeacher in 1...5{
        let teacher = Teacher(name: createName(), idCode: idTeacher, birthday: createBirthday(), classAT: createClassAT(), subject: createSubject().monhoc, secondSubject: createSecondSubject().monhoc, idDepartment: idTeacher, joinedDate: createJoinedDateStaff(), level: createlevel())
        peoples.append(teacher)
    }
 
    peoples.count
//    for student in listStudent {
//        let s = (student.calculateAverageScore(student: student))
//        if s > 5 {
//            student.PrintInfo()
//        }
//    }
}

createData()
for people in peoples {
    if let student = people as? Student {
        let s = (student.calculateAverageScore(student: student))
        if s > 5 {
            student.PrintInfo()
        }
        
            }
}








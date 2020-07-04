 
struct DoctorModel: Codable {
	var pending : [Doctor]?
	var approved : [Doctor]?
 }
 
 struct Doctor : Codable {
    var id : Int?
    var name : String?
    var civil_id : String?
    var age : String?
    var address : String?
    var phone_number : String?
    var speciality : String?
    var image : String?
    var status : Int?
    
 }

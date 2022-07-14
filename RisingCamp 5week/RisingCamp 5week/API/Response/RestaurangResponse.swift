import Alamofire

// MARK: - RestaurantResponse
struct RestaurangResponse: Decodable {
    var body: [Body]
    var header: Header
}

// MARK: - Body
struct Body: Decodable {
    var sigun: Sigun
    var lo: Double
    var mnmnu: String
    var se: SE
    var cmpnm: String
    var menu: String
    var telno: String
    var url: String
    var adres: String
    var la: Double
    var time, dc: String

    enum CodingKeys: String, CodingKey {
        case sigun = "SIGUN"
        case lo = "LO"
        case mnmnu = "MNMNU"
        case se = "SE"
        case cmpnm = "CMPNM"
        case menu = "MENU"
        case telno = "TELNO"
        case url = "_URL"
        case adres = "ADRES"
        case la = "LA"
        case time = "TIME"
        case dc = "DC"
    }
}

enum SE: String, Decodable {
    case 밥맛좋은집 = "밥맛좋은집"
}

enum Sigun: String, Decodable {
    case 보은군 = "보은군"
    case 옥천군 = "옥천군"
}

// MARK: - Header
struct Header: Decodable {
    var perPage: Int?
    var resultCode: String
    var totalRows, currentPage: Int
    var resultMsg: String?
}

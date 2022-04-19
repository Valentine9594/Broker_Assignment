//
//  Models.swift
//  BrokerNetwork
//
//  Created by neosoft on 18/04/22.
//

import Foundation

struct APIData{
    var cards: [Cards]?
    
    enum codingKeys: String, CodingKey{
        case cards = "cards"
    }
}

extension APIData: Decodable{
    init(from decoder: Decoder) throws {
        let codingKeysValue = try decoder.container(keyedBy: codingKeys.self)
        cards = try codingKeysValue.decodeIfPresent([Cards].self, forKey: .cards)
    }
}

struct Cards {
    var data: CardData?
    
    enum codingKeys: String, CodingKey{
        case data = "data"
    }
}

extension Cards: Decodable{
    init(from decoder: Decoder) throws {
        let codingKeysValue = try decoder.container(keyedBy: codingKeys.self)
        data = try codingKeysValue.decodeIfPresent(CardData.self, forKey: .data)
    }
}

struct CardData{
    var totalMatchesCount: Int?
    var mainPost: MainPost?
    var horizontalCards: [HorizontalCards]?
    
    enum codingKeys: String, CodingKey{
        case totalMatchesCount = "total_matches_count"
        case mainPost = "main_post"
        case horizontalCards = "horizontal_cards"
    }
}

extension CardData: Decodable{
    init(from decoder: Decoder) throws {
        let codingKeysValue = try decoder.container(keyedBy: codingKeys.self)
        totalMatchesCount = try codingKeysValue.decodeIfPresent(Int.self, forKey: .totalMatchesCount)
        mainPost = try codingKeysValue.decodeIfPresent(MainPost.self, forKey: .mainPost)
        horizontalCards = try codingKeysValue.decodeIfPresent([HorizontalCards].self, forKey: .horizontalCards)
    }
}

struct MainPost{
    var uuid: String?
    var type: Type?
    var title: String?
    var subInfo: [SubInfoInMainPost]?
    var postUUID: String?
    var maxBudget: Int?
    var matchCount: Int?
    var info: String?
    var assignedTo: AssignedTo?
    
    enum codingKeys: String, CodingKey{
        case uuid = "uuid"
        case type = "type"
        case title = "title"
        case subInfo = "sub_info"
        case postUUID = "post_uuid"
        case maxBudget = "max_budget"
        case matchCount = "match_count"
        case info = "info"
        case assignedTo = "assigned_to"
    }
}

extension MainPost: Decodable{
    init(from decoder: Decoder) throws {
        let codingKeysValue = try decoder.container(keyedBy: codingKeys.self)
        uuid = try codingKeysValue.decodeIfPresent(String.self, forKey: .uuid)
        type = try codingKeysValue.decodeIfPresent(Type.self, forKey: .type)
        title = try codingKeysValue.decodeIfPresent(String.self, forKey: .title)
        subInfo = try codingKeysValue.decodeIfPresent([SubInfoInMainPost].self, forKey: .subInfo)
        postUUID = try codingKeysValue.decodeIfPresent(String.self, forKey: .postUUID)
        maxBudget = try codingKeysValue.decodeIfPresent(Int.self, forKey: .maxBudget)
        matchCount = try codingKeysValue.decodeIfPresent(Int.self, forKey: .matchCount)
        info = try codingKeysValue.decodeIfPresent(String.self, forKey: .info)
        assignedTo = try codingKeysValue.decodeIfPresent(AssignedTo.self, forKey: .assignedTo)
    }
}

struct Type{
    var name: String?
    var id: String?
    
    enum codingKeys: String, CodingKey{
        case id = "id"
        case name = "name"
    }
}

extension Type: Decodable{
    init(from decoder: Decoder) throws {
        let codingKeysValue = try decoder.container(keyedBy: codingKeys.self)
        id = try codingKeysValue.decodeIfPresent(String.self, forKey: .id)
        name = try codingKeysValue.decodeIfPresent(String.self, forKey: .name)
    }
}

struct SubInfoInMainPost{
    var text: String?
    
    enum codingKeys: String, CodingKey{
        case text = "text"
    }
}

extension SubInfoInMainPost: Decodable{
    init(from decoder: Decoder) throws {
        let codingKeysValue = try decoder.container(keyedBy: codingKeys.self)
        text = try codingKeysValue.decodeIfPresent(String.self, forKey: .text)
    }
}

struct SubInfoInHorizontalCards{
    var text: String?
    var perfectMatch: Bool?
    
    enum codingKeys: String, CodingKey{
        case text = "text"
        case perfectMatch = "perfect_match"
    }
}

extension SubInfoInHorizontalCards: Decodable{
    init(from decoder: Decoder) throws {
        let codingKeysValue = try decoder.container(keyedBy: codingKeys.self)
        text = try codingKeysValue.decodeIfPresent(String.self, forKey: .text)
        perfectMatch = try codingKeysValue.decodeIfPresent(Bool.self, forKey: .perfectMatch)
    }
}

struct AssignedTo{
    var uuid: String?
    var profilePictureURL: String?
    var phoneNumber: String?
    var orgName: String?
    var name: String?
    
    enum codingKeys: String, CodingKey{
        case uuid = "uuid"
        case profilePictureURL = "profile_pic_url"
        case phoneNumber = "phone_number"
        case orgName = "org_name"
        case name = "name"
    }
}

extension AssignedTo: Decodable{
    init(from decoder: Decoder) throws {
        let codingKeysValue = try decoder.container(keyedBy: codingKeys.self)
        uuid = try codingKeysValue.decodeIfPresent(String.self, forKey: .uuid)
        profilePictureURL = try codingKeysValue.decodeIfPresent(String.self, forKey: .profilePictureURL)
        phoneNumber = try codingKeysValue.decodeIfPresent(String.self, forKey: .phoneNumber)
        orgName = try codingKeysValue.decodeIfPresent(String.self, forKey: .orgName)
        name = try codingKeysValue.decodeIfPresent(String.self, forKey: .name)
    }
}

struct HorizontalCards{
    var uuid: String?
    var type: Type?
    var title: String?
    var subInfo: [SubInfoInHorizontalCards]?
    var postUUID: String?
    var price: Int?
    var info: String?
    var assignedTo: AssignedTo?
    
    enum codingKeys: String, CodingKey{
        case uuid = "uuid"
        case type = "type"
        case title = "title"
        case subInfo = "sub_info"
        case postUUID = "post_uuid"
        case price = "price"
        case info = "info"
        case assignedTo = "assigned_to"
    }
}

extension HorizontalCards: Decodable{
    init(from decoder: Decoder) throws {
        let codingKeysValue = try decoder.container(keyedBy: codingKeys.self)
        uuid = try codingKeysValue.decodeIfPresent(String.self, forKey: .uuid)
        type = try codingKeysValue.decodeIfPresent(Type.self, forKey: .type)
        title = try codingKeysValue.decodeIfPresent(String.self, forKey: .title)
        subInfo = try codingKeysValue.decodeIfPresent([SubInfoInHorizontalCards].self, forKey: .subInfo)
        postUUID = try codingKeysValue.decodeIfPresent(String.self, forKey: .postUUID)
        price = try codingKeysValue.decodeIfPresent(Int.self, forKey: .price)
        info = try codingKeysValue.decodeIfPresent(String.self, forKey: .info)
        assignedTo = try codingKeysValue.decodeIfPresent(AssignedTo.self, forKey: .assignedTo)
    }
}

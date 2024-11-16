//
//  DataModel.swift
//  Home
//
//  Created by admin12 on 07/11/24.
//

import Foundation
import UIKit

// Model for Category items
struct Category {
    let title: String
    let imageName: String
}

// Model for the Products
struct Product {
    let name: String
    let type: String
    let cost: String
    let rating: Double
    let imageName: String
}


// Model for Skin Insights
struct SkinInsight {
    let title: String
    let imageName: String
    let description: String
    let url: String
}

// Model for Interesting Articles
struct Article {
    let title: String
    let imageName: String
    let description: String
    let url: String
}


var categories = [
        Category(title: "Cream", imageName: "cream"),
        Category(title: "Serum", imageName: "serum"),
        Category(title: "Lotion", imageName: "lotion"),
        Category(title: "Toner", imageName: "toner")
    ]

var skinInsights = [
    SkinInsight(title: "Foods to Beautify You", imageName: "insights1",description: "Winter’s cold, dry air and low humidity can leave any skin type—whether dry, normal, or oily—feeling dehydrated, tight, and sensitive, with symptoms like flaking, redness, or darkening. The reflective snow also increases UV exposure, making sunscreen essential for winter skincare.",url:"https://tinyurl.com/article1-radiance"),
    SkinInsight(title: "Proper Skin Routine", imageName: "insights2",description: "Winter’s cold, dry air and low humidity can leave any skin type—whether dry, normal, or oily—feeling dehydrated, tight, and sensitive, with symptoms like flaking, redness, or darkening. The reflective snow also increases UV exposure, making sunscreen essential for winter skincare.",url: "https://tinyurl.com/article1-radiance")
    ]

var articles = [
    Article(title: "Winter Skincare", imageName: "article1",description: "Winter’s cold, dry air and low humidity can leave any skin type—whether dry, normal, or oily—feeling dehydrated, tight, and sensitive, with symptoms like flaking, redness, or darkening. The reflective snow also increases UV exposure, making sunscreen essential for winter skincare.",url: "https://tinyurl.com/article1-radiance"),
    Article(title: "Summer Skin Protection", imageName: "article2",description: "Winter’s cold, dry air and low humidity can leave any skin type—whether dry, normal, or oily—feeling dehydrated, tight, and sensitive, with symptoms like flaking, redness, or darkening. The reflective snow also increases UV exposure, making sunscreen essential for winter skincare.",url: "https://tinyurl.com/article1-radiance")
    ]


var recommendedProducts = [
    Product(name: "The Derm Co Sunscreen SPF 50", type: "Sunscreen SPF 50", cost: "INR 15", rating: 4.5, imageName: "sunscreen"),
    Product(name: "Deconstruct Serum", type: "Hydrating Serum", cost: "INR 25", rating: 4.8, imageName: "serum"),
    Product(name: "Cetaphil Moisturizing Cream", type: "Moisturizing Cream", cost: "INR 20", rating: 4.2, imageName: "cream")
]



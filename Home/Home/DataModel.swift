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
    let itemType: String
    let cost: String
    let rating: Float // Average rating (e.g., 4.5)
    let imageName: String
    let ingredients: [Ingredient]
    let benefits: String
    let numberOfReviews: Int
}

// Model for Ingredients
struct Ingredient {
    var name: String
    var riskLevel: Int // 1 for low, 2 for medium, 3 for high
}

// Model for Reviews
struct Review {
    let author: String
    let rating: Double
    let comment: String
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

// Model for Risk Level
enum RiskLevel {
    case low
    case moderate
    case high
}


var categories = [
        Category(title: "Cream", imageName: "cream"),
        Category(title: "Serum", imageName: "serum"),
        Category(title: "Lotion", imageName: "lotion"),
        Category(title: "Toner", imageName: "toner")
    ]

var skinInsights = [
    SkinInsight(
        title: "Foods to Beautify You",
        imageName: "insights1",
        description: "Winter’s cold, dry air and low humidity can leave any skin type—whether dry, normal, or oily—feeling dehydrated, tight, and sensitive, with symptoms like flaking, redness, or darkening. The reflective snow also increases UV exposure, making sunscreen essential for winter skincare.",
        url:"https://tinyurl.com/article1-radiance"),
    SkinInsight(
        title: "Proper Skin Routine",
        imageName: "insights2",
        description: "Winter’s cold, dry air and low humidity can leave any skin type—whether dry, normal, or oily—feeling dehydrated, tight, and sensitive, with symptoms like flaking, redness, or darkening. The reflective snow also increases UV exposure, making sunscreen essential for winter skincare.",
        url: "https://tinyurl.com/article1-radiance")
    ]

var articles = [
    Article(
        title: "Winter Skincare",
        imageName: "article1",
        description: "Winter’s cold, dry air and low humidity can leave any skin type—whether dry, normal, or oily—feeling dehydrated, tight, and sensitive, with symptoms like flaking, redness, or darkening. The reflective snow also increases UV exposure, making sunscreen essential for winter skincare.",
        url: "https://tinyurl.com/article1-radiance"),
    Article(
        title: "Summer Skin Protection",
        imageName: "article2",
        description: "Winter’s cold, dry air and low humidity can leave any skin type—whether dry, normal, or oily—feeling dehydrated, tight, and sensitive, with symptoms like flaking, redness, or darkening. The reflective snow also increases UV exposure, making sunscreen essential for winter skincare.",
        url: "https://tinyurl.com/article1-radiance")
    ]


var Ingredient1 = Ingredient(name: "Water", riskLevel: 1),
    Ingredient2 = Ingredient(name: "Aloe Vera", riskLevel: 9),
    Ingredient3 = Ingredient(name: "Sodium", riskLevel: 7),
    Ingredient4 = Ingredient(name: "Sulfur", riskLevel: 8),
    Ingredient5 = Ingredient(name: "Potassium", riskLevel: 3)

var allProducts = [
    Product(
        name: "The Derm Co Sunscreen SPF 50",
        type: "Sunscreen SPF 50",
        itemType: "Cream",
        cost: "INR 15",
        rating: 4.5,
        imageName: "sunscreen",
        ingredients: [Ingredient1, Ingredient2],
        benefits: "2-IN-1 PROTECTS SKIN + BOOSTS GLOW - Packed with SPF 50 PA+++, for even-toned & glowing which protects skin every day. Prevents tanning & gives skin glow.",
        numberOfReviews: 250
    ),
    Product(
        name: "Deconstruct Serum",
        type: "Serum",
        itemType: "Serum",
        cost: "INR 25",
        rating: 4.8,
        imageName: "serum 1",
        ingredients: [Ingredient1,Ingredient2,Ingredient3,Ingredient4],
        benefits: "Good Benifits",
        numberOfReviews: 200
    ),
    Product(
        name: "Cetaphil Moisturizing Cream",
        type: "Cream",
        itemType: "Cream",
        cost: "INR 20",
        rating: 4.2,
        imageName: "moisturizer",
        ingredients: [Ingredient1,Ingredient3,Ingredient5],
        benefits: "Good",
        numberOfReviews: 140
    )
]


var cleanProducts = [
    Product(
        name: "The Derm Co Sunscreen SPF 50",
        type: "Sunscreen SPF 50",
        itemType: "Cream",
        cost: "INR 15",
        rating: 4.5,
        imageName: "sunscreen",
        ingredients: [],
        benefits: "Good Benifits",
        numberOfReviews: 250
    ),
    Product(
        name: "Deconstruct Serum",
        type: "Serum",
        itemType: "Serum",
        cost: "INR 25",
        rating: 4.8,
        imageName: "serum 1",
        ingredients: [],
        benefits: "Good Benifits",
        numberOfReviews: 200
    ),
    Product(
        name: "Cetaphil Moisturizing Cream",
        type: "Cream",
        itemType: "Cream",
        cost: "INR 20",
        rating: 4.2,
        imageName: "moisturizer",
        ingredients: [],
        benefits: "Good",
        numberOfReviews: 140
    )
]



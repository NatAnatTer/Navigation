//
//  Post.swift
//  Navigation
//
//  Created by Наталья Терзьян on 15.01.2023.
//

import Foundation

struct Post{
    let author: String
    let description: String
    let image: String
    let likes: Int
    let views: Int
    
    init(author: String, description: String, image: String, likes: Int, views: Int) {
        self.author = author
        self.description = description
        self.image = image
        self.likes = likes
        self.views = views
    }
    
}

let postOne = Post(author: "Natalia", description: "Сложнее всего начать действовать, все остальное зависит только от упорства.", image: "postOne", likes: 400, views: 100)
let postTwo = Post(author: "Artem", description: "Логика может привести Вас от пункта А к пункту Б, а воображение — куда угодно.", image: "postTwo", likes: 500, views: 200)
let postThree = Post(author: "Svetlana", description: "Все дело в мыслях. Мысль — начало всего. И мыслями можно управлять. И поэтому главное дело совершенствования: работать над мыслями.", image: "postThree", likes: 600, views: 300)
let postFour = Post(author: "Vladimir", description: "Не говори: здесь линии одни. На их игру внимательно взгляни", image: "postFour", likes: 700, views: 400)

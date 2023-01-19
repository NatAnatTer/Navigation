//
//  Post.swift
//  Navigation
//
//  Created by Наталья Терзьян on 15.01.2023.
//

import Foundation

struct Post{
    let author: String
    let descriptionOfPost: String
    let imageOfPost: String
    let likes: Int
    let views: Int
    
    init(author: String, descriptionOfPost: String, imageOfPost: String, likes: Int, views: Int) {
        self.author = author
        self.descriptionOfPost = descriptionOfPost
        self.imageOfPost = imageOfPost
        self.likes = likes
        self.views = views
    }
    
}

let postOne = Post(author: "Asynchronously Loading Images into Table and Collection Views", descriptionOfPost: "Сложнее всего начать действовать, все остальное зависит только от упорства.", imageOfPost: "postOne", likes: 400, views: 100)
let postTwo = Post(author: "Artem", descriptionOfPost: "Логика может привести Вас от пункта А к пункту Б, а воображение — куда угодно.", imageOfPost: "postTwo", likes: 500, views: 200)
let postThree = Post(author: "Svetlana", descriptionOfPost: "Все дело в мыслях. Мысль — начало всего. И мыслями можно управлять. И поэтому главное дело совершенствования: работать над мыслями.", imageOfPost: "postThree", likes: 600, views: 300)
let postFour = Post(author: "Vladimir", descriptionOfPost: "Не говори: здесь линии одни. На их игру внимательно взглянию Change the height of rowsю A table view tracks the height of rows separately from the cells that represent them. UITableView provides default sizes for rows, but you can override the default height by assigning a custom value to the table view’s rowHeight property. Always use this property when the height of all of your rows is the same. Doing so is more efficient than returning the height values from your delegate object.", imageOfPost: "postFour", likes: 700, views: 400)

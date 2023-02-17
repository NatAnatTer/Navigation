//
//  DataFilePost.swift
//  Navigation
//
//  Created by Наталья Терзьян on 08.02.2023.
//

import Foundation

enum Strings{
    case yes
    case no
    case deletePost
    case didntDeletePost
    case deletedPost
    case delPost
    case postOne
    case postTwo
    case navItemTitle
    case tabBarFirst
    case tabBarSecond
    case tabBarTitleLine
    case tabBarTitleProfile
    case iconHome
    case iconPerson
}

func getStrings(stringsEnum: Strings) -> String{
    switch stringsEnum{
    case .yes:
        return "Да"
    case .no:
        return "Нет"
    case .deletePost:
        return "Хотите удалить пост?"
    case .didntDeletePost:
        return "Не стали удалять пост"
    case .deletedPost:
        return "Удалили пост"
    case .delPost:
        return "Удалить пост"
    case .postOne:
        return "Пост"
    case .postTwo:
        return "Пост 2"
    case .navItemTitle:
        return "Лента"
    case .tabBarFirst:
        return "FirstNC"
    case .tabBarSecond:
        return "SecondNC"
    case .tabBarTitleLine:
        return "Лента"
    case .tabBarTitleProfile:
        return "Профиль"
    case .iconHome:
        return "house"
    case .iconPerson:
        return "person.circle"
        
    }
    
}

enum SizesOfElements{
    case fontSize20
    case cornerRadius12
    case stackSpacing
    case fontSize14
    case fontSize16
}

func getSizesOfElements(sizeEnum: SizesOfElements) -> Int{
    switch(sizeEnum){
    case .fontSize20:
        return 20
    case .cornerRadius12:
        return 12
    case .stackSpacing:
        return 10
    case .fontSize14:
        return 14
    case .fontSize16:
        return 16
    }
}


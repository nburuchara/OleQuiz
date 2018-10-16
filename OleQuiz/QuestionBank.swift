//This file will be used to store all of the questions we use in our quiz app. They will all be formatted using the QUESTION class!

import Foundation


class QuestionBank {
    // First we need to create an array of which will hold our questions.
    // We have created an array of question texts that have answers (from Formar of our question class)
    var list = [Question]()   // we can create arrays using data types, this can include classes

    // The intitializaiton method here i DIFFERENT from the Question class:
    init () {
        
        

        // number of questions: 20
        let item = Question(text: "Stav Hall closes at 10am on regular weekdays.", correctAnswer: false)
        list.append(item)
        
        list.append(Question(text: "Public Safety's extension is 3666.", correctAnswer: true))
        
        list.append(Question(text: "PAC stands for \"People Are Communists\".", correctAnswer: false))
        
        list.append(Question(text: "Regents (Science) has a 5th floor.", correctAnswer: true))
        
        list.append(Question(text: "It can snow in October in Minnesota.", correctAnswer: true))
        
        list.append(Question(text: "Boe House is not on Ole Ave.", correctAnswer: false))
        
        list.append(Question(text: "There is a course in American Studies called \"Great Again? American Fictions\"", correctAnswer: true))
        
        list.append(Question(text: "Aldi is cheaper than Target & Cub foods.", correctAnswer: true))
        
        list.append(Question(text: "PDA has books that are free to the public in his fancy PO box outside his house", correctAnswer: true))
        
        list.append(Question(text: "The Wellness Center is in Buntrock Commons", correctAnswer: true))
        
        list.append(Question(text: "The walk from Rand to Buntrock is further than the walk from Kittelsby to Buntrock", correctAnswer: true))
        
        list.append(Question(text: "Larson has a secret 13th floor.", correctAnswer: false))
        
        list.append(Question(text: "Carleton is better than St. Olaf", correctAnswer: false))
        
        list.append(Question(text: "Aaker House is not opposite Forest Inn.", correctAnswer: false))
        
        list.append(Question(text: "The cage serves Sushi", correctAnswer: true))
        


    }
    
}

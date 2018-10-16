//NOTES:
/*
    - When setting varibales that are uninitialized. We can use initializers (similar to contructors) to give them functionality instead of resorting to inline intitializers.
*/

import Foundation

// Blueprint for what a question should look like.
class Question {
    
    let questionText : String
    let answer : Bool
    
    init (text : String, correctAnswer : Bool) {
        questionText = text
        answer = correctAnswer
    }
}

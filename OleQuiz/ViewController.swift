// NOTES:
/*
    1. Changing color of Status Bar:
        - In order to do this on the 'General' page select 'Light'. The open Info.plist and add a Dictionary that is named 'View controller-based status bar appearance' and set the Boolean to 'No'. This ensures that each app looks into the View Controller to see what the Status Bar's style should be - so you could add code to the VC to manipulate this - but the SHORTCUT is to manipulate the settings in the General tab.
 
    2. Labels:
        - It is good practice to input the LARGEST POSSIBLE number in labels in order to have a good idea of the largest size that the label will be.
 
    3. Model View Controller:
        - Adds structure to code - especially useful when code gets long and more complex!
        - Recognizable by other programmers
        - Allows for code reuse (code flixibility) - can EASILY CHANGE DATA without affecting the veiw.
        - Allows for Multitasking
        1. Model (chef): A structure the manages the data - responsible for CREATING entries into the database, READING from the databse or DELETING information from the databse. The model grabs data from the database and structures it in a way that is readable by the controller
        2. View (food on tbale): this is the information that gets displayed to the user.
        3. Controller (waiter): This is the middle ground between the view and the model.
 
    4. NOTE TO SELF:
        - Be detailed and intentional with the code you write, because as you continue to develop the app you will find that some code will write itself (e.g. variables will just slip into their designated place) IF you write clear and readable code along the way
 
    5. Alerts:
 - In order to get an alert we need to call upon UIAlertoController. The parameters within this functions are as follows:
    1. Title - This determined the actual title of the alert
    2. Message - This determined what message will be shown in the alert box
    3. Prefered Style - determined the UIAlertController style of the alert, either ACTION SHEET / MODAL ALERT
        1. Modal Alert - the usual alert in the middle of the screen (.alert)
        2. Aciton Sheet - this pops up from the bottom of the screen. (.actionSheet)
    4. Next we need to determine what buttons the modal alert will display and save these in constants
 
*/

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestions = QuestionBank() // Creating an boject of the QuestionBank class
    var chosenAnswer : Bool = false // created to store the user's answer, to compare against the actual answer
    var questionNumber : Int = 0 // keeps track of the question the user is on.
    var score: Int = 0 // to keep track of score
    var userPlaying: String = ""
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() { // the first thing the user sees when the app opens
        super.viewDidLoad()
        
        nextQuestion() // shows the first question 
        
    }

    // This is where we connect the buttons to actual functionality
    @IBAction func answerPressed(_ sender: AnyObject) {
        if (sender.tag == 1) {
            chosenAnswer = true;
        } else if (sender.tag == 2) {
            chosenAnswer = false;
        }
        
        checkAnswer() // checks if answer is correct
        questionNumber += 1 // created a variable that increments the questions number - to move to the next question
        
        nextQuestion()
       
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        
            let quitAlert = UIAlertController(title: "Exit Game?", message: "Are you sure you want to quit?", preferredStyle: .alert)
        
            let quitGame = UIAlertAction(title: "Quit", style: .default) { (action) in
                self.dismiss(animated: true, completion: nil)
            }
        
            let continuePlay = UIAlertAction(title: "Keep Playing", style: .default) { (action) in
                
            }
        
            quitAlert.addAction(quitGame)
            quitAlert.addAction(continuePlay)
            present(quitAlert, animated: true, completion: nil)

    }
    


    // updates the score and moves the status bar
    func updateUI() {
        scoreLabel.text = "Score: \(score)" // updates the score
        progressLabel.text = "\(questionNumber + 1) / 15" // updates question number
        progressBar.frame.size.width = (view.frame.size.width / 15 ) * CGFloat(questionNumber + 1)
        
    }
    
    // moves to next question
    func nextQuestion() {
        if questionNumber <= 14 {
             questionLabel.text = allQuestions.list[questionNumber].questionText
             updateUI()
        } else {
            //Setting up the alert contents
            let alert = UIAlertController(title: "Congrats!", message: "You have finished with the questions do you want to start over?", preferredStyle: .alert)
            //Setting up an alert button
            let restartGame = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
                self.startOver() // 'self' is used because this is inside a closure
            })
            // Adds the button to the alert
            alert.addAction(restartGame)
            // Present the alert to the viewer
            present(alert, animated: true, completion: nil)

        }
    }
    
    // displays if answer is correct/incorrect
    func checkAnswer() {
 
        let correctAnswer = allQuestions.list[questionNumber].answer
        if (chosenAnswer == correctAnswer) {
            ProgressHUD.showSuccess("UmmYaYaa")
            score += 1
        } else  {
            ProgressHUD.showError("Incorrect")
        }
    }
    
    func startOver() {
        questionNumber = 0 // restarts the quiz
        score = 0 // sets score to 0
        nextQuestion() 
    }

}

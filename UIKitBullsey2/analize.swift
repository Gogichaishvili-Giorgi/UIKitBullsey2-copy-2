//
//  analize.swift
//  UIKitBullsey2
//
//  Created by Giorgi Gogichaishvili on 11/1/21.
//

import Foundation
/*
 1. let's create button in the center and call it "Hit me!"
 2.let't for better grapic let's change lanscape orientation and hit to Device and choose landscape
 3. It's time to action.. in ViewController file as a method add action code for created button
 @IBAction func showAlert() {
}
 The source code for ViewController.swift should now look like this
 class ViewController: UIViewController {
   override func viewDidLoad() {
 super.viewDidLoad()
 // Do any additional setup after loading the view.
 }
   @IBAction func showAlert() {
 }
 }
 view controllers. The job of a view controller, generally, is to manage a single screen in your app.
 4. It's time to making connections
 Click Main.storyboard to go back into Interface Builder.
 Click the Hit Me button once to select it.
 With the Hit Me button selected, hold down the Control key, click on the button and drag up to the View Controller item in the Document Outline.
 Once you’re on View Controller, let go of the mouse button and a small menu will appear.
 choose showAlert
 In the Sent Events section, the “Touch Up Inside” event is now connected to the showAlert action. You should also see the connection in the Swift file.
 5. You now have a screen with a button. The button is hooked up to an action named showAlert that will be performed when the user taps the button. Currently, however, the action is empty and nothing will happen.
 You need to give the app more instructions.
 In ViewController.swift, modify showAlert to look like the following:
 @IBAction func showAlert() {
 let alert = UIAlertController(title: "Hello, World",
 message: "This is my first
 alert.addAction(action)
 present(alert, animated: true, completion: nil)
 }
 app!",
 let action = UIAlertAction(title: "Awesome", style: .default,
 preferredStyle: .alert) handler: nil)
 The code in showAlert creates an alert with a title “Hello, World,” a message that states, “This is my first app!” and a single button labeled “Awesome.”.
 6. Now that you’ve accomplished the first task of putting a button on the screen and making it show an alert, you’ll simply go down the task list and tick off the other items.
 let's drop down labels buttons and slider like photo.
 7. To switch the app from portrait to landscape, you have to do two things:
 1. Make the view in Main.storyboard landscape instead of portrait.
 2. Change the Supported Device Orientations setting of the app.
 ➤ Open Main.storyboard. In Interface Builder, in the View as: iPhone 8 panel, change Orientation to landscape:
 ➤ Move the button back to the center of the view because an untidy user interface just won’t do in this day and age.
 ➤ Run the app on iPhone 8 Simulator. Note that the screen does not show up as landscape yet, and the button is no longer in the center.
 ➤ Choose Hardware ▸ Rotate Left or Rotate Right from Simulator’s menu bar at the top of the screen, or hold ⌘ and press the left or right Arrow keys on your keyboard. This will flip the simulator around.
 ➤ Click the blue Bullseye project icon at the top of the Project navigator. The editor pane of the Xcode window now reveals a bunch of settings for the project.
 8.Objects
 Think of an object as a building block of your program. Programmers like to group related functionality into objects. This object takes care of parsing a file, that object knows how to draw an image on the screen, and that object over there can perform a difficult calculation.
 Data and methods
 An object can have both data and functionality:
 • An example of data is the Hit Me! button that you added to the view controller earlier. When you dragged the button into the storyboard, it actually became part of the view controller’s data. Data contains something. In this case, the view controller contains the button.
 • An example of functionality is the showAlert action that you added to respond to taps on the button. Functionality does something.
 Adding the other controls
 Your app already has a button, but you still need to add the rest of the UI controls, also known as “views.” Here is the screen again, this time annotated with the different types of views:
 To tweak the settings of these views, you use the Attributes inspector. You can find this inspector in the right-hand pane of the Xcode window:
 Also use the Attributes inspector to configure the slider. Its minimum value should be 1, its maximum 100, and its current value 50.
 value - 50
 minimum - 1
 maximum - 100
 When you’re done, you should have 12 user interface elements in your scene: one slider, three buttons and a whole bunch of labels. Excellent!
 Run the app and play with it for a minute. The controls don’t really do much yet (except for the button that should still pop up the alert), but you can at least drag the slider around.
 
 9.The slider
 ➤ First, go to ViewController.swift and add the following at the bottom, just before the final closing curly bracket:
 @IBAction func sliderMoved(_ slider: UISlider) {
 print("The value of the slider is now: \(slider.value)") }
 10.➤ Second, go to the storyboard and Control-drag from the slider to View controller in the Document Outline. Let go of the mouse button and select sliderMoved: from the pop-up. Done!
 As soon as you start dragging, the Xcode window should open a new pane at the bottom, the Debug area, showing a list of messages:
 If you swipe the slider all the way to the left, you should see the value go down to 1. All the way to the right, the value should stop at 100.
 Creating a variable and functions
 When you read the slider’s value in sliderMoved(), that piece of data disappears when the action method ends. It would be handy if you could remember this value until the user taps the Hit Me! button.
 11.➤ Open ViewController.swift and add the following at the top, directly below the line that says class ViewController:
 var currentValue: Int = 0
 ➤ Change the contents of the sliderMoved() method in ViewController.swift to
 the following:
 12.  @IBAction func sliderMoved(_ slider: UISlider) {
 currentValue = lroundf(slider.value) }
 13. You removed the print() statement and replaced it with this line:
 currentValue = lroundf(slider.value)
 14. ➤ Now change the showAlert() method to the following:
 @IBAction func showAlert() {
 let message = "The value of the slider is: \(currentValue)"
 let alert = UIAlertController(title: "Hello, World",
 message: message,    // changed
 preferredStyle: .alert)
 let action = UIAlertAction(title: "OK", // changed style: .default,
 handler: nil)
 
 iOS Apprentice Chapter 16: Slider & Labels
 alert.addAction(action)
 present(alert, animated: true, completion: nil)
 }
 15. ➤ Run the app, drag the slider and press the button. Now, the alert should show the actual value of the slider.
 16.Think of a reason why the value would be 0 in this particular situation (start the app, don’t move the slider, press the button).
 Answer: The clue here is that this only happens when you don’t move the slider. Of course, without moving the slider the sliderMoved() message is never sent and you never put the slider’s value into the currentValue variable.
 ➤ To fix this bug, change the declaration of currentValue to:
 var currentValue: Int = 50
 Outlets
 17.Improving the slider
 Getting the initial slider value
 To fix this issue once and for all, you’re going to do some work inside the viewDidLoad() method in ViewController.swift. That method currently looks like this:
 ➤ Change viewDidLoad() to the following:
 override func viewDidLoad() { super.viewDidLoad()
 currentValue = lroundf(slider.value) }
 The idea is that you take whatever value is set on the slider in the storyboard (whether it is 50, 1, 100 or anything else) and use that as the initial value of currentValue.
 Unfortunately, Xcode immediately complains about these changes even before you try to run the app.
 The above happens because viewDidLoad() does not know of anything named slider.
 Then why did this work earlier, in sliderMoved()? Let’s take a look at that method again:
 @IBAction func sliderMoved(_ slider: UISlider) {

 Locals
 1. Global scope: These objects exist for the duration of the app and are accessible from anywhere.
 2. Instance scope: This is for variables such as currentValue. These objects are alive for as long as the object that owns them stays alive.
 3. Local scope: Objects with a local scope, such as the slider parameter of sliderMoved(), only exist for the duration of that method. As soon as the execution of the program leaves this method, the local objects are no longer accessible.
 in showAlert() action because
 Because the message, alert, and action objects are created inside the method, they have local scope. They only come into existence when the showAlert() action is performed and they cease to exist when the action is done.
 So, with this newly gained knowledge of variables and their scopes, how do you fix the error that you encountered?
 18. ➤ Add the following line to ViewController.swift:
 @IBOutlet weak var slider: UISlider!
 19. now we have to make a connection slider outlet.
 Click on the open circle next to New Referencing Outlet and drag to View controller:
 In the pop-up that appears, select slider.
 Run the app and immediately press the Hit Me! button. It correctly says: “The value of the slider is: 50.” Stop the app, go into Interface Builder and change the initial value of the slider to something else — say, 25. Run the app again and press the button. The alert should read 25, now.
 Generating the random number
 
 20. ➤ Add a new variable at the top of ViewController.swift, with the other variables:
 var targetValue = 0
 Next, you need to generate the random number. A good place to do this is when the game starts.
 21. ➤ Add the following line to viewDidLoad() in ViewController.swift:
 targetValue = Int.random(in: 1...100)
 The complete viewDidLoad() should now look like this:
 override func viewDidLoad() { super.viewDidLoad()
 currentValue = lroundf(slider.value) targetValue = Int.random(in: 1...100)
 }
 
 Displaying the random number
 22.➤ Change showAlert() to the following:
 @IBAction func showAlert() {
   let message = "The value of the slider is: \(currentValue)" +
 "\nThe target value is: \(targetValue)"
 }
 Adding rounds to the game
 Starting a new round
 23. ➤ With that in mind, add the following new method to ViewController.swift:
 func startNewRound() {
 targetValue = Int.random(in: 1...100)
 currentValue = 50
 slider.value = Float(currentValue)
 }
 
 Using the new method
 ➤ Change viewDidLoad() to:
 override func viewDidLoad() { super.viewDidLoad()
   startNewRound()  // Replace previous code with this
 }
 24. ➤ Make the following change to showAlert():
 @IBAction func showAlert() { ...
   startNewRound()
 }
 25. Calling methods in different ways
 
 Displaying the target value
 26. ➤ In ViewController.swift, add the following line below the other outlet declaration:
 @IBOutlet weak var targetLabel: UILabel!
 27. ➤ In Main.storyboard, click to select the correct label — the one at the very top that
 says “100.”
 28. ➤ Go to the Connections inspector and drag from New Referencing Outlet to the yellow circle at the top of your view controller in the central scene.
 29. ➤ Select targetLabel from the pop-up, and the connection is made.
 Displaying the target value via code
 30. ➤ Add the following method below
 startNewRound() in ViewController.swift:
 func updateLabels() {
targetLabel.text = String(targetValue) }
 
 Calling the method
31. ➤ Change startNewRound() to:
 func startNewRound() {
 targetValue = Int.random(in: 1...100) currentValue = 50
 slider.value = Float(currentValue) updateLabels() // Add this line
 }
 ➤ Run the app and you’ll actually see the random value on the screen. That should make it a little easier to aim for.
 
 Calculating the points scored
 Now that you have both the target value (the random number) and a way to read the slider’s position, you can calculate how many points the player scored.
 32. ➤ Make this change to showAlert():
 @IBAction func showAlert() {
 let difference = abs(targetValue - currentValue) let points = 100 - difference
 let message = "You scored \(points) points" ...
 }
 Showing the total score
 Storing the total score
 33. ➤ Add a new score instance variable to ViewController.swift:
 class ViewController: UIViewController {
   var currentValue: Int = 0
   var targetValue = 0
   var score = 0
 
 Updating the total score
 34➤ Make the following changes:
 @IBAction func showAlert() {
 let difference = abs(targetValue - currentValue) let points = 100 - difference
   score += points        // add this line
 let message = "You scored \(points) points" ...
 }
 Displaying the score
 
 You should have added this line to ViewController.swift:
 35.@IBOutlet weak var scoreLabel: UILabel!
 • Control-click on the object to get a context-sensitive pop-up menu. Then, drag from New Referencing Outlet to View controller (you did this with the slider).
 • Go to the Connections Inspector for the label. Drag from New Referencing Outlet to View controller (you did this with the target label).
 • Control-drag from View controller to the label (give this one a try now) — doing it the other way, Control-dragging from the label to View controller, won’t work.
 36. ➤ Back in ViewController.swift, change updateLabels() to the following:
 func updateLabels() {
 targetLabel.text = String(targetValue)
 scoreLabel.text = String(score) }
 
 One more round...
 37.You should add the following line (or something similar) to ViewController.swift:
 var round = 0
 38. Also, add an outlet for the label:
 @IBOutlet weak var roundLabel: UILabel!
 
 update labels
 39. func updateLabels() {
 targetLabel.text = String(targetValue) scoreLabel.text = String(score)
 roundLabel.text = String(round) // add this line
 }
 40. ➤ Change startNewRound() to:
 func startNewRound() {
   round += 1           // add this line
 targetValue = ... }
 
 Tweaks
 Obviously, the game is not very pretty yet — you will get to work on that soon. In the mean time, there are a few smaller tweaks you can make.
 The alert title
 If the player put the slider right on the target, the alert could say: “Perfect!” If the slider is close to the target but not quite there, it could say, “You almost had it!” If the player is way off, the alert could say: “Not even close...”
 41. You already did that in Section 1, so without further ado here's the updated
 showAlert() method:
 @IBAction func showAlert() {
 let difference = abs(targetValue - currentValue) let points = 100 - difference
 score += points
 // add these lines
 let title: String
 if difference == 0 {
 title = "Perfect!"
 } else if difference < 5 {
 title = "You almost had it!"
 } else if difference < 10 {
 title = "Pretty good!"
 } else {
 title = "Not even close..." }
 let message = "You scored \(points) points"
 let alert = UIAlertController(title: title,  // change this
 message: message,
 preferredStyle: .alert)
 let action = UIAlertAction(title: "OK", style: .default,
 handler: nil)
 alert.addAction(action)
 present(alert, animated: true, completion: nil)
 startNewRound()
}
 Bonus points
 42. @IBAction func showAlert() {
 let difference = abs(targetValue - currentValue)
 var points = 100 - difference
   let title: String
   if difference == 0 {
     title = "Perfect!"
     points += 100
   } else if difference < 5 {
     title = "You almost had it!"
     if difference == 1 {
 points += 50 }
   } else if difference < 10 {
     title = "Pretty good!"
 } else {
 title = "Not even close..." }
   score += points
 the top
 ...
 }
 
 The alert
 ➤ Change the bottom bit of showAlert() to:
 @IBAction func showAlert() { ...
 let alert = UIAlertController(. . .)
 let action = UIAlertAction(title: "OK", style: .default, handler: { _ in
 self.startNewRound() })
 alert.addAction(action)
   present(alert, animated: true, completion: nil)
 }
 
 Start over
 The new method
43. ➤ Add the new method:
 func startNewGame() {
   score = 0
   round = 0
   startNewRound()
 }
 44.➤ Make this change:
 override func viewDidLoad() { super.viewDidLoad()
   startNewGame()        // this line changed
 }
 
 Connect the outlet
 Finally, you need to connect the Start Over button to the action method.
 45. ➤ Open the storyboard and Control-drag from the Start Over button to View controller. Let go of the mouse button and pick startNewGame from the pop-up if you opted to have startNewGame() as the action method. Otherwise, pick the name of your action method .
 That connects the button’s Touch Up Inside event to the action you have just defined.
 
 Landscape orientation revisited
 46. ➤ Go to the Project Settings screen and scroll down to Deployment Info. Under Status Bar Style, check Hide status bar.
 
 making app goodlooking
 47. adding photos in assets.xcassets
 Putting up the wallpaper
 
 48. ➤ Open Main.storyboard, open the Library panel (via the top toolbar) and locate an Image View.
 49. ➤ Drag the image view on top of the existing user interface. It doesn’t really matter where you put it, as long as it’s inside the Bullseye view controller.
 50. ➤ With the image view still selected, go to the Size inspector (that’s the one next to the Attributes inspector) and set X and Y to 0, Width to 667 and Height to 375.
 This will make the image view cover the entire screen.
 ➤ Go to the Attributes inspector for the image view. At the top there is an option
 named Image. Click the downward arrow and choose Background from the list.
 51. ➤ Change Mode to Scale To Fill
 The slider
 52. However, I find that doing visual design work is much easier and quicker in a visual editor such as Interface Builder than writing the equivalent source code. But for the slider you have no choice.
 53. ➤ Go to ViewController.swift, and add the following to viewDidLoad():
 let thumbImageNormal = UIImage(named: "SliderThumb-Normal")! slider.setThumbImage(thumbImageNormal, for: .normal)
 let thumbImageHighlighted = UIImage(named: "SliderThumb- Highlighted")!
 slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
 let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right:
 14)
 let trackLeftImage = UIImage(named: "SliderTrackLeft")!
 let trackLeftResizable =
 trackLeftImage.resizableImage(withCapInsets: slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
 let trackRightImage = UIImage(named: "SliderTrackRight")!
 let trackRightResizable =
 insets)
 trackRightImage.resizableImage(withCapInsets: slider.setMaximumTrackImage(trackRightResizable, for: .normal)
 
 The About screen
 54➤ Go to Xcode’s File menu and choose New ▸ File... In the window that pops up, choose the Cocoa Touch Class template (if you don’t see it then make sure iOS is selected at the top).
 
 Designing the view controller in Interface
 Builder
 55.➤ From the Library, choose View Controller and drag it on to the canvas, to the right of the main View controller.
 56. ➤ Drag a new Button on to the screen and give it the title Close. Put it somewhere around the bottom center of the view (use the blue guidelines to help with positioning).
 
 Showing the new view controller
 57.➤ Click the i button in the View controller to select it. Then hold down Control and drag over to the About screen.
 58. ➤ Let go of the mouse button and a pop-up appears with several options. Choose Present Modally.
 59. ➤ Click the arrow to select it. Segues also have attributes. In the Attributes inspector, choose Transition, Flip Horizontal. That is the animation that UIKit will use to move between these screens.
 
 Dismissing the About view controller
 60. ➤ Open AboutViewController.swift and replace its contents with the following:
 class AboutViewController: UIViewController {
   @IBAction func close() {
     dismiss(animated: true, completion: nil)
   }
 }
 
 Setting the class for a view controller
61. You first added the AboutViewController.swift source file, and then dragged a new view controller on to the storyboard. But, you haven’t told the storyboard that the design for this new view controller belongs to AboutViewController. That’s why in the Document Outline it just says View Controller and not About View controller. That’s the design of the screen done for now.➤ Fortunately, this is easily remedied. In Interface Builder, select the About scene’s View controller and go to the Identity inspector (that’s the tab/icon to the left of the Attributes inspector).
 62. ➤ Under Custom Class, enter AboutViewController
 63. ➤ Control-drag from the Close button to About View controller in the Document Outline (or to the yellow circle at the top of the scene in the storyboard). This should be old hat by now. The pop-up menu now does have an option for the close action (under Sent Events). Connect the button to that action.
 
 Using a web view for HTML content
 64. ➤ Put a WebKit View in its place (as always, you can find this view in the Objects Library). There are two web view options — an older Web View, which is deprecated, or ready to be retired, and the WebKit View. Make sure that you select the WebKit View.
 65. ➤ Go to the Project navigator and right-click on the Bullseye group (the yellow folder). From the menu, choose Add Files to “Bullseye”...
 66. ➤ In the file picker, select the Bullseye.html file from the Resources folder. This is an HTML5 document that contains the gameplay instructions.
 67. ➤ Press Add to add the HTML file to the project.
 68.  ➤ In AboutViewController.swift, add an outlet for the web view:
 class AboutViewController: UIViewController {
 @IBOutlet weak var webView: WKWebView!
 ...
 }
 69.➤ Click on your Bullseye's' project file
 70. ➤ Click on the little + button and search for WebKit.framework and click Add.
 71. ➤ Add the following code at the top of AboutViewController.swift, right below the existing import statement:
 72. ➤ In the storyboard file, connect the WKWebView to this new outlet. The easiest way to do this is to Control-drag from About View controller (in the Document Outline) to the Web View.
 73. In AboutViewController.swift, add a viewDidLoad() implementation:
 74. override func viewDidLoad() {
 super.viewDidLoad()
 if let url = Bundle.main.url(forResource: "Bullseye", withExtension: "html") {
     let request = URLRequest(url: url)
 webView.load(request) }
 }
 75. ➤ Run the app and press the info button. The About screen should appear with a description of the gameplay rules, this time in the form of an HTML document:
 
 Table Views
 Table views and navigation controllers
 Adding a table view
 76. ➤ Go to Xcode’s File menu and choose New ▸ File...
 ➤ Choose the Cocoa Touch Class template. Click Next. Call the file
 HighScoresViewController and make it a subclass of UITableViewController.
 A table view controller is a special type of view controller that makes working with
 table views easier.
 ➤ Click on Main.storyboard to open Interface Builder and drag a new Table View
 Controller from the Objects Library into the storyboard.
 ➤ Select the View Controller of the new scene you just added. Open the Identity Inspector from the right pane and update the class name to HighScoresViewController.
  Connecting the new view controller
 
 77.➤ Open the storyboard and add a new button to the main screen, just above the about button.
 ➤ Use this settings for the button. Type: Custom; Background: SmallButton.
 78. ➤ Change the text inside the button to be a trophy symbol: . You can find it under
 Edit ▸ Emoji & Symbols and then search for the word 'Trophy'.
 79. ➤ Set the button size to be 32x32.
 80. ➤ Click the   button to select it. Then hold down Control and drag over to the
 High Scores screen.
 ➤ Let go of the mouse button and a pop-up appears with several options. Choose
 Show.
 ➤ Run the app on the Simulator and click on the trophy button.
 
 Adding a prototype cell
 
 81. Xcode has a very handy feature named prototype cells that lets you design your cells visually in Interface Builder.➤ Open the storyboard and click the empty cell (the white row below the Prototype Cells label) to select it.
 82. ➤ Drag a Label from the Objects Library on to the white area in the table view representing the cell. Make sure the label spans from the left edge (with a small margin) until the middle of the cell.
 83. ➤ Drag another Label and place it next to the previous label, so it spans from it's right edge to the cell's right edge.
 84. ➤ In the Attributes inspector, change the alignment to Right.
 85. This screen has only one type of cell but you still need to give it an identifier.
 ➤ Type HighScoreItem into the Table View Cell’s Identifier field (you can find this
 in the Attributes inspector).
 
 The table view delegates
 86. ➤ Switch to HighScoresViewController.swift and add the following methods just before the closing bracket at the bottom of the file:
 // MARK:- Table View Data Source
 override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 return 1
 
 }
 override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
 UITableViewCell {
 let cell = tableView.dequeueReusableCell(
 return cell }
 withIdentifier: "HighScoreItem",
 for: indexPath)
 
 Putting row data into the cells
 87. ➤ Open the storyboard and select the left Label inside the table view cell. Go to the Attributes inspector and set the Tag field to 1000.
 88. ➤ Do the same for the right label, but use 2000 as the tag instead.
 89. ➤ In HighScoresViewController.swift, change tableView(_:cellForRowAt:) to the following:
 override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
 -> UITableViewCell {
 let cell = tableView.dequeueReusableCell(
                         withIdentifier: "HighScoreItem",
  raywenderlich.com 604
 iOS Apprentice Chapter 20: Table Views
 for: indexPath) let nameLabel = cell.viewWithTag(1000) as! UILabel
 let scoreLabel = cell.viewWithTag(2000) as! UILabel
 if indexPath.row == 0 {
 nameLabel.text = "The reader of this book" scoreLabel.text = "50000"
 } else if indexPath.row == 1 { nameLabel.text = "Manda" scoreLabel.text = "10000"
 } else if indexPath.row == 2 { nameLabel.text = "Joey" scoreLabel.text = "5000"
 } else if indexPath.row == 3 { nameLabel.text = "Adam" scoreLabel.text = "1000"
 } else if indexPath.row == 4 { nameLabel.text = "Eli"
 scoreLabel.text = "500" }
   // End of new code block
 return cell }
 
 Tapping on the rows
 90➤ To see this, open the storyboard and Control-click on the table view to bring up its connections.
 91. ➤ Add the following method to HighScoresViewController.swift:
 // MARK:- Table View Delegate
 override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
 tableView.deselectRow(at: indexPath, animated: true) }
 
 Methods with multiple parameters
 92. override func tableView(
 _ tableView: UITableView,
 // parameter 1
 // parameter 2
 // return value
 // parameter 1
 // parameter 2
 // return value
 // parameter 1
 // parameter 2
 ...
 }
 ...
 }
 numberOfRowsInSection section: Int) -> Int {
 override func tableView(
 _ tableView: UITableView,
 cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 override func tableView(
 _ tableView: UITableView,
 ...
 }
 didSelectRowAt indexPath: IndexPath) {
 
 Model-View-Controller
 MVC is one of the three fundamental design patterns of iOS. You’ve already seen the other two: Delegation, making one object do something on behalf of another, and target-action, connecting events such as button taps to action methods.
 The Model-View-Controller pattern states that the objects in your app can be split into three groups:
 • Model objects: These objects contain your data and any operations on the data. For example, if you were writing a cookbook app, the model would consist of the recipes. In a game, it would be the design of the levels, the player score and the positions of the monsters.
 The operations that the data model objects perform are sometimes called the business rules or the domain logic. For the high score screen, the high scores themselves form the data model.
 • View objects: These make up the visual part of the app: Images, buttons, labels, text fields, table view cells and so on. In a game, the views form the visual representation of the game world, such as the monster animations and a frag counter.
 A view can draw itself and responds to user input, but it typically does not handle any application logic. Many views, such as UITableView, can be re-used in many different apps because they are not tied to a specific data model.
 • Controller objects: The controller is the object that connects your data model objects to the views. It listens to taps on the views, makes the data model objects do some calculations in response and updates the views to reflect the new state of your model. The controller is in charge. On iOS, the controller is called the “view controller.”
 
 The first iteration
 93. In HighScoresViewController.swift, add the following constants right after the class HighScoresViewController line:
 class HighScoresViewController: UITableViewController {
   let row0name = "The reader of this book"
   let row1name = "Manda"
   let row2name = "Joey"
 let row3name = "Adam" let row4name = "Eli" let row0score = 50000 let row1score = 10000 let row2score = 5000 let row3score = 1000 let row4score = 500 ...
 
 94.➤ Change the data source methods to:
 override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 return 5 }
 override func tableView(_ tableView: UITableView,
                         cellForRowAt indexPath: IndexPath)
 -> UITableViewCell {
 let cell = tableView.dequeueReusableCell(
  raywenderlich.com 617
 iOS Apprentice Chapter 21: The Data Model
 withIdentifier: "HighScoreItem",
 for: indexPath)
 let nameLabel = cell.viewWithTag(1000) as! UILabel let scoreLabel = cell.viewWithTag(2000) as! UILabel
 if indexPath.row == 0 { nameLabel.text = row0name scoreLabel.text = String(row0score)
 } else if indexPath.row == 1 { nameLabel.text = row1name scoreLabel.text = String(row1score)
 } else if indexPath.row == 2 { nameLabel.text = row2name scoreLabel.text = String(row2score)
 } else if indexPath.row == 3 { nameLabel.text = row3name scoreLabel.text = String(row3score)
 } else if indexPath.row == 4 { nameLabel.text = row4name
 scoreLabel.text = String(row4score) }
 return cell }
 
 Simplifying the code
 95.➤ Select the Bullseye group in the project navigator and right-click it. Choose New File... from the pop-up menu.
 96. Click Next to continue. Save the new file as HighScoreItem. You don’t really need to
 add the .swift file extension since it will be automatically added for you.
 97. ➤ Add the following to the new HighScoreItem.swift file, below the import line:
 class HighScoreItem {
   var name = ""
 var score = 0 }
 
 Using the object
 98. ➤ In HighScoresViewController.swift, remove the old properties and replace them with HighScoreItem objects:
 class HighScoresViewController: UITableViewController {
   var row0item = HighScoreItem()
   var row1item = HighScoreItem()
   var row2item = HighScoreItem()
   var row3item = HighScoreItem()
   var row4item = HighScoreItem()
 
 99. Instead of the above, you could have used what’s known as a type annotation to simply indicate the type of row0Item like this:
 var row0item: HighScoreItem
 
 Fixing existing code
 ➤ In tableView(_:cellForRowAt:), replace the if statements with the following:
 100.  if indexPath.row == 0 { nameLabel.text = row0item.name
 raywenderlich.com 621
iOS Apprentice Chapter 21: The Data Model
scoreLabel.text = String(row0item.score)
} else if indexPath.row == 1 {
nameLabel.text = row1item.name
scoreLabel.text = String(row1item.score)
} else if indexPath.row == 2 {
nameLabel.text = row2item.name
scoreLabel.text = String(row2item.score)
} else if indexPath.row == 3 {
nameLabel.text = row3item.name
scoreLabel.text = String(row3item.score)
} else if indexPath.row == 4 {
nameLabel.text = row4item.name
scoreLabel.text = String(row4item.score) }
 
 Setting up the objects
 101. ➤ Modify viewDidLoad in HighScoreViewController.swift as follows:
 override func viewDidLoad() { super.viewDidLoad()
   // Add the following lines
 row0item.name = "The reader of this book" row0item.score = 50000
 row1item.name = "Manda"
 row1item.score = 10000
 row2item.name = "Joey" row2item.score = 5000 row3item.name = "Adam" row3item.score = 1000 row4item.name = "Eli" row4item.score = 500
 }
 
 Using arrays
 102. ➤ In HighScoresViewController.swift, remove all of the instance variables and
 replace them with a single array variable named items:
 class HighScoresViewController: UITableViewController {
  var items = [HighScoreItem]()
 103. ➤ Modify viewDidLoad as follows:
 override func viewDidLoad() { super.viewDidLoad()
   // Replace previous code with the following
 let item1 = HighScoreItem()
 item1.name = "The reader of this book"
 item1.score = 50000
 items.append(item1)
 let item2 = HighScoreItem()
 item2.name = "Manda"
 item2.score = 10000
 items.append(item2)
 let item3 = HighScoreItem()
 item3.name = "Joey"
 item3.score = 5000
 items.append(item3)
 let item4 = HighScoreItem()
 item4.name = "Adam"
 item4.score = 1000
 items.append(item4)
 let item5 = HighScoreItem()
 item5.name = "Eli"
 item5.score = 500 items.append(item5)
 }
 
 Simplifying the code — again
 104. ➤ Change this methods:
 override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
 -> UITableViewCell {
 let cell = tableView.dequeueReusableCell(
                         withIdentifier: "HighScoreItem",
                                    for: indexPath)
 let item = items[indexPath.row] // Add this let
 nameLabel = cell.viewWithTag(1000) as! UILabel
 let scoreLabel = cell.viewWithTag(2000) as! UILabel
   // Replace everything after the above line with the following
 nameLabel.text = item.name
 scoreLabel.text = String(item.score)
 return cell
 }
 
 105. ➤ Change the tableView(_:numberOfRowsInSection:) method to:
 override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 return items.count }
 
 Navigation controllers
 Adding a navigation controller
 
 106. ➤ Open Main.storyboard and select the View Controller Scene.
 107. ➤ From the menu bar at the top of the screen, choose Editor ▸ Embed In ▸ Navigation Controller.
 
 Setting the navigation bar title
 108. ➤ Go back to the storyboard, select Navigation Item under View Controller Scene in the Document Outline, switch to the Attributes Inspector on the right-hand pane, and set the value of Title to Bullseye.
 ➤ Go to the storyboard and select the High Scores scene
 ➤ Drag a Navigation Item from the object library into the scene
 
 109. ➤ Change the Navigation Item's title to "High Scores"
 
 Deleting rows
 110. ➤ Add the following method to HighScoresViewController.swift. You should put this with the other table view delegate methods, to keep things organized.
 override func tableView(
 _ tableView: UITableView,
 commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
 // 1
 items.remove(at: indexPath.row)
 // 2
   let indexPaths = [indexPath]
 tableView.deleteRows(at: indexPaths, with: .automatic) }
 
 Adding a navigation button
 111. ➤ Open the storyboard.
 ➤ Go to the Objects Library and look for Bar Button Item. Drag it into the right-side slot of the navigation bar. (Be sure to use the navigation bar on the High Scores View Controller, not the one from the navigation controller!)
 By default, this new button is named “Item”. Let's rename it to "Reset".
 112.➤ In the Attributes inspector for the bar button item, update the title to Reset.
 
 Making the navigation button do something
 113. ➤ Add a new action method to HighScoresViewController.swift:
 @IBAction func resetHighScores() {
}
 114. ➤ Open the storyboard and connect the Reset button to this action. To do this, Control-drag from the reset button to the yellow circle in the bar above the view (this circle represents the High Scores View Controller):
 115. ➤ Let’s give resetHighScores() something to do. Back in HighScoresViewController.swift, move all the HighScoreItem initialization code from viewDidLoad() to resetHighScores() and call it from viewDidLoad(). The final code should look like this (some items were removed for brevity:
 override func viewDidLoad() { super.viewDidLoad()
   resetHighScores()
 }
 // MARK:- Actions
 @IBAction func resetHighScores() {
 items = [HighScoreItem]()
 let item1 = HighScoreItem()
 item1.name = "The reader of this book" item1.score = 50000 items.append(item1)
 ...
 let item5 = HighScoreItem() item5.name = "Eli" item5.score = 500 items.append(item5)
 tableView.reloadData() }
 
 Saving and loading high scores
 116. ➤ Open HighScoreItem.swift and update the class definition to this:
 class HighScoreItem : Codable
 117. ➤ Create a new Swift file and name it PersistencyHelper.swift. Put this content in the new file:
 class PersistencyHelper {
 static func saveHighScores(_ items: [HighScoreItem]) {
     let encoder = PropertyListEncoder()
     do {
 let data = try encoder.encode(items)
 try data.write(to: dataFilePath(), options: Data.WritingOptions.atomic)
     } catch {
       print("Error encoding item array: \
 (error.localizedDescription)")
 } }
 static func loadHighScores() -> [HighScoreItem] { var items = [HighScoreItem]()
 let path = dataFilePath()
 if let data = try? Data(contentsOf: path) {
       let decoder = PropertyListDecoder()
       do {
 items = try decoder.decode([HighScoreItem].self, from: data)
 } catch {
         print("Error decoding item array: \
 (error.localizedDescription)")
 } }
     return items
   }
 static func dataFilePath() -> URL { let paths =
 FileManager.default.urls(for: .documentDirectory,
 in: .userDomainMask)
 return paths[0].appendingPathComponent("HighScores.plist") }
 }
 118. ➤ Open HighScoresViewController.swift and add loadHighScores() to viewDidLoad(). If there's no high scores file (or if loading fails for any reason), you fallback to the default list of high scores:
 override func viewDidLoad() { super.viewDidLoad()
 items = PersistencyHelper.loadHighScores() if (items.count == 0) {
     resetHighScores()
    PersistencyHelper.saveHighScores(items)
   }
 }
 ➤ Add PersistencyHelper.saveHighScores(items) at the end of resetHighScores() and tableView(_:commit:forRowAt:).
 
 Adding new high scores
 
 120. ➤ Open ViewController.swift and add this at the top of the method startNewGame():
 @IBAction func startNewGame() { addHighScore(score)
 ...
 }
 121. ➤ Add this code somewhere in ViewController.swift:
 func addHighScore(_ score:Int) { // 1
   guard score > 0 else {
 return; }
 // 2
 let highscore = HighScoreItem() highscore.score = score highscore.name = "Unknown"
 // 3
 var highScores = PersistencyHelper.loadHighScores() highScores.append(highscore)
 highScores.sort { $0.score > $1.score } PersistencyHelper.saveHighScores(highScores)
 }
 
 The Edit High Score screen
 Adding a new view controller to the storyboard
 122. ➤ Go to the Objects Library and drag a new Table View Controller (not a regular view controller) on to the storyboard canvas.
 123. ➤ With the new view controller in place, select Table View and change its view's background to Group Table View Background.
 124. ➤ Select the prototype cell from the High Scores View Controller. Control-drag to the new view controller. It might be difficult to capture the correct object here, so instead you can control-drag from HighScoreItem in the outline to the left.
 125. ➤ Choose Show from the menu.
 
 Customizing the navigation bar
 126. ➤ First, drag a Navigation Item from the Objects Library on to the new scene.
 127. ➤ Next, drag two Bar Button Items on to the navigation bar, one to the left slot
 (removing the existing back button) and one to the right slot.
 128. ➤ In the Attributes inspector for the left button choose System Item: Cancel.
 129. ➤ For the right button choose Done for both System Item and Style attributes.
 130. ➤ Double-click the navigation bar for the new table view controller to edit its title and change it to Edit High Score. You can also change this via the Attributes inspector as you did before.
 131. ➤ Run the app, click on the high scores button, tap any cell and you’ll see that your new screen has Cancel and Done buttons.
 
 Making your own view controller class
 
 132. ➤ Right-click on the Bullseye group (the yellow folder) in the project navigator and choose New File... Choose the Cocoa Touch Class template.
 133. ➤ In the next dialog, set the Class to EditHighScoreViewController and Subclass to UITableViewController (when you change the subclass, the class name will
 automatically change — so either set the subclass first or change the class name back after the change). Leave the language at Swift (or change it back if it is not set to Swift).
 134. ➤ Save the file to your project folder, which should be the default location.
 135. ➤ The file should have a lot of source and commented code — this is known as boilerplate code, or code that is generally always needed. In this particular case, you don’t need most of it. So remove everything except for viewDidLoad (and remove the comments from inside viewDidLoad as well) so that your code looks like this
 import UIKit
 class EditHighScoreViewController: UITableViewController {
   override func viewDidLoad() {
 super.viewDidLoad() }
 }
 136. ➤ In the storyboard, select the Edit High Score Scene and go to the Identity inspector. Under Custom Class, type EditHighScoreViewController.
 
 Making the navigation buttons work
 
 137. You will now implement the necessary action methods in EditHighScoreViewController.swift.
 ➤ Add these new cancel() and done() action methods:
 // MARK:- Actions
 @IBAction func cancel() {
 navigationController?.popViewController(animated: true) }
 @IBAction func done() {
 navigationController?.popViewController(animated: true) }
 138. ➤ Open the storyboard and find the Add Item View controller. Control-drag from the bar buttons to the yellow circle icon and pick the proper action from the pop-up menu.
 139. ➤ Run the app to try it out. The Cancel and Done buttons now return the app to the main screen.
 
 Container view controllers
 You've read that one view controller represents one screen, but here you actually have two view controllers for each screen: a Table View controller that sits inside a navigation controller.
 The navigation controller is a special type of view controller that acts as a container for other view controllers. It comes with a navigation bar and has the ability to easily go from one screen to another, by sliding them in and out of sight. The container essentially “wraps around” these screens.
 The navigation controller is just the frame that contains the view controllers that do the real work, which are known as the “content” controllers.
 
 Static table cells
 Storyboard changes
 
 140. ➤ Open the storyboard and select the Table View object inside the Edit High Score scene.
 141. ➤ In the Attributes inspector, change the Content setting from Dynamic Prototypes to Static Cells.
 142. ➤ Select the bottom two cells and delete them by pressing the delete key on your keyboard. You only need one cell for now.
 143.  ➤ Select the table view again and in the Attributes inspector set its Style to Grouped.
 144. ➤ Drag a text field object into the cell and size it up nicely. You might want to add left, top, right and bottom Auto Layout constraints to the text field if you don’t want
 145. ➤ In the Attributes inspector for the text field, set the Border Style to no border by selecting the dotted box:
 146. ➤ Run the app and click on any high score to open the Edit High Score screen. Tap on the cell with the text field and you’ll see the keyboard slide in from the bottom of the screen.
 
 Disabling cell selection
 147. The row turns gray because you selected it. Oops, that’s not what you want. You should disable selections for this row. You can do this easily via code by adding the following table view delegate method to EditHighScoreViewController.swift:
 // MARK:- Table View Delegates
 override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath)
 -> IndexPath? { return nil
 }
 
 Working with the text field
 Adding an outlet for the text field
 
 148.  ➤ First, go to the storyboard and select the Edit High Score View Controller. Then, open the Assistant editor using the toolbar button on the top right.
 149. ➤ With the storyboard and the Swift file side-by-side, select the text field. Then, Control-drag from the text field into the Swift file.
 150. ➤ Choose the following options: • Connection: Outlet
 • Name:textField
 • Type: UITextField
 • Storage: Weak
 151. ➤ Press Connect and, voila, Xcode automatically inserts an @IBOutlet for you and connects it to the text field object.
 In code it looks like this:
 @IBOutlet weak var textField: UITextField!
 ust by dragging, you have successfully hooked up the text field object with a new property named textField. How easy was that?
 
 Reading from the text field
 152. ➤ In EditHighScoreViewController.swift, change done() to:
 @IBAction func done() {
 // Add the following line
 print("Contents of the text field: \(textField.text!)")
 navigationController?.popViewController(animated: true) }
 153. Run the app, go to the high scores screen, click on any high score to navigate to the Edit High Score screen and type something in the text field. When you press Done, the Edit High Score screen should close and Xcode should reveal the Debug pane with a message like this
 
 Polishing it up
 Giving the text field focus on-screen opening

 154. ➤ To accomplish this, add a new method to EditHighScoreViewController.swift.
 override func viewWillAppear(_ animated: Bool) { super.viewWillAppear(animated)
 textField.becomeFirstResponder() }
 155. ➤ Run the app and go to the Edit High Score screen. You can start typing right away.
 
 Styling the text field
 
 155. ➤ Open the storyboard and select the text field. Go to the Attributes inspector and set the following attributes:
 • Placeholder: High scorer name
 • Font: System 17
 • Adjust to Fit: Uncheck this
 • Capitalization: Sentences
 • Return Key: Done
 
 Handling the keyboard Done button
 156. ➤ Make sure the text field is selected and open the Connections inspector. Drag from the Did End on Exit event to the view controller and pick the done action.
 157. ➤ Go to the Edit High Score screen. Pressing Done on the keyboard will now close the screen and print the text to the debug area.

 Disallowing empty input
 158. ➤ On the Attributes inspector for the text field, check Auto-enable Return Key.
 
 Becoming a delegate
159. ➤ In EditHighScoreViewController.swift, add UITextFieldDelegate to the class declaration:
 class EditHighScoreViewController: UITableViewController,
UITextFieldDelegate {
 160. ➤ Go to the storyboard and select the text field.
 There are several different ways in which you can hook up the text field’s delegate outlet to the view controller. One way is to go to its Connections inspector and drag from delegate to the view controller’s little yellow icon:
 
 Configuring the Done button
 161. ➤ Open the Assistant editor and make sure EditHighScoreViewController.swift is visible in the assistant pane.
 162. ➤ Control-drag from the Done bar button into the Swift file and let go. Name the new outlet doneBarButton.
 This adds the following outlet:
 @IBOutlet weak var doneBarButton: UIBarButtonItem!
 163. ➤ Add the following to EditHighScoreViewController.swift, at the bottom and
 before the final curly brace:
 // MARK:- Text Field Delegates
 func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
 replacementString string: String) -> Bool {
 let oldText = textField.text!
 let stringRange = Range(range, in: oldText)!
 let newText = oldText.replacingCharacters(in: stringRange,
 if newText.isEmpty { doneBarButton.isEnabled = false
 } else {
 doneBarButton.isEnabled = true }
 return true
 }
 
 Delegates and protocols
 Updating HighScoreItem
 The messy way
 
164. Maybe you came up with something like this:
 class EditHighScoreViewController: UITableViewController, . . .
 {
 }
 // This variable refers to the other view controller
 var highScoresViewController: HighScoresViewController
 @IBAction func done() {
 highScoreItem.name = textField.text!
   // Directly call a method from HighScoresViewController
 highScoresViewController.update(item) }
 
 The delegate way
 The delegate protocol
 
 165. ➤ At the top of EditHighScoreViewController.swift, add the following after the import line but before the class line — it’s not part of the EditHighScoreViewController object:
 protocol EditHighScoreViewControllerDelegate: class {
   func editHighScoreViewControllerDidCancel(
 _ controller: EditHighScoreViewController) func editHighScoreViewController(
 _ controller: EditHighScoreViewController,
     didFinishEditing item: HighScoreItem)
 }
 
 Protocols [TODO: delete me?]
 166. In EditHighScoreViewController, you can use the following to refer back to HighScoresViewController:
 var delegate: EditHighScoreViewControllerDelegate
 
 Notifying the delegate
 167. ➤ Add this inside the EditHighScoreViewController class, below the outlets:
 weak var delegate: EditHighScoreViewControllerDelegate?
 168. ➤ Add this below the delegate declaration:
 var highScoreItem: HighScoreItem!
 169. ➤ Replace the cancel() and done() actions with the following:
 @IBAction func cancel() {
 delegate?.editHighScoreViewControllerDidCancel(self) }
 @IBAction func done() { highScoreItem.name = textField.text!
 delegate?.editHighScoreViewController(self, didFinishEditing: highScoreItem)
 }
 170. ➤ Run the app and try the Cancel and Done buttons. They no longer work!
 
 Optionals
 You’ve already seen the question mark used with IndexPath?, the return type of tableView(_:willSelectRowAt:). Returning nil from this method is a valid response; it means that the table should not select a particular row.
 The question mark tells Swift that it’s OK for the method to return nil instead of an actual IndexPath object.
 Variables that refer to a delegate are usually marked as optional, too. You can tell because there’s a question mark behind the type:
 171. weak var delegate: EditHighScoreViewControllerDelegate?
 When delegate is nil, you don’t want cancel() or done() to send any of the messages. Doing that would crash the app because there is no one to receive the messages. Swift has a handy shorthand for skipping the work when delegate is not set:
 delegate?.editHighScoreViewControllerDidCancel(self)
 
 Conforming to the delegate protocol
 172. ➤ In HighScoresViewController.swift, change the class line to the following (this all goes on one line):
 class HighScoresViewController: UITableViewController,
EditHighScoreViewControllerDelegate {
 173. ➤ Add the implementations for the protocol methods to HighScoresViewController:
 // MARK:- Edit High Score ViewController Delegates
 func editHighScoreViewControllerDidCancel(
                        _ controller:
 EditHighScoreViewController) {
 navigationController?.popViewController(animated:true) }
 func editHighScoreViewController(
 _ controller: EditHighScoreViewController,
 didFinishEditing item: HighScoreItem) { navigationController?.popViewController(animated:true)
 }
 174. ➤ Add this method to HighScoresViewController.swift:
 // MARK:- Navigation
 override func prepare(for segue: UIStoryboardSegue,
 // 1
 sender: Any?) {
 let controller = segue.destination as! EditHighScoreViewController
 // 2
 controller.delegate = self
 // 3
 if let indexPath = tableView.indexPath(for: sender as!
 UITableViewCell) {
 controller.highScoreItem = items[indexPath.row] }
 }
 175. ➤ Open EditHighScoreViewController.swift and add this to viewDidLoad(): textField.text = highScoreItem.name
 176. ➤ Run the app, click on any high score and see that the edit item screen now has the current name already in the text field.
 
 Updating the table view
 
 177. ➤ Change the implementation of the didFinishEditing delegate method in HighScoresViewController.swift to the following:
 func editHighScoreViewController(_ controller:
 EditHighScoreViewController,
 HighScoreItem) {
   // 1
 didFinishEditing item:
 if let index = items.firstIndex(of: item) { // 2
 let indexPath = IndexPath(row: index, section: 0)
 let indexPaths = [indexPath]
 // 3
 tableView.reloadRows(at: indexPaths, with: .automatic)
 }
 // 4
 PersistencyHelper.saveHighScores(items)
 navigationController?.popViewController(animated:true) }
 178. ➤ Try to build the app. Oops, Xcode has found another reason to complain:
 Xcode displays this error because you can’t use firstIndex(of:) on just any array, or collection of objects. An object has to be “equatable” if you are to use firstIndex(of:) on an array of that object type.
 179. ➤ In HighScoreItem.swift, change the class line to:
 class HighScoreItem : NSObject, Codable {
 
 
 
 
 */

# LearnWebProgramming
People at the office is fighting about the air conditioner temperature, some want the air conditioner to be turned off and some want it very cold. Lets solve this problem democratically by creating and application were they can vote the desired AC temperature.

## Class 1
Task 1: Welcome to the Application
- Create a GET method for the root (‘/’) that welcomes you to the application with a descriptive message of what the application does

Task 2: Query the status of the Air Conditioner
- Create a GET method named “ac/status” that shows the status (on/off) of the air conditioner. If the AC is ON then also show the current temperature. (use the existing AirConditioner class)

Task 3: Turn the Air Conditioner ON
- Create two GET methods named “ac/turn_on” and “ac/turn_off that will turn on/off the air conditioner. You can also show a message to give some feedback of the action. (use the existing AirConditioner class)

## Class 2
Task 4: A new welcome page
- Create a new index.erb template, place it on views and modify the root route to render this view.
- Create an instance variable that contains the welcome message and use this variable in the view

Task 5: Getting the votes
- Create a form in the new index.erb file that asks for the employee name, the desired temperature and the employee category (use a combo for selecting “RM”, “SM”, “DEV” or “QA”). On submit it should POST to the “/votes” method created below
- Create a POST route named “/votes” that creates a new Employee, sets the name, category and desired temperature and adds the employee to a votes Array.

Task 6: Showing the current votes
- Create an instance variable that contains the size of the current votes
- Show in the index page the amount of current votes 

Task 7: Calculate the winning temperature
- Create a POST route named “/calculate_votes” that creates a new ElectoralCollege and calls the calculate_winning_temperature. 
- Add a button to the index.erb file that calls the /calculate_votes 
- Create a new template to show the results 

## Class 3
Task 8: enabling sessions
- Add the code to the POST “/votes” method to store in the session the last information about the employee
- Modify the root method to use the latest session stored data to populate the form with those initial values

Task 9: moving the model to MongoID
- Add the configuration to the main file to connect to the mongo database
- Modify the Employee class to be a document so it can be stored in the database instead of using an array

Task 10: Returning JSON
- Create a GET method named “/votes.json” to retrieve all the current votes in a JSON format.

## Class 4
Task 11: Add bootstrap to our app
- Include the bootstrap stylesheet
- Add a jumbotron class to the welcome message
- Add classes to the form elements
- Add classes to the buttons
- Divide the form and the actions with some nice grid system
- Go through the bootstrap documentation and beautify the site as you like

# FLUTTER - FASTAPI ASSIGNMENT
    A web application for managing departments and employees with real-time updates, built using Flutter, FastAPI, and PostgreSQL.

# REQUIREMENTS
    * Flutter
    * PostgreSQL & PgAdmin
    * FastAPI

# HOW TO SETUP
    Unfortunately, my front-end and back-end somehow created 2 seperate local repositories, so to avoid further complications in the submission period, i decided to seperate them in 2 seperate reomte respositories.


## Back-end

    For getting the fastapi backend, open a terminal and run:

    'git clone https://github.com/ShinanTc/flutter-assignment-fast-api-backend.git'

    After cloning, enter into the folder and open that folder in a bash. Then run this command to activate the virtual environment:

    'source venv/Scripts/activate'

    then, 'fastapi dev main.py' will start the server.

    To avoid any unexpected issue it is always recommended to open the PgAdmin for running the database server.
     
 ## Front-end   
    
    For getting the flutter client, open a terminal (preferably git bash) and run:
    
    'git clone https://github.com/ShinanTc/flutter-assignment.git'.
    
     After cloning, enter inside the folder. Make sure your fast api server is running and Enter inside the project folder, open a terminal and run:

     'flutter run' and take select a build method (Windows/Browser...).

    Now you can test all the functionalities.

# NOTE
    Due to some uncertainty issues, minimal flutter experience, absolute beginner in fastapi and for faster submission I had to compromise the below conditions:

    * Unfortunately, The condition you have put forward where 'Department cannot be deleted when there are employees assigned to it.' couldnt be done due to the above mentioned reasons.
    * Couldn't do maximum coding optimisations on architectures and conventions
    * Tools like providers and Blocs weren't used in this project
    * Error handling modals isnt built, you have to rely on the running terminal for that
    * No data validations included
    * This app purely funtion oriented on the provided conditions, you can just check them, & that's pretty much it. It does not handle all the unexpected situations and events.

    I had to put a lot of effort simultaneously in learning and developing all the 3 technologies at the same time, so i request an apology in advance for any mistakes or inconvenience caused. Feel free to reach out for further guidance. I appreciate your your patience. Thank you so much 💓
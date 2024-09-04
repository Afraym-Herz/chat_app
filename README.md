# Custom Button
it is custom button we create to put custom attribute and custom view . it accept name(string) and onTap(VoidCallback) 
## 1 - name
 is the message will display in button to pointer to its function

## 2 - onTap
 is function with return void is used to contain the operations and processes that the button will provide it ( such as custom button(login) contain the login method , boolean isLoading , validate for the fields and setState to update the ui when login successfully )   

-----------------------------

# Custom Field
it is custom text field , it accept hint(string) , onChanged( function has attribute of type string ) and obsecure(bool) and it is contain TextFormField (built in help us to create form)

## 1 - hint 
is message will display in field to explain to user what he should put in this field

## 2 - onChanged 
is function that accept attribute of string , it is used to set the data was put in field in variable (such as we put data in field to email(variable) in login and register page)

## 3 - obsecure 
is boolean its deafult value false , it is used to encode the text if it is password field

## 4 - Text form field

### validator :
is used to check if the data in field is null or empty will stop the operations , light red and return 'field is required' 

-------------

# Routes 
is used to named the screens by their IDs to navigate between them 

it is using in main function and to use Routes we're using pushNamed

we must put id to all screens to use Routes


-----------



# LogIn page

## Form
using to design the UI to handle the custom form text to put all in form to easy the full the forms

## global key
it is create to know the state of the form , if its state validate , failed or success

## the action when click on Log in
1 - bool loading convert to true and setState function will rebuild the screen to show the loading prograss circular
2 -
### Sign in method 
- using object from UserCredentail (user) to storage the response which is coming from Firebase 
- we create instance from FirebaseAuth and use method SignInWithEmailAndPassword and we put email and password which we get them from Forms 

3 - we use routes in main and use Navigator push named and we send with Navigator arguments , the arguments is the email , the email we use it in chat bubble to determine which of the two users who send the message so we check of the email if the email is current user's email for App we put the bubble in left else we put bubble chat in the right 

4 - we use firebase exception if happen any exception

5 - in the end , if the logIn done successfully or failure the bool isLoading become false and setState will rebuild the screen to chat screen or error message 

------------


# register page (the same of Login page)
just differnt between rgister page and Login page 
the login page contain SignIn method from FirebaseAuth instance 
when the register page contain create user method from Firebase instance



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




-----------------------------





# Chat page (importance part)


## Variables

### messages (CollectionReference)

- it is a reference for FirebaseFirestore.instance.collection(kMessageReference) , it is use to refernece the collection which contain the messages for current chat (documents)


### ScrollController (_controller)

- it is used to control the scroll of listView.builder in our case using to scroll to bottom of the chat when send a new message or the friend sent a message 

### TextEditingController (controler)

- it is used to control the TextEditor in our case , we use it to clear the TextEditor when send a message

### Arguments (email) 

- it is contain the user's email we get by ModalRoute.of(context)!.settings.arguments , we use it to specified this message if the user sent it or the friend




## Stream Builder


### QuerySnapshot


### stream 

- it is attribute in StreamBuilder using to contain the data which will get by queries
- we use it by additional features to ordered the messages by the time of sent by descending 
and it is the line of code messages.orderBy(kCreatedAt, descending: true).snapshots()


### builder

- we check if snapshot contain data , create empty messagesList and we add the messages to this list by forLoop will play until all messages was added 
- we sent all messages (docs) to Message model from json to handle all messages to be Message model and add it to messageList 


### ListView.builder (in \builder) 

- we put ListView.builder in Expanded widget to determine the size of list view and scroll the list in this size
- we put the _controller in attribute controller 
- we check in itmeBuilder if the email in current message is for user or another so we put the message's content in the correct bubble chat (if he is user in the left  if friend in the right)


### TextField

- by onSubmitted attribute in TextField we accept data from user and use method add from messages (CollectionReference) and we send with message content the date (to order) and email (to determine who is send)
- we use controller (TextEditing) to clear TextField after send the message and use _controller to scroll after send a message
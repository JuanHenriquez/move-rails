# Move - The social network that moves you around the world.

This project was created to simulate the operation of a social network.
In **Move** you can create an account, find friends and send them messages, wirte comments and post articles, upload images for the world to see, review your friends dashboard and give "like" or "dislike" their posts.

### Prerequisites:
- Have **Ruby on Rails** 4.2.* or higher installed.

- Install [**Imagemagick**](http://www.imagemagick.org/script/index.php) to compress images upload by users.

### How install?

1. Fork or clone this repository, or simply download the the .zip file.
Then open your terminal, then navigate to the project root directory and run bundler to install all the dependencies:
```
bundle install
```
2. Run migrations to create all the database schema:
```
rake db:migrate
```
3. Run the server for see the app runs!
```
rails s -b 0.0.0.0
```
Now the server is running _**localhost:3000**_

### Guide:

#### How create a account?
To create a user account you should simply go to the home page and just click on "register now", then fill the register form with your dates to register. Now you can now enjoy your new account in Move!.

#### Edit user profile

To edit your user profile you just have to go to "My Account" section then "Edit Account".

You will enter in a form where you can enter and modify the data you want to update. Once you make the changes you need to confirm them in the bottom entering your current password.

You can also canceling your account at the bottom of this section.

#### Search and find friends:
To find friends you just have to enter the name or email of the person in the search bar that appears at the top of the screen.

Once you make the search a page with the results appear, there you can send friend requests by clicking the button "Send Request" or simply visit the timeline or user dashboard by clicking the "See Profile" button.

#### How Delete a Friend?
To remove a friend you can go to your friend's profile and give it click the "Unfriend" button or just go to the list of friends and do it directly from there.

#### Create new content
To create new posts or upload images you can click the button with the "+" and select the option of your choice, this button symbol will always be available in any view the website.

#### Edit or Delete a post.
To edit posts have to click the settings icon, then a small menu will appear where you will leave the option to edit or remove a post.

#### Send Messages:
To send messages you have click the button "Send Message" located in the user profile and then a modal will appear, here you can write the message you want to send you to other user.

Then if you want to see all your conversations with friends, you can go to "Conversations" section in the navbar and you will see all current conversations and even send and receive messages through it.

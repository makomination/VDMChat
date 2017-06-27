# Overview

I took a screening test in June 2017. 
This repository is my answer of the test. 
The sentence of the test is in the last paragraph.

# To Test by Yourself
```
$ cd [Your VDMChat Directory]
$ pod install
$ open your-project.xcworkspace
```
For details, go to see https://firebase.google.com/docs/ios/setup



# The test sentence

## Chat App

> In this test, you will be creating a chat app using [Firebase](https://firebase.google.com/docs/ios/setup), the app contains two views

### Main View: 
> The main chat view, where user can type in text and send it to the public, the message should be stored in Firebase Real-time Database. There are 4 required features
> 
- The input text-view area should change its height based on the current text that the user has typed in. (maximum 8 lines)
- There is a send button next to the text-view that sends the message to Firebase, after finish sending the message, the text inside the text view should be cleared and the text view should resume its original size. And the list should display the message properly.
- After sending the text, the message list should scroll to the latest message.
- Each cell in the chat list should have dynamic height based on its text content.


### Nickname View: 
> This view contains a text field that allows user to change its nick name.

### Steps Submit your code
- Fork this project 
- After done all the codings, push the changes to your forked repo
- Submit the link of your forked repo that contains your answer.
- DO NO open a pull request to this repo.

### Demo
<img src="./demo.gif" width="400px"/>

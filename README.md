MixMakers
=================

Repository:
-------

* [check repository here](https://github.com/MaryDomashneva/MixMakers)

Card Wall:
-------

* [check card wall here](https://trello.com/b/p7wf6qg3/mobile-app)

Task:
-------

This is a two-week final project at Makers Academy.

As a cohort, for the final project,  we generated ideas for a product that we want to work on. Then we categorized all ideas into 5 categories:
* mobile,
* product,
* machine learning,
* technical,
* new tech

After that, everyone got two votes and voted for categories they want to work.
Finally, we got five groups:
* 2 product groups building music app,
* technical group (blockchain),
* new tech group (web sockets) and
* mobile app (swift)


That is how we become a MixMakers team, working on a mobile app.

Our idea for an app is a cocktail search app.

We have chosen this idea because it could be easily split into small steps and also it has a large room for adding features.
Our first idea involved image recognition for cocktail search so that user can take a picture of alcohol that user has and search for available cocktails.

We decided to start with small steps and first of all defined an MVP (minimum viable product) for our app.

Our MVP is:

```
User can open an app and type the name of alcohol
```
```
User can press search and see the list of available cocktails
```
```
User can choose one cocktail and see the instructions
```

We used Swift as a language for that project. No one from our team has experience with Swift before.  We got only one week to implement features, the second week we supposed to spend on code refactoring, styling and working on the presentation.

So that, when we start to build our MVP we realized that we would not have enough time to add the image recognition feature and should focus on smaller features that could help our MVP look better and testing.

User Story:
-------

```
User can open an app from his phone
```
```
User can enter multiple ingredients and see what he is searching for
```
```
User can search for ingredients and see available cocktails
```
```
User can click on one of the cocktails cards and
see the full list of ingredients and instructions.
```
```
User can swipe card and go back to the cocktail page
```
```
User can go back to search page
```

Technologies used:
-----

* Xcode 9.3.1
* Swift 4.1.2
* TheCocktailDB API [check here](https://www.thecocktaildb.com/)
* Pods:
  1. pod 'Cards', [:git =>](https://github.com/andyk144/Cards.git)
  1. pod 'Nuke'
  1. pod 'NVActivityIndicatorView'
  1. pod "SearchTextField"
  1. pod 'OHHTTPStubs/Swift'
  1. pod 'Quick' - testing environment
  1. pod 'Nimble' - testing environment


Contributors:
-------

* Andrew Kemp [check github here](https://github.com/andyk144)
* Louis Moselhi [check github here](https://github.com/Mozl)
* Jack Dewinter [check github here](https://github.com/dewinterjack)
* Mary Domashneva [check github here](https://github.com/MaryDomashneva)

## Our team
<img src="https://monosnap.com/image/JixYhevtTtgehlnL7AVZ4JmbM1cRwb.png">

Run project:
-----

Local on your machine lode iPhone simulator:
* clone this project, in your terminal type ```gem install cocoapods```, ```pod repo update```, ```pod install```
* open MixMakers.xcworkspace
* press cmd+r

Result:
-------

As a result of two weeks, we have managed to build three screens:
* Search screen, where User can search for ingredients
*  Cocktails screen, where User can see available cocktails cards
* Instructions screen, where Users can see the instructions how to prepare cocktail.

Reflections:
-------

### As a result of the two weeks we can state the following:

We had two amazing weeks working on this project we achieved a lot and we are really proud of ourself. But it was not easy all the time.

#### Inside our team we agreed to have some grounds rules for the two weeks:

* Stand-up's at 10:00 am every day:
   1. Discuss the scope of work for the day,
   1. Reallocate tickets if necessary and
   1. Merge pull requests.
* Retro at 17:00 every day:
   1. Discuss worked completed and
   1. Reflect on what went well and what didn't go so well.
* Switching PM every day.
* Work in pairs.

#### Day One
The first day we have spent exploring a new language and installing Xcode.

We did a small FizzBuzz programme and tried unit tests and UI test. Also, we have found the API that we gonna use. By the end of the day, we managed to have two screens:
* Serch screen with the search field and
* Cocktails screen that loaded from API a list of Gin Cocktails

These screens did not talk to each other on that point and the API request was hardcoded.

#### Day Two
The second day we have spent in pairs:
* Mary & Andry - working on API tests
* Jack & Louis - linked together the logic between first and second screen

#### Day Three
The second day we have spent in pairs:
* Jack & Mary - UI tests
* Andry & Louis - third screen with cocktail ingredients

#### Day Four
* Andry & Louis - third screen with cocktail ingridients, cards imlementation
* Jack & Mary - trying to realized an idea with tags implementation & gif implementation

#### Day Five
* Jack & Mary - multiple ingredients search feature
* Andry & Louis - third screen testing

#### Day Six (feature freeze)
The second day we have spent in pairs:
* Andry & Louis - further working on tests and test coverage.
* Jack & Mary - started to work on work documentation, README, and Presentation.

#### Day Seven
Further working on tests and test coverage.
Working on first screen styling.

#### Learnings:
* How to use Xcode and main hshortcuts:
```ctr + shift + k``` - clean everything,
```ctr + b``` - build app,
```ctr + u``` - build tests

* Xcode View Controllers
* Swift & Pods
* How to manage the project through GitHub and Xcode


#### Difficulties:
* Testing in Swift
* New language Swift
* Lack of understanding how Xcode works


#### Positives: 
* Cocktails :)
* Followed XP values
* Good team working

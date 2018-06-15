MixMakers
=================

Repository:
-------

* [check repository here](https://github.com/MaryDomashneva/MixMakers)

Card Wall:
-------

* [check card wall here](https://trello.com/b/p7wf6qg3/mobile-app)

## App in action

![mixmakers](https://thumbs.gfycat.com/DapperFlashyAnaconda-size_restricted.gif)

Task:
-------

This is our two-week final project at Makers Academy.

As a cohort, we generated ideas for a the final project that we wanted to work on. These ideas were then organised into 5 categories:
* mobile,
* product,
* machine learning,
* technical,
* new tech

After that, everyone made two votes and voted for categories they wanted to work on. We were all then placedd in to groups based on our selections. Five groups were formed in the following catagories:
* 2 product groups building music apps,
* technical group (blockchain),
* new tech group (web sockets) and
* mobile app (swift)


That is how we become a MixMakers team, working on a mobile app.

Our idea was to build a cocktail search app.

We chose this idea because it could be easily split into small steps and it gave us a wide variety of choice for adding different features.
Our original idea involved image recognition so that a user could take a picture of alcohol that they had and search for suitable cocktails they could make.

We decided to start with small steps and first of all defined an MVP (minimum viable product) for our app.

Our MVP was:

```
User can open an app and type the name of alcohol
```
```
User can press search and see the list of available cocktails
```
```
User can choose one cocktail and see the instructions
```

We used Swift as a language for the project. No one in our team had any experience of using Swift prior to starting the project.  We were given one week to implement features, the second week was used to spend time refactoring code, styling and working on our presentation.

When we started to build our MVP we quickly realized that we would not have enough time to add the image recognition feature and should focus on smaller features that could help our MVP look better and testing.

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

Local on your machine load iPhone simulator:
* clone this project, in your terminal type ```gem install cocoapods```, ```pod repo update```, ```pod install```
* open MixMakers.xcworkspace
* press cmd+r

Result:
-------

As a result of the two weeks, we have managed to build three screens:
* Search screen, where a User can search for ingredients
* Cocktails screen, where a User can see available cocktails cards based on ingredient their search
* Instructions screen, where a User can see the instructions how to prepare their chosen cocktail

Reflections:
-------

### As a result of the two weeks we can state the following:

We had two amazing weeks working on this project. We achieved a lot and we are really proud of ourselves and our final app. But it was not easy all the time.

#### Within our team we agreed some grounds rules for the two weeks:

* Stand-up's at 10:00 am every day:
   1. Discuss the scope of work for the day,
   1. Reallocate tickets, if necessary and
   1. Merge pull requests.
* Retro at 17:00 every day:
   1. Discuss worked completed,
   1. Reflect on what went well and what didn't go so well, and
   1. Provide each other with feedback, where necessary.

* Switching Project Manager every day.
* Pair programming.
* Working in two-day sprints.

### Week One

#### Day One
We spent a lot of time during the first day exploring a Swift and Xcode.

In our pairs, we started by building a test driven FizzBuzz program, which used both unit tests and UI test. We also found an API that we could use to give us the cocktail information we required. By the end of the day, we ended up with two screens:
* Search screen with the search field and
* Cocktails screen that loaded a list of Gin cocktails from the API.

At this point, these screens did not communicate with each other, the API request was hard-coded to provide the results.

#### Day Two
The second day we remained in our same pairs:
* Mary & Andrew - working on API tests
* Jack & Louis - linked together the logic from first screen and second screen

#### Day Three
We rotated pairs for our second two-day sprint:
* Jack & Mary - UI tests
* Andrew & Louis - worked on third screen, creating a seperate API request to obtain specific cocktail ingredients

#### Day Four
We remained in our same pairs:
* Andrew & Louis - continued to implement our third screen with cocktail ingredients, card implementation
* Jack & Mary - trying to implement tags & homescreen gif(later removed)

### Week Two

#### Day Five
We commenced our third two-day sprint
* Jack & Mary - multiple ingredient search feature
* Andrew & Louis - third screen testing

#### Day Six (feature freeze)
The second day we have spent in pairs:
* Andrew & Louis - working on further tests and test coverage.
* Jack & Mary - started to work on work documentation, README, and Presentation.

#### Day Seven
Further working on tests and test coverage.
Working on application styling.

#### Day Eight
Group work on final presentation

#### Learnings:
* How to use Xcode and main shortcuts:
```cmd + shift + k``` - cleans everything,
```cmd + b``` - build app,
```cmd + r``` - run app,
```cmd + u``` - build tests

* Xcode View Controllers
* Swift & Pods
* How to manage the project through GitHub and Xcode


#### Difficulties:
* Testing in Swift
* Working with a new language - Swift
* Lack of understanding how Xcode works


#### Positives:
* Cocktails :)
* Followed XP values
* Good team working
* Followed AGILE processes
* Had Fun

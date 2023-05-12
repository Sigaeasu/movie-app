# Flutter Movie Ticket Sales App

This is a mobile application built with Flutter that allows users to buy movie tickets. The app includes several main features such as user authentication, movie listings, movie details, transaction history, and user profile.

## Installation

To install and run this app, follow these steps:

1. Clone this repository to your local machine
```console
git clone https://github.com/your_username/movie-app.git
```
2. Navigate to the project directory
```console
git clone https://github.com/your_username/movie-app.git
```
3. Install the required dependencies
```console
flutter pub get
```
4. Run the app on a connected device or emulator
```console
flutter run
```
5. (Optional) Build APK for android
```console
flutter build apk
```

## Features

### User Authentication

The user authentication feature allows users to register a new account or log in to an existing account. The user can register an account by entering their email, and password. After registering an account, the user can log in to the app using their email and password. (Please note that the current version of this application uses hardcoded JSON data for user authentication)

### Movie Listings

The movie listings feature displays a list of movies that are currently showing in theaters. The user can browse through the list of movies and select a movie to view its details.

### Movie Details

The movie details feature displays detailed information about a selected movie, including the title, synopsis, genre, release date, and rating. The user can also view the available showtimes for the movie and select a showtime to buy a ticket.

### Transaction History

The transaction history feature displays a list of the user's transactions, including the movie title, showtime, ticket quantity, and total cost. 
[Note: For the current version, the transaction history feature is only a mock-up and does not have any actual functionality yet.]

### User Profile

The user profile feature displays the user's personal information, including their name and email. 

### Data Source
This app uses the open-source API provided by The Movie Database (https://developers.themoviedb.org) as a source of data for its movie listings and details features.


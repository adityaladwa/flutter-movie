# Flutter Movie App

This Flutter application allows users to discover popular movies sourced from the TMDB API. Users can browse through an extensive list of movies, view detailed information about each movie including its synopsis, rating, and cast members. The app provides a user-friendly interface for exploring the world of cinema.

## Key Features

- **Discover Popular Movies:** Browse a continuously updated list of popular movies.
- **View Movie Details:** Access comprehensive information for each movie, including its synopsis, user ratings, poster image, and cast members.
- **Responsive UI:** Enjoy a seamless experience across various device screen sizes thanks to Flutter's responsive design capabilities.


## Setup Instructions

Follow these steps to set up and run the project on your local machine.

**1. Prerequisites:**
   - Flutter SDK version 3.19.0 or higher. You can download it from [flutter.dev](https://flutter.dev).
   - Git for cloning the repository.

**2. Clone the Repository:**
   ```bash
   git clone https://github.com/your-username/flutter_movie_app.git # Replace with the actual repository URL
   cd flutter_movie_app
   ```

**3. TMDB API Key:**
   - This project requires a TMDB API key to fetch movie data.
   - Obtain your free API key from [https://www.themoviedb.org/settings/api](https://www.themoviedb.org/settings/api).
   - Once you have your key, you need to place it in the project. Create a file named `.env` in the root of the project and add your API key like this:
     ```
     TMDB_API_KEY=YOUR_ACTUAL_API_KEY
     ```
   - **Important**: The application is configured to load the API key from this `.env` file. Ensure the file is correctly named and placed.

**4. Install Dependencies:**
   Navigate to the project directory in your terminal and run:
   ```bash
   flutter pub get
   ```

**5. Run the App:**
   Make sure you have a device running (emulator or physical device) and then run:
   ```bash
   flutter run
   ```


## Project Structure

Here's an overview of the key directories and files in the project:

- **`lib/`**: This directory contains all the main Dart code for the application.
    - **`lib/api/`**: Handles the integration with the TMDB API. It includes the API service definition (`tmdb_api_service.dart`) and manages API requests and responses (e.g., `api_service_manager.dart`).
    - **`lib/model/`**: Defines the data models (Plain Old Dart Objects - PODOs) that represent the movie data fetched from the API, such as `DiscoverMovie` and `MovieDetail`.
    - **`lib/widget/`**: Contains the Flutter widgets that form the user interface of the application. This includes main app widgets like `MovieApp`, and specific UI components like `MovieDiscovery` (for browsing movies) and `MovieDetailWidget` (for displaying movie details).
    - **`lib/main.dart`**: The main entry point of the Flutter application. It initializes the app and sets up essential services.
- **`android/`**: Contains Android-specific project files and configurations. This is where you'd manage settings related to how the app builds and runs on Android.
- **`ios/`**: Contains iOS-specific project files and configurations. This is where you'd manage settings related to how the app builds and runs on iOS.
- **`test/`**: This directory is intended for application tests. (Note: Currently, it might be empty or contain default test files).


## How to Contribute

Contributions are welcome! If you'd like to contribute, please follow these steps:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/your-feature-name`).
3. Make your changes and commit them (`git commit -m 'Add some feature'`).
4. Push to the branch (`git push origin feature/your-feature-name`).
5. Open a Pull Request.


## Libraries uses

- [dio](https://pub.dev/packages/dio)
- [retrofit](https://pub.dev/packages/retrofit)
- [build_runner](https://pub.dev/packages/build_runner)


## Screenshots

![discover_movies.png](screenshot%2Fdiscover_movies.png)
# Dyslexiease - A Flutter App for Dyslexia Assistance

## Overview

Dyslexiease is a mobile application designed to assist individuals with dyslexia. Built using Flutter, it provides a range of tools to help users interact with and understand text more easily. The app aims to improve accessibility and make reading and working with text a more comfortable experience.

## Features

The app includes the following key features:

* **Text Input Options:**
    * **Scan PDF:** Allows users to upload and process text from PDF documents.
    * **Scan Picture:** Enables users to capture text from images using their device's camera or gallery.
    * **Paste Text:** Provides a simple interface for users to directly paste text into the app.
* **Text Display:** Displays the processed text in a user-friendly format, potentially with dyslexia-friendly fonts and formatting.
* **Chat Feature:** Integrates a chatbot to provide interactive assistance and answer user queries.
* **User Authentication:** Implements user sign-up and sign-in functionality to personalize the user experience (using Firebase Authentication).
* **Dyslexia-Friendly Design:** The app uses the OpenDyslexic font and other design considerations to improve readability for users with dyslexia.
* **Splash Screen:** A visually appealing splash screen is displayed when the app is launched.

## Target Audience

This app is primarily intended for:

* Individuals with dyslexia who need assistance with reading and text processing.
* Educators and support staff working with dyslexic individuals.
* Anyone who wants to make reading digital text easier.

## Tech Stack

The app is built using the following technologies:

* **Flutter:** A cross-platform mobile application development framework.
* **Dart:** The programming language used to write the Flutter app.
* **Firebase:**
    * **Firebase Authentication:** For user authentication (sign-up/sign-in).
* **Packages:**
    * `http`: For making HTTP requests (e.g., to a chatbot API).
    * `image_picker`: For selecting images from the device's gallery or camera.
    * `file_picker`:  For selecting files from device storage.
    * `flutter_dotenv`: For managing environment variables (API keys).

## Installation

To run this app, you will need to have Flutter installed on your development machine. Follow these steps:

1.  **Install Flutter:** Follow the official Flutter installation guide for your operating system: [https://flutter.dev/docs/get-started/install](https://flutter.dev/docs/get-started/install)
2.  **Clone the Repository:** Clone this Git repository to your local machine using:
    ```bash
    git clone [https://github.com/your-username/your-repository-name.git](https://github.com/your-username/your-repository-name.git)
    ```
    (Replace `your-username/your-repository-name` with the actual repository URL.)
3.  **Navigate to the Project Directory:** Open a terminal and navigate to the project's root directory:
    ```bash
    cd your-repository-name
    ```
4.  **Set up Firebase:**
    * Create a Firebase project on the Firebase Console ([https://console.firebase.google.com/](https://console.firebase.google.com/)).
    * Configure Firebase Authentication.
    * Add your app to your Firebase project (for Android and iOS).
    * Download the `google-services.json` (for Android) and `GoogleService-Info.plist` (for iOS) configuration files and place them in the appropriate directories in your Flutter project (e.g., `android/app/google-services.json` and `ios/Runner/GoogleService-Info.plist`).
5.  **Configure Environment Variables:**
    * Create a `.env` file in the root of your project.
    * Add your Firebase API keys and other sensitive information to the `.env` file.  For example:

        ```
        FIREBASE_API_KEY_WEB=YOUR_WEB_API_KEY
        FIREBASE_APP_ID_WEB=YOUR_WEB_APP_ID
        FIREBASE_MESSAGING_SENDER_ID=YOUR_SENDER_ID
        FIREBASE_PROJECT_ID=YOUR_PROJECT_ID
        FIREBASE_AUTH_DOMAIN=YOUR_AUTH_DOMAIN
        FIREBASE_STORAGE_BUCKET=YOUR_STORAGE_BUCKET
        FIREBASE_MEASUREMENT_ID_WEB=YOUR_WEB_MEASUREMENT_ID

        FIREBASE_API_KEY_ANDROID=YOUR_ANDROID_API_KEY
        FIREBASE_APP_ID_ANDROID=YOUR_ANDROID_APP_ID

        FIREBASE_API_KEY_IOS=YOUR_IOS_API_KEY
        FIREBASE_APP_ID_IOS=YOUR_IOS_APP_ID
        FIREBASE_IOS_BUNDLE_ID=YOUR_IOS_BUNDLE_ID

        FIREBASE_API_KEY_MACOS=YOUR_MACOS_API_KEY

        FIREBASE_API_KEY_WINDOWS=YOUR_WINDOWS_API_KEY
        FIREBASE_MEASUREMENT_ID_WINDOWS=YOUR_WINDOWS_MEASUREMENT_ID
        ```
        **Replace the `YOUR_...` placeholders with your actual Firebase configuration values.**
    * Ensure that the `.env` file is **NOT** committed to your Git repository.  It should be added to your `.gitignore` file.
6.  **Install Dependencies:** Run the following command in your terminal to install the required Flutter packages:
    ```bash
    flutter pub get
    ```
7.  **Run the App:** Connect a mobile device or start an emulator, and run the app using:
    ```bash
    flutter run
    ```

## Usage

1.  **Splash Screen:** When you first open the app, a splash screen will be displayed for a few seconds.
2.  **Authentication:** If you are not logged in, you will be taken to the authentication screen, where you can sign up or sign in. If you are already logged in, you will be taken to the Home Page.
3.  **Home Page:** The home page provides options to:
    * **Scan PDF:** Upload a PDF file to extract text.
    * **Scan Picture:** Capture text from an image using the camera or select an image from the gallery.
    * **Paste Text:** Manually paste text into the app.
    * **Chat:** Access the chatbot feature.
4.  **Text Display:** After processing the text (from a PDF, image, or pasted input), the extracted text is displayed on the Text Display screen.
5.  **Chat:** The chat screen allows you to interact with a chatbot.

## Important Notes

* **API Keys:** Ensure that your Firebase API keys are properly secured.  Do not commit them directly to your repository.  Use a `.env` file and the `flutter_dotenv` package as shown in the Installation section.
* **Firebase Configuration:** The app relies on Firebase for user authentication.  You must set up a Firebase project and configure it correctly as described in the Installation section.
* **Permissions:** The app requires permissions to access the device's camera and storage.  Ensure that these permissions are granted.
* **Error Handling:** The code should include proper error handling for file processing, API calls, and other operations.
* **UI/UX:** The app's user interface is designed to be dyslexia-friendly, but further improvements can be made to enhance the user experience.
* **Dependencies:** Keep your dependencies updated by running `flutter pub upgrade`.
* **Testing:** Thoroughly test the app on different devices and screen sizes.

## Future Enhancements

* Implement text-to-speech functionality.
* Add more advanced text processing options.
* Improve the chatbot's capabilities.
* Enhance the UI/UX based on user feedback.
* Add support for more file types.
* Implement user settings to customize the app's appearance and behavior.

## Contributing

Contributions to this project are welcome. If you find a bug or have a suggestion for a new feature, please open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).

## Author

[Your Name]
[Your Email]
[Your GitHub Profile URL]

## Acknowledgements

* Flutter Team
* Firebase Team
* The Dyslexia Community
* OpenDyslexic Font

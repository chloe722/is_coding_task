# IS_coding_task

## Getting Started
These instructions will help you start running the project on your local machine.


## Prerequisites


### Install Androd Studio

Install Android Studio. Please skip if you alreayd have 

### Install XCode
Haved XCode install if you wish to run the project with iOS emulator


### Install Flutter
* Make sure have [Flutter](https://flutter.dev/docs/get-started/install) installed in your local machine

* Note: Make sure have emulator device exist. If you don't have, please run `flutter emulators --create [--name xyz]`.
```
＄flutter emulators create--launch Nexus_6P
```

# Running
* Clone this repo to your local machine using https://github.com/chloe722/is_coding_task.git
* Run `flutter emulator` in command line inside the folder to find your avalibale emulator. 
* Run `flutter emulators --launch <emulator id>` in command line to start the emulator

```
$cd../is_coding_task
$flutter emulator
$flutter emulators --launch <emulator id>
```

* Run `flutter run` to run the project
```
$flutter run
```

### Running Test

Enter `flutter test` to run tests in command line
```
＄flutter test
```

## Tech/Frameworks 
* Developed with [Flutter](https://flutter.dev/docs/get-started/install) using [Dart language](https://dart.dev/)
* Used [flutter_bloc](https://pub.dev/packages/flutter_bloc) to architec the code

### packages use in the project
* [rxdart](https://pub.dev/packages/rxdart)
* [equatable](https://pub.dev/packages/equatable)
* [uuid](https://pub.dev/packages/uuid)
* [cached_network_image](https://pub.dev/packages/cached_network_image)
* [fluttertoast](https://pub.dev/packages/fluttertoast)
* [mockito](https://pub.dev/packages/mockito)
* [bloc_test](https://pub.dev/packages/bloc_test)


## Screenshot

<p align="center">
  <img height= "700" src="assets/screenshot.gif">
</p>









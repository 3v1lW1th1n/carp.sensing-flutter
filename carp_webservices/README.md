# CARP Web Service Plugin for Flutter

A Flutter plugin to access the [CARP Web Service API](https://github.com/cph-cachet/carp.webservices).

[![pub package](https://img.shields.io/pub/v/carp_webservices.svg)](https://pub.dartlang.org/packages/carp_webservices)

For Flutter plugins for other CARP products, see [CARP Mobile Sensing in Flutter](https://github.com/cph-cachet/carp.sensing-flutter/blob/master/README.md).

*Note*: This plugin is still under development, and some APIs might not be available yet. 
[Feedback](https://github.com/cph-cachet/carp.sensing-flutter/issues) and 
[Pull Requests](https://github.com/cph-cachet/carp.sensing-flutter/pulls) are most welcome!

## Setup

1. You need a CARP Web Service host running. See the [CARP Web Service API](https://github.com/cph-cachet/carp.webservices) 
documentation for how to do this. If you're part of the [CACHET](http://www.cachet.dk/) team, you can use the specified 
development, staging, and production servers.

1. Add `carp_services` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

## Usage

```dart
import 'package:carp_webservices/carp_service/carp_service.dart';
```

**Configuration of `CarpService`**

The `CarpService` is a singleton and needs to be configured once.
Note that a valid `Study` with a valid study ID is needed.

````dart
final String uri = "http://staging.carp.cachet.dk:8080";

CarpApp app;
Study study;

study = new Study(testStudyId, "user@dtu.dk", name: "Test study #$testStudyId");
app = new CarpApp(
      study: study,
      name: "any_display_friendly_name_is_fine",
      uri: Uri.parse(uri),
      oauth: OAuthEndPoint(clientID: clientID, clientSecret: clientSecret, path: "/oauth/token"));

CarpService.configure(app);

```` 

The singleton can then be accessed via `CarpService.instance`.

**Authentication**

Authentication is currently only supported using username and password.

```dart
CarpUser user;
try {
   user = await CarpService.instance.authenticate(username: "a_username", password: "the_password");
} catch (excp) {
   ...;
}
```


**File Upload**

A `FileStorageReference` is used to upload files to CARP. 
You can add metadata to a file using the `FileMetadata` class.

````dart
final File myFile = new File("abc.txt");

final FileUploadTask uploadTask = CarpService.instance.getFileStorageReference("abc.txt").putFile(
      myFile,
      new FileMetadata(
        contentLanguage: 'en',
        customMetadata: <String, String>{'activity': 'test'},
      ),
    );

await uploadTask.onComplete;
````

**Data Points**



**Collections and Objects**
 


## Getting Started

For help getting started with Flutter, view our online [documentation](https://flutter.io/).

For help on editing package code, view the [documentation](https://flutter.io/developing-packages/).
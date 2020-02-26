# drone-firebase-app-distribution

Drone plugin used to upload an APK(Android) or IPA(IOS) to Firebase App Distribution.

### Usage in Drone pipeline
The followings are the settings you can pass into the plugin:

| Settings              | Description                                                    |
| --------------------- | -------------------------------------------------------------- |
| `token`               | Firebase token                                                 |
| `file_path`           | The relative path to your .apk or .ipa                         |
| `app`                 | Your app id in Firebase console                                |
| `release_notes`       | Release notes in string                                        |
| `release_notes_files` | a path to the release note file, relative to your project root |
| `testers`             | a comma-separated list of tester emails                        |
| `testers_file`        | the path to the testers file, relative to your project root    |
| `groups`              | a comma-separated list of groups                               |
| `groups_file`         | a path too the groups file, relative to your project root      |

Note that you can find more details for each parameter in the Firebase official CLI doc: https://firebase.google.com/docs/app-distribution/android/distribute-cli

Here is the example in your Drone pipeline:
```
- name: Upload App to Firebase App Distribution
  image: worapholj/drone-firebase-app-distribution:0.1.3
  settings:
    token:
      from_secret: your-firebase-token
    file_path: app/build/outputs/apk/alpha/debug/app-alpha-debug.apk
    app: your-firebase-app-id
    release_notes: "This is the most awesome version of my app"
    release_notes_file: relative/path/to/your/file
    testers: "ali@example.com, bri@example.com, cal@example.com"
    testers-file: relative/path/to/your/file
    groups: "qa-team, trusted-testers"
    groups_file: relative/path/to/your/file
```

### Use the plugin (image) locally
If for some reason, you are not using Drone, this docker image still gets you covered as it is basically a normal docker image.
Use the below command to run the build:
```
docker run -e PLUGIN_TOKEN="****TOKEN****" -e PLUGIN_FILE_PATH="app/build/outputs/apk/alpha/debug/app-alpha-debug.apk" -e PLUGIN_GROUPS="developer" -e PLUGIN_APP=1:xxxxxxxxxxxx:android:xxxxxxxxxxxxxxxxxxxxxx --rm -v `pwd`:/project worapholj/drone-firebase-app-distribution:0.1.3
```

### Build
If you want to tweak the plugin to suit your need, feel free to contribute or fork. The below command is how you build an image.
```
docker build -t drone-firebase-app-distribution:0.1.3 .
```

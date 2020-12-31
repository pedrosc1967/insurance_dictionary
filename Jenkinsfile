def appname = "Runner" //DON'T CHANGE THIS. This refers to the flutter 'Runner' target.
def xcarchive = "${appname}.xcarchive"

pipeline {
    agent { any } //Change this to whatever your flutter jenkins nodes are labeled.
    environment {
        DEVELOPER_DIR="/Applications/Xcode.app/Contents/Developer/"  //This is necessary for Fastlane to access iOS Build things.
        PATH = "/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/aplanetbit/Development/flutter/bin:/System/Volumes/Data/Users/aplanetbit/Library/Android/sdk/platform-tools/:/Users/aplanetbit/Development/flutter/.pub-cache/bin:/Users/aplanetbit/Development/flutter/bin/cache/dart-sdk/bin/:/Users/aplanetbit/Development/sonar-scanner-4.5.0.2216-macosx/bin/:/Library/Apple/usr/bin"
    }
    stages {
            stage ('Checkout') {
                steps {
                    step([$class: 'WsCleanup'])
                    checkout scm
                    sh "rm -rf brbuild_ios" //This removes the previous checkout of brbuild_ios if it exists.
                    sh "rm -rf ios/fastlane/brbuild_ios" //This removes the brbuild_ios from the fastlane directory if it somehow still exists
                    sh "git clone https://github.com/pedrosc1967/insurance_dictionary.git"
                }
            }
            stage ('Flutter Doctor') {
                steps {
                    sh "flutter doctor -v"
                }
            }
            stage ('Flutter Build APK') {
                steps {
                    sh "flutter build apk"
                }
            }

            stage('Flutter Build iOS') {
                 steps {
                     sh "flutter build ios --release --no-codesign"
                 }
            }
            stage('Make iOS IPA ') {
                 steps {
                      dir('ios'){
                               sh "bundle install"
                               // sh "bundle exec fastlane buildAdHoc --verbose"
                      }
                 }
            }
            stage('Cleanup') {
                 steps {
                       sh "flutter clean"
                 }
            }
    }
}
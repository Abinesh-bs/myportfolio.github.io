# Abinesh BS – Flutter Web Portfolio

## Run
    flutter create . --platforms web   # only if web/ icons/manifest are missing
    flutter pub get
    flutter run -d chrome

## Build & deploy (GitHub Pages)
    flutter build web --release --base-href "/myportfolio.github.io/"
Upload everything inside build/web to your GitHub Pages repo.

## Edit content
Everything lives in lib/data.dart:
- Profile  -> name, roles, about, email, LinkedIn, skills, stats
- jobs     -> add a Job(...) line
- projects -> add a Project(...) block (omit play:/ios: if no link)

Reusable UI parts are in lib/widgets.dart.

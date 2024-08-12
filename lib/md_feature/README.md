# md_feature

[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)


![](https://img.shields.io/github/stars/pandao/editor.md.svg) ![](https://img.shields.io/github/forks/pandao/editor.md.svg) ![](https://img.shields.io/github/tag/pandao/editor.md.svg) ![](https://img.shields.io/github/release/pandao/editor.md.svg) ![](https://img.shields.io/github/issues/pandao/editor.md.svg) ![](https://img.shields.io/bower/v/editor.md.svg)

Brick for creating new feature from template using the [mason](https://pub.dev/packages/mason) 🧱

[TOC]

## Getting Started 🚀

### Requirements
This brick requires packages to be installed
- [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- [dio](https://pub.dev/packages/dio)
- [retrofit](https://pub.dev/packages/retrofit)
- [build_runner](https://pub.dev/packages/build_runner) (as dev dependency)
- [retrofit_generator](https://pub.dev/packages/retrofit_generator) (as dev dependency)

(All required dependencies can be added automatically using `post_gen.dart` hook with optional function)

### Installation

Initialize and add brick using [mason_cli](https://pub.dev/packages/mason_cli)

```sh
# 🎯 Activate from https://pub.dev
dart pub global activate mason_cli

# 🚀 Initialize mason
mason init

# 📦 Install the brick
mason add md_feature
```

To create a feature, you must provide two values:
- project_name - name of the project to import package (you can take it from `name` field inside `pubspec.yaml` of the project)
- feature_name - name of the created feature, for example if path to your features directory is `lib/src/features/`, provide `src/features`

You can create `json` file for persistent variable values

```json
{
  "project_name": "example_project",
  "path_to_feature": "src/features"
}
```

Use it with the command
```sh
mason make md_feature -c config.json
```

For custom output path provide additional `-o` argument
```
mason make md_feature -c config.json -o lib/src/features/
```

## Output
Created feature structure will look this
```
├ {{feature}}
│├── bloc
││├── {{feature}}_bloc.dart
││├──  {{feature}}_bloc_data.dart
││├──  {{feature}}_bloc_event.dart
││└── {{feature}}_bloc_state.dart
│├── data
││├──  data_source
│││├── {{feature}}_remote_data_source.dart
│││└── {{feature}}_remote_data_source.g.dart
││├── repository
│││└─── {{feature}}_repository_impl.dart
   └── domain
      └── interface
          └── i_{{feature}}_repository.dart
```

## TODO
- describe every feature layer in the README.md
- create tests
- provide entity script example
- provide model script example
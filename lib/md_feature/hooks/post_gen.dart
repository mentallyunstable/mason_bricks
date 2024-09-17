import 'dart:io';

import 'package:mason/mason.dart';

import 'dependencies.dart';
import 'variables.dart';

Future<void> run(HookContext context) async {
  final logger = context.logger;
  final appDirectory = Directory.current.path;

  final folders = Platform.isWindows ? appDirectory.split(r'\').toList() : appDirectory.split('/').toList();
  final libIndex = folders.indexWhere((folder) => folder == 'lib');
  final root = folders.sublist(0, libIndex).join('/').toString();

  final useFvm = context.vars[Variables.useFvmVar];

  // Add required dependencies
  if (logger.confirm('Do you want to add required dependencies?')) {
    final flutterExecutable = '${useFvm ? 'fvm ' : ''}flutter';

    logger.info('Add required dependencies... $root');
    await Process.run(
      flutterExecutable,
      ['pub', 'add', ...Dependencies.devDependencies, '-d'],
      runInShell: true,
      workingDirectory: root,
    ).then(
      (result) {
        stdout.write(result.stdout);
        stdout.write(result.stderr);
        return result.exitCode;
      },
    );

    await Process.run(
      flutterExecutable,
      ['pub', 'add', ...Dependencies.dependencies],
    ).then(
      (result) {
        stdout.write(result.stdout);
        stdout.write(result.stderr);
        return result.exitCode;
      },
    );

    // Get dependencies
    logger.info('Run pub get...');
    await Process.run(
      flutterExecutable,
      ['pub', 'get'],
      runInShell: true,
      workingDirectory: root,
    ).then(
      (result) {
        stdout.write(result.stdout);
        stdout.write(result.stderr);
        return result.exitCode;
      },
    );
  }
  // Call build_runner generation
  final dartExecutable = '${useFvm ? 'fvm ' : ''}dart';
  logger.info('Run build runner...');
  await Process.run(
    dartExecutable,
    ['run', 'build_runner', 'build', '--delete-conflicting-outputs'],
    runInShell: true,
    workingDirectory: root,
  ).then((result) {
    stdout.write(result.stdout);
    stdout.write(result.stderr);
    return result.exitCode;
  });
}

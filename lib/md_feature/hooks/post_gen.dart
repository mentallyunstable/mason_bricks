import 'dart:io';

import 'package:mason/mason.dart';

import 'dependencies.dart';

Future<void> run(HookContext context) async {
  final logger = context.logger;
  final appDirectory = Directory.current.path;

  final folders = Platform.isWindows ? appDirectory.split(r'\').toList() : appDirectory.split('/').toList();
  final libIndex = folders.indexWhere((folder) => folder == 'lib');
  final root = folders.sublist(0, libIndex).join('/').toString();

  // Add required dependencies
  if (logger.confirm('Do you want to add required dependencies?')) {
    logger.info('Add required dependencies... $root');
    await Process.run(
      'flutter',
      ['pub', 'add', ...Dependencies.devDependencies, '-d'],
      runInShell: true,
      workingDirectory: root,
    );
    // TODO: resolve exceptions when trying to log process output
    // await stdout.addStream(devDependenciesProcess.stdout);
    // await stderr.addStream(devDependenciesProcess.stderr);

    await Process.run(
      'flutter',
      ['pub', 'add', ...Dependencies.dependencies],
    );
    // await stdout.addStream(dependenciesProcess.stdout);
    // await stderr.addStream(dependenciesProcess.stderr);

    // Get dependencies
    logger.info('Run pub get...');
    await Process.run(
      'flutter',
      ['-c', 'pub', 'get'],
      runInShell: true,
      workingDirectory: root,
    );
    // await stdout.addStream(pubGetProcess.stdout);
    // await stderr.addStream(pubGetProcess.stderr);
  }
  // Call build_runner generation
  logger.info('Run build runner...');
   await Process.run(
    'dart',
    ['run', 'build_runner', 'build', '--delete-conflicting-outputs'],
    runInShell: true,
    workingDirectory: root,
  );
  // await stdout.addStream(builderProcess.stdout);
  // await stdout.addStream(builderProcess.stderr);
}

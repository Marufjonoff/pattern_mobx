// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EditStore on _EditStore, Store {
  final _$isLoadingAtom = Atom(name: '_EditStore.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$nameControllerAtom = Atom(name: '_EditStore.nameController');

  @override
  TextEditingController get nameController {
    _$nameControllerAtom.reportRead();
    return super.nameController;
  }

  @override
  set nameController(TextEditingController value) {
    _$nameControllerAtom.reportWrite(value, super.nameController, () {
      super.nameController = value;
    });
  }

  final _$titleControllerAtom = Atom(name: '_EditStore.titleController');

  @override
  TextEditingController get titleController {
    _$titleControllerAtom.reportRead();
    return super.titleController;
  }

  @override
  set titleController(TextEditingController value) {
    _$titleControllerAtom.reportWrite(value, super.titleController, () {
      super.titleController = value;
    });
  }

  final _$bodyControllerAtom = Atom(name: '_EditStore.bodyController');

  @override
  TextEditingController get bodyController {
    _$bodyControllerAtom.reportRead();
    return super.bodyController;
  }

  @override
  set bodyController(TextEditingController value) {
    _$bodyControllerAtom.reportWrite(value, super.bodyController, () {
      super.bodyController = value;
    });
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
nameController: ${nameController},
titleController: ${titleController},
bodyController: ${bodyController}
    ''';
  }
}

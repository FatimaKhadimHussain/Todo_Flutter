// Mocks generated by Mockito 5.3.2 from annotations
// in todo_assignment/test/features/domain/use_cases/todo/load_todos_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:todo_assignment/core/error/failures.dart' as _i5;
import 'package:todo_assignment/features/domain/entities/todo/todo_item.dart'
    as _i6;
import 'package:todo_assignment/features/domain/repositories/todo/todo_repository.dart'
    as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [TodoRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTodoRepository extends _i1.Mock implements _i3.TodoRepository {
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.TodoItem>>> loadTodos() =>
      (super.noSuchMethod(
        Invocation.method(
          #loadTodos,
          [],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, List<_i6.TodoItem>>>.value(
                _FakeEither_0<_i5.Failure, List<_i6.TodoItem>>(
          this,
          Invocation.method(
            #loadTodos,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, List<_i6.TodoItem>>>.value(
                _FakeEither_0<_i5.Failure, List<_i6.TodoItem>>(
          this,
          Invocation.method(
            #loadTodos,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.TodoItem>>>);
}

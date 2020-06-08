import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb/bloc/bloc.dart';

void main() {
  MainBloc mainBloc;

  setUp(() {
    mainBloc = MainBloc();
  });

  tearDown(() {
    mainBloc?.close();
  });

  test('initial state is correct', () {
    expect(mainBloc.initialState, DisplayHomeTab());
  });

  test('close does not emit new states', () {
    expectLater(
      mainBloc,
      emitsInOrder([DisplayHomeTab(), emitsDone]),
    );
    mainBloc.close();
  });

  group('Bloc test', () {
    blocTest('emits [DisplayRankingTab] when TabPressed 1',
        build: () async => mainBloc,
        act: (bloc) => bloc.add(TabPressed(index: 1)),
        expect: [DisplayRankingTab()]);
  });
}

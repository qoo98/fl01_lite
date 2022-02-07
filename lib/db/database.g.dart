// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Word extends DataClass implements Insertable<Word> {
  final String strMemo;
  Word({required this.strMemo});
  factory Word.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Word(
      strMemo: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}str_memo'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['str_memo'] = Variable<String>(strMemo);
    return map;
  }

  WordsCompanion toCompanion(bool nullToAbsent) {
    return WordsCompanion(
      strMemo: Value(strMemo),
    );
  }

  factory Word.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Word(
      strMemo: serializer.fromJson<String>(json['strMemo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'strMemo': serializer.toJson<String>(strMemo),
    };
  }

  Word copyWith({String? strMemo}) => Word(
        strMemo: strMemo ?? this.strMemo,
      );
  @override
  String toString() {
    return (StringBuffer('Word(')
          ..write('strMemo: $strMemo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => strMemo.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Word && other.strMemo == this.strMemo);
}

class WordsCompanion extends UpdateCompanion<Word> {
  final Value<String> strMemo;
  const WordsCompanion({
    this.strMemo = const Value.absent(),
  });
  WordsCompanion.insert({
    required String strMemo,
  }) : strMemo = Value(strMemo);
  static Insertable<Word> custom({
    Expression<String>? strMemo,
  }) {
    return RawValuesInsertable({
      if (strMemo != null) 'str_memo': strMemo,
    });
  }

  WordsCompanion copyWith({Value<String>? strMemo}) {
    return WordsCompanion(
      strMemo: strMemo ?? this.strMemo,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (strMemo.present) {
      map['str_memo'] = Variable<String>(strMemo.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WordsCompanion(')
          ..write('strMemo: $strMemo')
          ..write(')'))
        .toString();
  }
}

class $WordsTable extends Words with TableInfo<$WordsTable, Word> {
  final GeneratedDatabase _db;
  final String? _alias;
  $WordsTable(this._db, [this._alias]);
  final VerificationMeta _strMemoMeta = const VerificationMeta('strMemo');
  late final GeneratedColumn<String?> strMemo = GeneratedColumn<String?>(
      'str_memo', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [strMemo];
  @override
  String get aliasedName => _alias ?? 'words';
  @override
  String get actualTableName => 'words';
  @override
  VerificationContext validateIntegrity(Insertable<Word> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('str_memo')) {
      context.handle(_strMemoMeta,
          strMemo.isAcceptableOrUnknown(data['str_memo']!, _strMemoMeta));
    } else if (isInserting) {
      context.missing(_strMemoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Word map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Word.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $WordsTable createAlias(String alias) {
    return $WordsTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $WordsTable words = $WordsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [words];
}

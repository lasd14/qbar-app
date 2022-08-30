// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tables.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetFavoritesCollection on Isar {
  IsarCollection<Favorites> get favoritess => getCollection();
}

const FavoritesSchema = CollectionSchema(
  name: 'Favorites',
  schema:
      '{"name":"Favorites","idName":"id","properties":[{"name":"qrscan","type":"String"},{"name":"timestamp","type":"Long"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {'qrscan': 0, 'timestamp': 1},
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _favoritesGetId,
  setId: _favoritesSetId,
  getLinks: _favoritesGetLinks,
  attachLinks: _favoritesAttachLinks,
  serializeNative: _favoritesSerializeNative,
  deserializeNative: _favoritesDeserializeNative,
  deserializePropNative: _favoritesDeserializePropNative,
  serializeWeb: _favoritesSerializeWeb,
  deserializeWeb: _favoritesDeserializeWeb,
  deserializePropWeb: _favoritesDeserializePropWeb,
  version: 3,
);

int? _favoritesGetId(Favorites object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _favoritesSetId(Favorites object, int id) {
  object.id = id;
}

List<IsarLinkBase> _favoritesGetLinks(Favorites object) {
  return [];
}

void _favoritesSerializeNative(
    IsarCollection<Favorites> collection,
    IsarRawObject rawObj,
    Favorites object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.qrscan;
  final _qrscan = IsarBinaryWriter.utf8Encoder.convert(value0);
  dynamicSize += (_qrscan.length) as int;
  final value1 = object.timestamp;
  final _timestamp = value1;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _qrscan);
  writer.writeDateTime(offsets[1], _timestamp);
}

Favorites _favoritesDeserializeNative(IsarCollection<Favorites> collection,
    int id, IsarBinaryReader reader, List<int> offsets) {
  final object = Favorites();
  object.id = id;
  object.qrscan = reader.readString(offsets[0]);
  object.timestamp = reader.readDateTime(offsets[1]);
  return object;
}

P _favoritesDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _favoritesSerializeWeb(
    IsarCollection<Favorites> collection, Favorites object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'qrscan', object.qrscan);
  IsarNative.jsObjectSet(
      jsObj, 'timestamp', object.timestamp.toUtc().millisecondsSinceEpoch);
  return jsObj;
}

Favorites _favoritesDeserializeWeb(
    IsarCollection<Favorites> collection, dynamic jsObj) {
  final object = Favorites();
  object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
  object.qrscan = IsarNative.jsObjectGet(jsObj, 'qrscan') ?? '';
  object.timestamp = IsarNative.jsObjectGet(jsObj, 'timestamp') != null
      ? DateTime.fromMillisecondsSinceEpoch(
              IsarNative.jsObjectGet(jsObj, 'timestamp'),
              isUtc: true)
          .toLocal()
      : DateTime.fromMillisecondsSinceEpoch(0);
  return object;
}

P _favoritesDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'qrscan':
      return (IsarNative.jsObjectGet(jsObj, 'qrscan') ?? '') as P;
    case 'timestamp':
      return (IsarNative.jsObjectGet(jsObj, 'timestamp') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'timestamp'),
                  isUtc: true)
              .toLocal()
          : DateTime.fromMillisecondsSinceEpoch(0)) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _favoritesAttachLinks(IsarCollection col, int id, Favorites object) {}

extension FavoritesQueryWhereSort
    on QueryBuilder<Favorites, Favorites, QWhere> {
  QueryBuilder<Favorites, Favorites, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension FavoritesQueryWhere
    on QueryBuilder<Favorites, Favorites, QWhereClause> {
  QueryBuilder<Favorites, Favorites, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<Favorites, Favorites, QAfterWhereClause> idNotEqualTo(int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<Favorites, Favorites, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<Favorites, Favorites, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<Favorites, Favorites, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }
}

extension FavoritesQueryFilter
    on QueryBuilder<Favorites, Favorites, QFilterCondition> {
  QueryBuilder<Favorites, Favorites, QAfterFilterCondition> idEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Favorites, Favorites, QAfterFilterCondition> idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Favorites, Favorites, QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Favorites, Favorites, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Favorites, Favorites, QAfterFilterCondition> qrscanEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'qrscan',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favorites, Favorites, QAfterFilterCondition> qrscanGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'qrscan',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favorites, Favorites, QAfterFilterCondition> qrscanLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'qrscan',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favorites, Favorites, QAfterFilterCondition> qrscanBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'qrscan',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favorites, Favorites, QAfterFilterCondition> qrscanStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'qrscan',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favorites, Favorites, QAfterFilterCondition> qrscanEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'qrscan',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favorites, Favorites, QAfterFilterCondition> qrscanContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'qrscan',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favorites, Favorites, QAfterFilterCondition> qrscanMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'qrscan',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Favorites, Favorites, QAfterFilterCondition> timestampEqualTo(
      DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'timestamp',
      value: value,
    ));
  }

  QueryBuilder<Favorites, Favorites, QAfterFilterCondition>
      timestampGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'timestamp',
      value: value,
    ));
  }

  QueryBuilder<Favorites, Favorites, QAfterFilterCondition> timestampLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'timestamp',
      value: value,
    ));
  }

  QueryBuilder<Favorites, Favorites, QAfterFilterCondition> timestampBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'timestamp',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }
}

extension FavoritesQueryLinks
    on QueryBuilder<Favorites, Favorites, QFilterCondition> {}

extension FavoritesQueryWhereSortBy
    on QueryBuilder<Favorites, Favorites, QSortBy> {
  QueryBuilder<Favorites, Favorites, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Favorites, Favorites, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Favorites, Favorites, QAfterSortBy> sortByQrscan() {
    return addSortByInternal('qrscan', Sort.asc);
  }

  QueryBuilder<Favorites, Favorites, QAfterSortBy> sortByQrscanDesc() {
    return addSortByInternal('qrscan', Sort.desc);
  }

  QueryBuilder<Favorites, Favorites, QAfterSortBy> sortByTimestamp() {
    return addSortByInternal('timestamp', Sort.asc);
  }

  QueryBuilder<Favorites, Favorites, QAfterSortBy> sortByTimestampDesc() {
    return addSortByInternal('timestamp', Sort.desc);
  }
}

extension FavoritesQueryWhereSortThenBy
    on QueryBuilder<Favorites, Favorites, QSortThenBy> {
  QueryBuilder<Favorites, Favorites, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Favorites, Favorites, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Favorites, Favorites, QAfterSortBy> thenByQrscan() {
    return addSortByInternal('qrscan', Sort.asc);
  }

  QueryBuilder<Favorites, Favorites, QAfterSortBy> thenByQrscanDesc() {
    return addSortByInternal('qrscan', Sort.desc);
  }

  QueryBuilder<Favorites, Favorites, QAfterSortBy> thenByTimestamp() {
    return addSortByInternal('timestamp', Sort.asc);
  }

  QueryBuilder<Favorites, Favorites, QAfterSortBy> thenByTimestampDesc() {
    return addSortByInternal('timestamp', Sort.desc);
  }
}

extension FavoritesQueryWhereDistinct
    on QueryBuilder<Favorites, Favorites, QDistinct> {
  QueryBuilder<Favorites, Favorites, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Favorites, Favorites, QDistinct> distinctByQrscan(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('qrscan', caseSensitive: caseSensitive);
  }

  QueryBuilder<Favorites, Favorites, QDistinct> distinctByTimestamp() {
    return addDistinctByInternal('timestamp');
  }
}

extension FavoritesQueryProperty
    on QueryBuilder<Favorites, Favorites, QQueryProperty> {
  QueryBuilder<Favorites, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Favorites, String, QQueryOperations> qrscanProperty() {
    return addPropertyNameInternal('qrscan');
  }

  QueryBuilder<Favorites, DateTime, QQueryOperations> timestampProperty() {
    return addPropertyNameInternal('timestamp');
  }
}

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetHistoriesCollection on Isar {
  IsarCollection<Histories> get historiess => getCollection();
}

const HistoriesSchema = CollectionSchema(
  name: 'Histories',
  schema:
      '{"name":"Histories","idName":"id","properties":[{"name":"qrscan","type":"String"},{"name":"timestamp","type":"Long"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {'qrscan': 0, 'timestamp': 1},
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _historiesGetId,
  setId: _historiesSetId,
  getLinks: _historiesGetLinks,
  attachLinks: _historiesAttachLinks,
  serializeNative: _historiesSerializeNative,
  deserializeNative: _historiesDeserializeNative,
  deserializePropNative: _historiesDeserializePropNative,
  serializeWeb: _historiesSerializeWeb,
  deserializeWeb: _historiesDeserializeWeb,
  deserializePropWeb: _historiesDeserializePropWeb,
  version: 3,
);

int? _historiesGetId(Histories object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _historiesSetId(Histories object, int id) {
  object.id = id;
}

List<IsarLinkBase> _historiesGetLinks(Histories object) {
  return [];
}

void _historiesSerializeNative(
    IsarCollection<Histories> collection,
    IsarRawObject rawObj,
    Histories object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.qrscan;
  final _qrscan = IsarBinaryWriter.utf8Encoder.convert(value0);
  dynamicSize += (_qrscan.length) as int;
  final value1 = object.timestamp;
  final _timestamp = value1;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _qrscan);
  writer.writeDateTime(offsets[1], _timestamp);
}

Histories _historiesDeserializeNative(IsarCollection<Histories> collection,
    int id, IsarBinaryReader reader, List<int> offsets) {
  final object = Histories();
  object.id = id;
  object.qrscan = reader.readString(offsets[0]);
  object.timestamp = reader.readDateTime(offsets[1]);
  return object;
}

P _historiesDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _historiesSerializeWeb(
    IsarCollection<Histories> collection, Histories object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'qrscan', object.qrscan);
  IsarNative.jsObjectSet(
      jsObj, 'timestamp', object.timestamp.toUtc().millisecondsSinceEpoch);
  return jsObj;
}

Histories _historiesDeserializeWeb(
    IsarCollection<Histories> collection, dynamic jsObj) {
  final object = Histories();
  object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
  object.qrscan = IsarNative.jsObjectGet(jsObj, 'qrscan') ?? '';
  object.timestamp = IsarNative.jsObjectGet(jsObj, 'timestamp') != null
      ? DateTime.fromMillisecondsSinceEpoch(
              IsarNative.jsObjectGet(jsObj, 'timestamp'),
              isUtc: true)
          .toLocal()
      : DateTime.fromMillisecondsSinceEpoch(0);
  return object;
}

P _historiesDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'qrscan':
      return (IsarNative.jsObjectGet(jsObj, 'qrscan') ?? '') as P;
    case 'timestamp':
      return (IsarNative.jsObjectGet(jsObj, 'timestamp') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'timestamp'),
                  isUtc: true)
              .toLocal()
          : DateTime.fromMillisecondsSinceEpoch(0)) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _historiesAttachLinks(IsarCollection col, int id, Histories object) {}

extension HistoriesQueryWhereSort
    on QueryBuilder<Histories, Histories, QWhere> {
  QueryBuilder<Histories, Histories, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension HistoriesQueryWhere
    on QueryBuilder<Histories, Histories, QWhereClause> {
  QueryBuilder<Histories, Histories, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<Histories, Histories, QAfterWhereClause> idNotEqualTo(int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<Histories, Histories, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<Histories, Histories, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<Histories, Histories, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }
}

extension HistoriesQueryFilter
    on QueryBuilder<Histories, Histories, QFilterCondition> {
  QueryBuilder<Histories, Histories, QAfterFilterCondition> idEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Histories, Histories, QAfterFilterCondition> idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Histories, Histories, QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Histories, Histories, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Histories, Histories, QAfterFilterCondition> qrscanEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'qrscan',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Histories, Histories, QAfterFilterCondition> qrscanGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'qrscan',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Histories, Histories, QAfterFilterCondition> qrscanLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'qrscan',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Histories, Histories, QAfterFilterCondition> qrscanBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'qrscan',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Histories, Histories, QAfterFilterCondition> qrscanStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'qrscan',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Histories, Histories, QAfterFilterCondition> qrscanEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'qrscan',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Histories, Histories, QAfterFilterCondition> qrscanContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'qrscan',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Histories, Histories, QAfterFilterCondition> qrscanMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'qrscan',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Histories, Histories, QAfterFilterCondition> timestampEqualTo(
      DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'timestamp',
      value: value,
    ));
  }

  QueryBuilder<Histories, Histories, QAfterFilterCondition>
      timestampGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'timestamp',
      value: value,
    ));
  }

  QueryBuilder<Histories, Histories, QAfterFilterCondition> timestampLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'timestamp',
      value: value,
    ));
  }

  QueryBuilder<Histories, Histories, QAfterFilterCondition> timestampBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'timestamp',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }
}

extension HistoriesQueryLinks
    on QueryBuilder<Histories, Histories, QFilterCondition> {}

extension HistoriesQueryWhereSortBy
    on QueryBuilder<Histories, Histories, QSortBy> {
  QueryBuilder<Histories, Histories, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Histories, Histories, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Histories, Histories, QAfterSortBy> sortByQrscan() {
    return addSortByInternal('qrscan', Sort.asc);
  }

  QueryBuilder<Histories, Histories, QAfterSortBy> sortByQrscanDesc() {
    return addSortByInternal('qrscan', Sort.desc);
  }

  QueryBuilder<Histories, Histories, QAfterSortBy> sortByTimestamp() {
    return addSortByInternal('timestamp', Sort.asc);
  }

  QueryBuilder<Histories, Histories, QAfterSortBy> sortByTimestampDesc() {
    return addSortByInternal('timestamp', Sort.desc);
  }
}

extension HistoriesQueryWhereSortThenBy
    on QueryBuilder<Histories, Histories, QSortThenBy> {
  QueryBuilder<Histories, Histories, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Histories, Histories, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Histories, Histories, QAfterSortBy> thenByQrscan() {
    return addSortByInternal('qrscan', Sort.asc);
  }

  QueryBuilder<Histories, Histories, QAfterSortBy> thenByQrscanDesc() {
    return addSortByInternal('qrscan', Sort.desc);
  }

  QueryBuilder<Histories, Histories, QAfterSortBy> thenByTimestamp() {
    return addSortByInternal('timestamp', Sort.asc);
  }

  QueryBuilder<Histories, Histories, QAfterSortBy> thenByTimestampDesc() {
    return addSortByInternal('timestamp', Sort.desc);
  }
}

extension HistoriesQueryWhereDistinct
    on QueryBuilder<Histories, Histories, QDistinct> {
  QueryBuilder<Histories, Histories, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Histories, Histories, QDistinct> distinctByQrscan(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('qrscan', caseSensitive: caseSensitive);
  }

  QueryBuilder<Histories, Histories, QDistinct> distinctByTimestamp() {
    return addDistinctByInternal('timestamp');
  }
}

extension HistoriesQueryProperty
    on QueryBuilder<Histories, Histories, QQueryProperty> {
  QueryBuilder<Histories, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Histories, String, QQueryOperations> qrscanProperty() {
    return addPropertyNameInternal('qrscan');
  }

  QueryBuilder<Histories, DateTime, QQueryOperations> timestampProperty() {
    return addPropertyNameInternal('timestamp');
  }
}

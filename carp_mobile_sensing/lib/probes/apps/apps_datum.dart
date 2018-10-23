/*
 * Copyright 2018 Copenhagen Center for Health Technology (CACHET) at the
 * Technical University of Denmark (DTU).
 * Use of this source code is governed by a MIT-style license that can be
 * found in the LICENSE file.
 */

part of apps;

/// Holds a list of names of apps installed on the device.
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class AppsDatum extends CARPDatum {
  static CARPDataFormat CARP_DATA_FORMAT =
      new CARPDataFormat(NameSpace.CARP_NAMESPACE, ProbeRegistry.APPS_MEASURE);

  /// List of names on installed apps.
  List<String> installedApps;

  AppsDatum() : super();

  factory AppsDatum.fromJson(Map<String, dynamic> json) =>
      _$AppsDatumFromJson(json);
  Map<String, dynamic> toJson() => _$AppsDatumToJson(this);

  @override
  CARPDataFormat getCARPDataFormat() => CARP_DATA_FORMAT;

  @override
  String toString() {
    String s = 'apps: {';
    installedApps.forEach((appName) {
      s += '$appName,';
    });
    s += '}';
    return s;
  }
}
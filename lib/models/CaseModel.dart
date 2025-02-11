class CaseModel {

  bool _hidden;
  bool _hasBomb;
  bool _hasExploded;
  bool _hasFlag;
  int? _number;

  CaseModel({
    bool hidden = true,
    bool hasBomb = false,
    bool hasExploded = false,
    bool hasFlag = false,
    int? number,
  })  : _hidden = hidden,
        _hasBomb = hasBomb,
        _hasExploded = hasExploded,
        _hasFlag = hasFlag,
        _number = number;

  bool get hidden => _hidden;
  bool get hasBomb => _hasBomb;
  bool get hasExploded => _hasExploded;
  bool get hasFlag => _hasFlag;
  int? get number => _number;

  set hidden(bool value) {
    _hidden = value;
  }

  set hasBomb(bool value) {
    _hasBomb = value;
  }

  set hasExploded(bool value) {
    _hasExploded = value;
  }

  set hasFlag(bool value) {
    _hasFlag = value;
  }

  set number(int? value) {
    _number = value;
  }
}

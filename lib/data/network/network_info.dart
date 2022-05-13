import 'package:data_connection_checker/data_connection_checker.dart';

abstract class NetWorkInfo{
  Future<bool> get isConnected;
}

class NetWorkInfoImpl implements NetWorkInfo{
  DataConnectionChecker _dataConnectionChecker;
  NetWorkInfoImpl(this._dataConnectionChecker);

  @override
  Future<bool> get isConnected => _dataConnectionChecker.hasConnection;

}
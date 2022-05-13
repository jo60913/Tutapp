import 'package:dartz/dartz.dart';
import 'package:untitled/data/data_source/remote_data_source.dart';
import 'package:untitled/data/network/Failure.dart';
import 'package:untitled/data/network/network_info.dart';
import 'package:untitled/data/request/request.dart';
import 'package:untitled/domain/model.dart';
import 'package:untitled/domain/repository.dart';
import 'package:untitled/data/mapper/mapper.dart';
class RepositoryImpl extends Repository{

  RemoteDataSource _remoteDataSource;
  NetWorkInfo _netWorkInfo;
  RepositoryImpl(this._remoteDataSource,this._netWorkInfo);

  @override //Either 左邊為失敗回傳泛型 右邊為正確回傳
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest) async{
    //確認設備使用上網
    if(await _netWorkInfo.isConnected){
      //如果有網路的話
      final response = await _remoteDataSource.login(loginRequest);
      if(response.status == 0){ //成功的話
        return Right(response.toDomain());
      }else{
        return Left(Failure(409,response.message?? "api有問題"));
      }
    }else{
      //沒有網路的話
      return Left(Failure(501,"請檢察網路狀況"));
    }
  }

}
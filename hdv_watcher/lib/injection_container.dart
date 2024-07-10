import 'package:get_it/get_it.dart';
import 'package:hdv_watcher/features/item/data/datasources/item_remote_data_source.dart';
import 'package:hdv_watcher/features/item/data/repositories/item_repository_impl.dart';
import 'package:hdv_watcher/features/item/domain/repositories/item_repository.dart';
import 'package:hdv_watcher/features/item/domain/usecases/fetch_items_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //* Feature : Fetch Item

  sl.registerFactory(() => FetchItemsUsecase(repository: sl()));

  //repository
  sl.registerFactory<ItemRepository>(() => ItemRepositoryImpl(dataSource: sl()));

  // datasource

  sl.registerLazySingleton<ItemRemoteDataSource>(() => ItemRemoteDataSourceImpl());
}
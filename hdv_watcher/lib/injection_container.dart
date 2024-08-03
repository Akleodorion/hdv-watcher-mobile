import 'package:get_it/get_it.dart';
import 'package:hdv_watcher/features/item/data/datasources/item_remote_date_source.dart';
import 'package:hdv_watcher/features/item/data/repository/item_repository_impl.dart';
import 'package:hdv_watcher/features/item/domain/repository/item_repository.dart';
import 'package:hdv_watcher/features/item/domain/usecase/fetch_items_usecase.dart';
import 'package:hdv_watcher/features/item/domain/usecase/fetch_paginated_items_usecase.dart';

// service locator
final sl = GetIt.instance;

Future<void> init() async {
  //* Feature: Items

  // Usecases
  sl.registerFactory<FetchItemsUsecase>(
      () => FetchItemsUsecase(repository: sl()));
  sl.registerFactory(() => FetchPaginatedItemsUsecase(repository: sl()));

  // Repository
  sl.registerFactory<ItemRepository>(
      () => ItemRepositoryImpl(dataSource: sl()));

  // Datasources
  sl.registerFactory<ItemRemoteDateSource>(() => ItemRemoteDateSourceImpl());
}

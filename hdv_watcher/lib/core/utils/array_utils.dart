abstract class ArrayUtils {
  List<int> getIntsFromArray(List<dynamic> datas);
}

class ArrayUtilsImpl implements ArrayUtils {
  @override
  List<int> getIntsFromArray(List datas) {
    return datas.whereType<int>().toList();
  }
}

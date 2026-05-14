import '../data/slider_data_source.dart';

class SliderRepository {
  final SliderDataSource dataSource;

  SliderRepository(this.dataSource);

  List<String> getImages() {
    return dataSource.getImages();
  }
}

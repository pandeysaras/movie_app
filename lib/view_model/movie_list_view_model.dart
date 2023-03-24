import '../data/network/base_api_services.dart';
import '../data/network/network_api_service.dart';
import '../utils/app_url.dart';

class MovieListViewModel {
  final BaseApiServices _apiServices = NetworkApiService();


  Future<List<dynamic>> fetchMovieListAPi() async {
    var data;
    await _apiServices.getGetApiResponse(AppUrl.movieListUrl).then((value) {
      data = value;
    }).onError((error, stackTrace) {
      print(error.toString());
    });
    return data;
  }

}
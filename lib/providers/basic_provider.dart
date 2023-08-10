import 'package:e_commerce/data/models/countries/country_model.dart';
import 'package:e_commerce/data/models/single_model/single_model.dart';
import 'package:e_commerce/data/models/universal_response.dart';
import 'package:e_commerce/data/network/providers/apiprovider.dart';
import 'package:e_commerce/data/status/form_status.dart';
import 'package:flutter/cupertino.dart';
import '../data/models/companies/company_model.dart';

class BasicProvider with ChangeNotifier {
  final ApiProvider apiProvider;

  BasicProvider({required this.apiProvider}) {
    fetchCountries();
    fetchCompanies();
  }

  int _index = 0;
  FormStatus status = FormStatus.pure;
  String errorText = "";
  List<CountryModel> countries = [];
  List<CompanyModel> companies = [];
  SingleModel singleModel = SingleModel(
      id: 0,
      carModel: "",
      logo: "",
      year: 0,
      averagePrice: 0,
      desc: "",
      pics: []);
  TextEditingController controller = TextEditingController();

  void changeIndex(int value) {
    _index = value;
    notifyListeners();
  }

  int get getIndex => _index;

  Future<void> fetchCountries() async {
    notify(FormStatus.loading);
    UniversalData universalData = await apiProvider.getAllCountries();
    if (universalData.error.isEmpty) {
      notify(FormStatus.success);
      countries = universalData.data as List<CountryModel>;
    } else {
      errorText = universalData.error;
      notify(FormStatus.failure);
    }
  }

  Future<void> fetchCompanies() async {
    notify(FormStatus.loading);
    UniversalData data = await apiProvider.getAllCompanies();
    if (data.error.isEmpty) {
      notify(FormStatus.success);
      companies = data.data as List<CompanyModel>;
    } else {
      notify(FormStatus.failure);
      errorText = data.error;
    }
  }

  Future<void> fetchSingleById() async {
    int id = int.parse(controller.text);
    notify(FormStatus.loading);
    UniversalData data = await apiProvider.getSingleCompanyById(id: id);
    if (data.error.isEmpty) {
      notify(FormStatus.success);
      singleModel = data.data as SingleModel;
    } else {
      notify(FormStatus.failure);
      errorText = data.error;
    }
  }

  notify(FormStatus value) {
    status = value;
    notifyListeners();
  }
}

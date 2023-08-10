import 'package:e_commerce/data/models/countries/country_model.dart';
import 'package:e_commerce/data/models/universal_response.dart';
import 'package:e_commerce/data/network/providers/apiprovider.dart';
import 'package:e_commerce/data/status/form_status.dart';
import 'package:e_commerce/providers/basic_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({super.key});

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {

  @override
  void initState() {
    // context.read<BasicProvider>().fetchCountries();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var countries = Provider.of<BasicProvider>(context, listen: false).countries;
    return Scaffold(
      appBar: AppBar(
        title: Text("Countries"),
      ),
      body: Stack(
        children: [
          ListView(
            children: List.generate(countries.length, (index){
              return ListTile(
                title: Text(countries[index].name),
                leading: Text(countries[index].emoji, style: const TextStyle(color: Colors.red),),
                subtitle: Text(countries[index].capital),
                trailing: Text(countries[index].phone, style: TextStyle(color: Colors.green),),
              );
            }),
          ),
          Visibility(
              visible: FormStatus.loading==context.watch<BasicProvider>().status,
              child: const Center(child: CircularProgressIndicator(),))
        ],
      ),
    );
  }
}

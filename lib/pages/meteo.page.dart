import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:demo_app_2/widgets/mydrawer.widget.dart';

class MeteoPage extends StatefulWidget {
  const MeteoPage({Key? key}) : super(key: key);

  @override
  _MeteoPageState createState() => _MeteoPageState();
}

class _MeteoPageState extends State<MeteoPage> {
  String city = "RABAT";
  List<dynamic>? forecast;
  bool isLoading = false;

  Future<void> fetchWeather() async {
    final apiKey = dotenv.env['OPENWEATHER_API_KEY'];
    if (apiKey == null || apiKey.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("API key introuvable.")),
      );
      return;
    }

    setState(() => isLoading = true);

    try {
      final url =
          "https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=$apiKey&units=metric";
      final response = await http.get(Uri.parse(url));
      if (response.statusCode != 200) {
        throw Exception("Erreur météo: ${response.body}");
      }

      final data = json.decode(response.body);
      setState(() {
        forecast = data["list"];
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erreur: $e")),
      );
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  IconData _getWeatherIcon(String condition) {
    switch (condition.toLowerCase()) {
      case 'clear':
        return WeatherIcons.day_sunny;
      case 'clouds':
        return WeatherIcons.cloud;
      case 'rain':
        return WeatherIcons.rain;
      case 'drizzle':
        return WeatherIcons.sprinkle;
      case 'thunderstorm':
        return WeatherIcons.thunderstorm;
      case 'snow':
        return WeatherIcons.snow;
      case 'mist':
      case 'fog':
      case 'haze':
        return WeatherIcons.fog;
      default:
        return WeatherIcons.na;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(title: const Text("Prévisions Météo")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Entrez une ville",
                border: OutlineInputBorder(),
              ),
              onSubmitted: (value) {
                city = value;
                fetchWeather();
              },
            ),
          ),
          ElevatedButton.icon(
            onPressed: fetchWeather,
            icon: const Icon(Icons.cloud),
            label: const Text("Obtenir la météo"),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : forecast == null
                ? const Center(child: Text("Aucune donnée disponible"))
                : ListView.builder(
              itemCount: forecast!.length,
              itemBuilder: (context, index) {
                final item = forecast![index];
                final date = DateTime.fromMillisecondsSinceEpoch(item["dt"] * 1000);
                final icon = item["weather"][0]["main"];
                final temp = item["main"]["temp"];
                final desc = item["weather"][0]["description"];

                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  color: Colors.deepPurple.shade100,
                  child: ListTile(
                    leading: BoxedIcon(_getWeatherIcon(icon), color: Colors.deepPurple),
                    title: Text(DateFormat('E dd MMM HH:mm').format(date)),
                    subtitle: Text("$desc | ${temp.round()}°C"),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

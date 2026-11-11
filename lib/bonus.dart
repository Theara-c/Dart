import 'package:flutter/material.dart';

class Bonus extends StatelessWidget {
  const Bonus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(),
      appBar: AppBar(title: Text("Bonus")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          spacing: 15,
          children: [
            cardWeather(weather: WeatherData.phnomPenh),
            cardWeather(weather: WeatherData.paris),
            cardWeather(weather: WeatherData.rome),
            cardWeather(weather: WeatherData.toulouse),
          ],
        ),
      ),
    );
  }
}

class cardWeather extends StatelessWidget {
  const cardWeather({super.key, required this.weather});

  final WeatherData weather;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 8,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Container(
              height: 110,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [weather.start, weather.end],
                ),
              ),
            ),

            Positioned(
              right: -30,
              top: -20,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Color(0x22FFFFFF),
                  shape: BoxShape.circle,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                right: 14,
                left: 14,
                top: 14,
                bottom: 18,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipOval(
                child: Image.asset(
                  weather.icon,
                  width: 55,
                  height: 55,
                  fit: BoxFit.cover,
                ),
              ),

                  SizedBox(width: 12),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          weather.city,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Min ${weather.minTemperature}°C",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Max ${weather.maxTemperature}°C",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),

                  // Temperature
                  Text(
                    "${weather.currentTemperature}°C",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum WeatherData {
  phnomPenh(
    city: 'Phnom Penh',
    icon: "assets/ex4/cloudy.png",
    start: Color(0xFF607D8B),
    end: Color(0xFF90A4AE),
    minTemperature: 10.0,
    maxTemperature: 30.0,
    currentTemperature: 12.2,
  ),

  paris(
    city: 'Paris',
    icon: "assets/ex4/sunny.png",
    start: Color(0xFF42A5F5),
    end: Color(0xFF90CAF9),
    minTemperature: 10.0,
    maxTemperature: 40.0,
    currentTemperature: 22.2,
  ),

  rome(
    city: 'Rome',
    icon: "assets/ex4/sunnyCloudy.png",
    start: Color(0xFFFF9800),
    end: Color(0xFFFFCA28),
    minTemperature: 10.0,
    maxTemperature: 40.0,
    currentTemperature: 45.2,
  ),

  toulouse(
    city: 'Toulouse',
    icon: "assets/ex4/veryCloudy.png",
    start: Color(0xFF607D8B),
    end: Color(0xFF90A4AE),
    minTemperature: 10.0,
    maxTemperature: 40.0,
    currentTemperature: 45.2,
  );

  final String city;
  final String icon;
  final Color start;
  final Color end;
  final double minTemperature;
  final double maxTemperature;
  final double currentTemperature;

  const WeatherData({
    required this.city,
    required this.icon,
    required this.start,
    required this.end,
    required this.minTemperature,
    required this.maxTemperature,
    required this.currentTemperature,
  });
}

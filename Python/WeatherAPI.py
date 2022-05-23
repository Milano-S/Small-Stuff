import requests

API_Key = "8e5d32c8fdc64eb9118dfd5676217147"
BASE_URL = "https://api.openweathermap.org/data/2.5/weather"

city = input("Enter a city name :")
request_url = f"{BASE_URL}?appid={API_Key}&q={city}"
response = requests.get(request_url)

if response.status_code == 200:
    data = response.json()
    weather = data["weather"][0]["description"]
    temperature = round(data["main"]["temp"] - 273.15, 2)
    print("Weather :",weather)
    print("Temperature: ,", tempetature, "celsius")

else:
    print("Error")
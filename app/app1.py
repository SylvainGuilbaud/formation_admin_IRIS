from flask import Flask
from flask_cors import CORS
from datetime import datetime
import requests 

app = Flask(__name__)
CORS(app)

@app.route('/test')
def test():
    return "Test"

@app.route('/hello')
def hello_world():
    return {"Hello": "World", "timestamp": datetime.now().isoformat()}

@app.route('/hello/<name>')
def hello(name):
    return {"Hello": f"{name}", "timestamp": datetime.now().isoformat()}

@app.route('/time')
def get_timestamp():
    return {"timestamp": datetime.now().isoformat()}

@app.route('/temperature/<city>')
def get_city_temperature(city):
    try:
        
        # Retrieve latitude and longitude from city parameter
        latitude = None
        longitude = None
        country = None
        # Use geocoding API to dynamically retrieve coordinates
        geo_response = requests.get(f'https://geocoding-api.open-meteo.com/v1/search?name={city}&count=1&language=en&format=json')
        geo_data = geo_response.json()

        if geo_data.get('results'):
            latitude = geo_data['results'][0]['latitude']
            longitude = geo_data['results'][0]['longitude']
            country = geo_data['results'][0]['country']
            city = geo_data['results'][0]['name']
        else:
            return {"error": "City not found"}, 400

        response = requests.get(f'https://api.open-meteo.com/v1/forecast?latitude={latitude}&longitude={longitude}&current=temperature_2m')
        data = response.json()
        return {
                "city": city, 
                "country": country, 
                "temperature": data['current']['temperature_2m'], 
                "unit": "°C", 
                "latitude": latitude, 
                "longitude": longitude,
                "|timestamp": datetime.now().isoformat(), 
            }
    except Exception as e:
        return {"error": str(e)}, 500

if __name__ == "__main__":
    app.run()
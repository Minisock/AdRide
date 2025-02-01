import axios from 'axios';

export const geocodeAddress = async (address) => {
  try {
    const response = await axios.get('https://api.mapbox.com/geocoding/v5/mapbox.places/' + 
      encodeURIComponent(address) + 
      `.json?access_token=${process.env.MAPBOX_TOKEN}&limit=1`);
    
    const [lng, lat] = response.data.features[0].center;
    return {
      lat,
      lng,
      formattedAddress: response.data.features[0].place_name
    };
  } catch (err) {
    throw new Error('Geocoding failed');
  }
};
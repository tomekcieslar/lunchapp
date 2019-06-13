import React, {useState, useEffect} from 'react';

const PlacesList = (props) => {
  const [places, setPlaces] = useState([])

  useEffect(() => {
    setPlaces(props.places)
  }, [props.places])

return (
    places.map( place  => (
      <div>
        <table>
          <thead>
            <tr>
              <th>Miejsce dostawy</th>
              <th>Menu</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>
                <a href={`/delivery_places/${place.id}`}>
                <p>{place.name}</p>
                <p>{place.delivery_time}</p>
                <p>{place.delivery_order_time}</p>
                </a>
              </td>
              <td>
                {place.menu.map( menu => (
                  <p><a href={`/delivery_places/${place.id}/menus/${menu.id}`}>{menu.date}</a></p>
                ))}
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    ))
)};

export default PlacesList;

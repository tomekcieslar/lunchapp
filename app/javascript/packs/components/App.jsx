import React from 'react';
import SearchBar from './SearchBar';
import PlacesList from './PlacesList';
import axios from 'axios'
import {filter} from 'lodash'


class App extends React.Component {
  state = {places: [] }

  onSearchSubmit = async (term) => {
    const response = await axios({
      method: 'get',
      url: 'http://localhost:3000/api/search',
      params: { date: term }
    })
    this.setState({places: response.data})

    console.log(response.data);
  }


  render() {
    return (
      <div className="container" style={{marginTop: '10px '}}>
        <SearchBar onSubmit={this.onSearchSubmit } />
        <PlacesList places={this.state.places}/>
      </div>
    );
  }
}


export default App;

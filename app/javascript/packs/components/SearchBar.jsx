import React from 'react';

class SearchBar extends React.Component {
  state = {term: ''};

  onFormSubmit = (event) => {
    event.preventDefault();
    this.props.onSubmit(this.state.term);
  }

  render () {
    return (
      <div className="">
        <form onSubmit={this.onFormSubmit} className="" >
          <div className="field">
            <input
             type="datetime-local"
             value={this.state.term}
             onChange={(e) => this.setState({term: e.target.value})}
            />
            <button onClick={this.onFormSubmit}>Search</button>
          </div>
        </form>
      </div>
    );
  }
}

export default SearchBar;

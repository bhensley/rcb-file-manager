import React from "react"
import PropTypes from "prop-types"
import axios from 'axios'

class FilesManager extends React.Component {
  state = {
    files = []
  }

  componentDidMount() {
    axios.get('http://localhost:3000/index', {
      headers: {
        'Content-Type': 'application/json'
      }
    }).then(res => {
      console.log(res);
    })
  }

  render () {
    return (
      <React.Fragment>
      </React.Fragment>
    );
  }
}

export default FilesManager

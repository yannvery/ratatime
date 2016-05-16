class Project extends React.Component {
  _handleDelete(event) {
    event.preventDefault();
    if (confirm('Are you sure?')) {
      this.props.onDelete(this.props.project);
    }
  }

  render () {
    return (
      <tr>
        <td>{this.props.project.name}</td>
        <td style={{textAlign: 'right'}}>
          <a className="text-warning" href="#"><i title="" data-toggle="tooltip" data-placement="top" className="glyphicon glyphicon-pencil" data-original-title="Edit"></i></a>
          <a className="text-danger" href="#"><i title="" data-toggle="tooltip" data-placement="top" className="glyphicon glyphicon-trash" data-original-title="Delete" onClick={this._handleDelete.bind(this)}></i></a>
        </td>
      </tr>
    );
  }
}

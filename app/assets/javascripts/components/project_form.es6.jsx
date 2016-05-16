class ProjectForm extends React.Component {

  _handleSubmit(event) {
    event.preventDefault();
    let name = this._name.value;
    if (name !== '') {
      jQuery.ajax({
        method: 'POST',
        url: '/projects',
        dataType: 'json',
        data: { project:
          { name: name }
        },
        success: (project) => {
          this.props.addProject(project)
        }
      });
    } else {
      this._name.focus();
    }

  }

  _valid() {
    if(this._name) {
      this.setState({ valid: true });
    } else {
      this.setState({ valid: false });
    }
    return(this.state.valid);
  }

  render() {
    return(
      <form className="project-form" onSubmit={this._handleSubmit.bind(this)}>
        <div className="project-form-fields">
          <input placeholder="Name:" ref={(input) => this._name = input}/>
        </div>
        <div className="project-form-actions">
          <button type="submit" className="btn btn-primary">
            Add project
          </button>
        </div>
      </form>
    )
  }
}

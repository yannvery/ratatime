class Projects extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      projects: this.props.data
    }
  }

  _getProjects() {
    return this.state.projects.map((project) =>
        <Project project={project} key={project.id} onDelete={this._deleteProject.bind(this)} />
    )
  }

  _addProject(project_attributes){
    const project = {
      id: project_attributes.id,
      name: project_attributes.name,
    };
    this.setState({ projects: this.state.projects.concat([project]) });
  }

  _deleteProject(project){
    jQuery.ajax({
      method: 'DELETE',
      url: `/projects/${project.id}`,
      dataType: 'json'
    });
    const projects = [...this.state.projects];
    const projectIndex = projects.indexOf(project);
    projects.splice(projectIndex, 1);
    this.setState({ projects });
  }

  render() {
    const projects = this._getProjects()
    return (
      <div id="projects">
        <h1>
          Projects
        </h1>
        <ProjectForm addProject={this._addProject.bind(this)} />
        <table className="table">
          <thead>
            <tr>
              <th>Name</th>
              <th></th>
            </tr>
          </thead>
          <tbody>
            { projects }
          </tbody>
        </table>
      </div>
    );
  }
}

@Tracker = React.createClass
  render: ->
    console.log(@props)
    React.DOM.tr null,
      React.DOM.td null, @props.tracker.logged_date
      React.DOM.td null, @props.tracker.duration
      React.DOM.td null, @props.tracker.description

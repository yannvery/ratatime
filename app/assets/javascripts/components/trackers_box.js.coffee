@TrackersBox = React.createClass
  getInitialState: ->
    trackers: @props.data

  getDefaultProps: ->
    trackers: []

  addTracker: (tracker) ->
    trackers = @state.trackers.slice()
    trackers.push tracker
    @setState trackers: trackers

  render: ->
    React.DOM.div
      className: 'trackers'
      React.DOM.h1
        className: 'title'
        'Trackers'
      React.createElement TrackerForm
        React.DOM.hr null
      React.DOM.table
          className: 'table'
          React.DOM.thead null,
            React.DOM.tr null,
              React.DOM.th null, 'Logged date'
              React.DOM.th null, 'Duration'
              React.DOM.th null, 'Description'
          React.DOM.tbody null,
            for tracker in @state.trackers
              React.createElement Tracker, key: tracker.id, tracker: tracker

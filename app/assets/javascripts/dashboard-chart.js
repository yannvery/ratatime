function display_dashboard_chart(canvas){
  var labels = canvas.data("labels")
  var values = canvas.data("values")
  var colors = canvas.data("colors")
  var ctx = canvas;
  var data = {
    labels: labels,
    datasets: [
      {
        data: values ,
        backgroundColor: colors,
        hoverBorderWidth:  [0,0],
        borderWidth: [0, 0],
      }]
  };
  var myChart = new Chart(ctx, {
      type: 'doughnut',
      data: data,
      options: {
        tooltips: {
          enabled: false
        }
      }
  });
}

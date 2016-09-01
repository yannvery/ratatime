function display_dashboard_chart(ctx){
  var labels = ctx.data("labels")
  var values = ctx.data("values")
  var colors = ctx.data("colors")
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

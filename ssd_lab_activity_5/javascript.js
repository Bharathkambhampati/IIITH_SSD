<script>
var arr = new Array(20);
for (var i = 0; i < gfg.length; i++)
{
      arr[i] =new array(2);
}
var count=0;
function add()
{
  var html = "<table border='1|1'>";
for (var i = 0; i < count; i++) {
  html+="<tr>";
  html+="<td>"+arr[i][0]+"</td>";
  html+="<td>"+arr[i][1]+"</td>";
  html+="</tr>";
}
    html+="<tr>";
    html+="<td>"+document.getElementById("rno").value+"</td>";
    html+="<td>"+document.getElementById("name").value+"</td>";
    html+="</tr>";
    html+="</table>";
    count=count+1;
document.getElementById("box").innerHTML = html;
}
</script>

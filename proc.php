<html>
    <body style="background-color:grey">
    <h1 style="background-color:WHITE;text-align:center">PERCENTAGE OF FUND USED</h1>
</br>
</br>
<div style="text-align:center">
<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "mydb";
$temp = $_POST["id"];
 //$temp=filter_input(INPUT_POST,'id');

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "CALL percentage_calc($temp);";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) 
    {
        echo "PROJECT_NAME: ".$row['project_name']."  <br/>  ";
        echo "<br>";
        echo "AMOUNT_USED_PERCETAGE: ".$row['Amount_Used_percentage']. " <br/>  ";
    }
}
else {
    echo "0 results";
}

$conn->close();
?> 
</div>
</body>
</html>
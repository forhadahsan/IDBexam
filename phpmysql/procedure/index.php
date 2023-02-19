
<?php 
    if(isset($_POST['submit']))
    {
        $db = new mysqli("localhost","root","","phpexam");
        $name = $_POST['name'];
        $contact = $_POST['contact'];

        $db->query("call ad_company('$name','$contact')");
        echo "Successfully";
        header('refresh:5');
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>procedure</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
</head>
<body>
    
    <div class="container">

        <div   class="row  mx-auto p-3 mb-2 bg-dark text-white"> 
    
   
            <form action="#" method="post">
                <div class="form-group">
                    <label for=""><b> Name</b> </label> 
                    <input  class="form-control" type="text" name="name" >  
                </div>
                <div class="form-group">
                    <label  for=""> <b>Contact </b></label> 
                    <input  class="form-control" type="text" name="contact"> <br>
                </div>
                <input type="submit" class="btn btn-success"; name="submit" value="send">
            </form>
         </div>
    </div>
</body>
</html>